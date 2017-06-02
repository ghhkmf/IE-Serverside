package com.sbu.dao.impl;

import com.dao.entity.Lesson;
import com.dao.entity.Student;
import com.dao.entity.Studenttermlessonteacher;
import com.dao.entity.Teacher;
import com.dao.entity.Term;
import com.dao.entity.Termlessonteacher;
import com.dao.entity.User;
import com.sbu.controller.model.CourseModel;
import com.sbu.controller.model.StudentModel;
import com.sbu.controller.model.TermLessonTeacherModel;
import com.sbu.controller.model.UserModel;
import java.util.ArrayList;
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
import org.springframework.transaction.annotation.Transactional;

@Repository
public class TeacherDAOImpl /*implements UserDAO*/ {

    public TeacherDAOImpl() {
    }
  
    @PersistenceContext
    public EntityManager entityManager;


    @Transactional
    public Teacher findTeacherByCode(Integer code)
    {
        List<Teacher> foundTeacher = entityManager.createNamedQuery("Teacher.findByUserCode").setParameter("usercode" , code).getResultList();
        if(!foundTeacher.isEmpty())
        {
            Teacher s = foundTeacher.get(0);
              return s;
        }
           
        else
        {
            System.err.println("Query Not Found");
            return null;
        }

    }
    
    
    public List<Term> findTerm()
    {
        return entityManager.createNamedQuery("Term.findAll").getResultList();
       
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
    public List<User> findStudentTermLessonTeacher(Integer teacherCodeInt ,Integer termCodeInt ,Integer thisLessonIdInt)
    {
        Query qu;
        qu = entityManager.createQuery("SELECT u FROM User u WHERE u.code IN "
                + "(SELECT s.studentid.code FROM Studenttermlessonteacher s"
                + " WHERE s.termlessonteacherid.id IN "
                + "(SELECT t FROM Termlessonteacher t"
                + " WHERE  t.termid.code = :termid AND t.teacherid.code = :teacherid AND t.lessonid.code = :lessonid))");
        
        qu.setParameter("termid", termCodeInt );
        qu.setParameter("teacherid", teacherCodeInt );
        qu.setParameter("lessonid", thisLessonIdInt );
        
        List<User> studentlist = qu.getResultList();
      //  String t = studentlist.get(0).getUsercode().getCode().toString();
      // System.out.println("DAO resulttttttt ID: " + t );
        
        return studentlist;
    }

}
