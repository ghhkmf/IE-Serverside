package com.sbu.dao.impl;

import com.dao.entity.Lesson;
import com.dao.entity.Studenttermlessonteacher;
import com.dao.entity.Term;
import com.dao.entity.Teacher;
import com.dao.entity.User;
import com.sbu.controller.model.CourseModel;
import com.sbu.controller.model.TermModel;
import com.sbu.controller.model.UserModel;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.Entity;

import javax.persistence.EntityManager;
import javax.persistence.NamedQuery;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

//import com.sbu.dao.model.User2;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class HeadOfDepartmentDAOImpl /*implements UserDAO*/ {

    public HeadOfDepartmentDAOImpl() {
    }
  
    @PersistenceContext
    public EntityManager entityManager;


    @Transactional
    public void insertNewCourse(CourseModel newCourse)
    {
        Lesson l = new Lesson();
        l.setCode(newCourse.getCode());
        l.setName(newCourse.getName());
        l.setType(newCourse.getType());
        l.setUnit(newCourse.getUnit());
        entityManager.persist(l);

    }
    
    
    @Transactional
    public void insertNewTerm(TermModel newTerm)
    {
        Term t = new Term();
        String year = newTerm.getTermYear();
        String semester = newTerm.getSemester();
                System.out.println("dsnjffnsd"+ year + semester);

        t.setCode(Integer.parseInt(year.concat(semester)));
        t.setSemester(newTerm.getSemester());
        t.setType(newTerm.getType());
        t.setTermyear(newTerm.getTermYear());
        entityManager.persist(t);

    }
    
    
    public List<CourseModel> findCourseByType ( String type)
    {
        List<CourseModel> foundCourse = null;
        if ( type.equals("all"))
            foundCourse = entityManager.createNamedQuery("Lesson.findAll").getResultList();
        else
            foundCourse = entityManager.createNamedQuery("Lesson.findByType").setParameter("type" , type).getResultList();
        
        if(!foundCourse.isEmpty())
        {
           // Lesson s = foundCourse.get(0);
              return foundCourse;
        }
        else
        {
            System.err.println("Query Not Found");
            return null;
        }
     }

    
    //update 
    @Transactional
    public void updateCourseByCode(CourseModel course)
    {
        System.out.print("inside updateCOurse");
        
        List<Lesson> findedUsers = entityManager.createNamedQuery("Lesson.findByCode").setParameter("code", course.getCode()).getResultList();
        if(!findedUsers.isEmpty())
        {
            Lesson lesson1 = findedUsers.get(0);
            System.out.print("lesssson " + lesson1.getCode());
            lesson1.setType(course.getType());
            lesson1.setUnit(course.getUnit());
            lesson1.setName(course.getName());
           // System.out.println("melikaaaaaaaaaaaaa" +user.getfName());             
        }
        else
        {
            System.err.println("Query Not Found");
            
        }
    }
    
    
     public List<Term> findTerm()
    {
        return entityManager.createNamedQuery("Term.findAll").getResultList();
       
    }
     
      public List<Teacher> findTeachers()
    {
        return entityManager.createNamedQuery("Teacher.findAll").getResultList();
       
    }
     
     @Transactional
    public List<Lesson> findTermLessonTeacher(Integer termCode , Integer userCode)
    {
            Integer lessonid = 3; 
            Query qu = entityManager.createQuery("SELECT l FROM  Lesson l WHERE  l.code IN "
            + "( SELECT t FROM Termlessonteacher t WHERE t.teacherid.code = :teacherid  AND  t.termid.code = :termid)");
            //Query qu = entityManager.createQuery("SELECT t FROM Termlessonteacher t  WHERE t.teacherid.code = :teacherid  AND  t.termid.code = :termid");
            qu.setParameter("teacherid" , userCode);
            qu.setParameter("termid" , termCode);
            List<Lesson> lessonlist =  qu.getResultList();
            
            //System.out.println("ll issssssssss"); //+ res.toString() );
         
         return lessonlist;
    }
    
    
        
    @Transactional

    public List<Studenttermlessonteacher> findStudentTermLessonTeacher(Integer teacherCodeInt ,Integer termCodeInt ,Integer thisLessonIdInt)
    {
        Query qu1;
        qu1 = entityManager.createQuery("SELECT stlt FROM Studenttermlessonteacher stlt WHERE stlt.termlessonteacherid.id IN  " 

                + "(SELECT t FROM Termlessonteacher t"
                + " WHERE  t.termid.code = :termid AND t.teacherid.code = :teacherid AND t.lessonid.code = :lessonid)" );      
        qu1.setParameter("termid", termCodeInt );
        qu1.setParameter("teacherid", teacherCodeInt );
        qu1.setParameter("lessonid", thisLessonIdInt );
        
        List<Studenttermlessonteacher> result = qu1.getResultList();
       
        return result;
    }
    
    
     @Transactional

        public void insertMark2(String[] termId, String[] LessonId, String[] mark, String[] studentId , Integer teacherid)
     {
         if(mark.length != 0)
         {
            Integer termid = Integer.parseInt(termId[0]);
            Integer lessonid = Integer.parseInt(LessonId[0]);

            Query qu1 , qu2;
            qu1 = entityManager.createQuery("SELECT t.id FROM Termlessonteacher t WHERE t.termid.code = :termId  AND t.teacherid.code = :teacherId AND t.lessonid.code = :lessonId ");
            qu1.setParameter("termId", termid);
            qu1.setParameter("teacherId", teacherid);
            qu1.setParameter("lessonId", lessonid);

            List<Integer> resultId = qu1.getResultList();
            Integer termlessonteacherid = resultId.get(0); // Integer.parseInt(str);

            
           qu2 = entityManager.createQuery("SELECT s FROM Studenttermlessonteacher s WHERE s.termlessonteacherid.id = :termlessonteacherid");
           qu2.setParameter("termlessonteacherid", termlessonteacherid);           
           List<Studenttermlessonteacher> selectResult = qu2.getResultList();   // get all students having this lesson with this teacher in yhis term

           
           List<String> studentIdList = Arrays.asList(studentId);
           for( int i=0; i<studentId.length; i++)
           {
               int index = studentIdList.indexOf(selectResult.get(i).getStudentid().getCode().toString());
               int markInt = Integer.parseInt(mark[index]);
               selectResult.get(i).setMark(markInt);
           }
          // System.out.println("befor bulkkkkkkkkkk" +  selectResult.get(0).getMark() );
         

        }
     }

    

}
