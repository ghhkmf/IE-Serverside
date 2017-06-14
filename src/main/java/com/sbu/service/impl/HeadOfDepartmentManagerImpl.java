package com.sbu.service.impl;

import com.dao.entity.Lesson;
import com.dao.entity.Studenttermlessonteacher;
import com.dao.entity.Term;
import com.dao.entity.Teacher;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sbu.dao.impl.UserDAOImpl;
import com.dao.entity.User;
import com.sbu.controller.model.CourseModel;
import com.sbu.controller.model.TermModel;
import com.sbu.controller.model.UserModel;
import com.sbu.dao.impl.HeadOfDepartmentDAOImpl;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Service
public class HeadOfDepartmentManagerImpl /*implements UserManager*/ {

  

    
    public HeadOfDepartmentManagerImpl() {
    }

    @Autowired
    public HeadOfDepartmentDAOImpl headOfDepartmentDAOImpl;

   // @Override
    public void insertNewCourse(CourseModel newCourse) {
       headOfDepartmentDAOImpl.insertNewCourse(newCourse);  
    }
    
    public void insertNewTerm(TermModel newTerm) {
       headOfDepartmentDAOImpl.insertNewTerm(newTerm);  
    }
    
    
       // @Override
    public List<CourseModel> findCourseByType(String type) {
       return headOfDepartmentDAOImpl.findCourseByType(type);  
    }
   
    //update 
    public void updateCourseByCode(CourseModel course)
    {
       // System.out.println("com.sbu.service.impl.HeadOfDepartmentManagerImpl.updateCourseByCode()");
        headOfDepartmentDAOImpl.updateCourseByCode(course);
    }
    
   
    public List<Term> findTerm ()
    {
        return headOfDepartmentDAOImpl.findTerm();

    }
    
    public List<Teacher> findTeacher ()
    {
        return headOfDepartmentDAOImpl.findTeachers();

    }
    
     public List<Lesson> findTermLessonTeacher(Integer termCode , Integer userCode)
     {
         return headOfDepartmentDAOImpl.findTermLessonTeacher(termCode , userCode);
     }
    
     
      public List<Studenttermlessonteacher> findStudentTermLessonTeacher(Integer teacherCodeInt ,Integer termCodeInt ,Integer thisLessonIdInt)
     {
         //System.out.println(" Manager resulttttt " );
         return  headOfDepartmentDAOImpl.findStudentTermLessonTeacher(teacherCodeInt ,termCodeInt ,thisLessonIdInt);
         
     }
      
       public void insertMark2(String[] termid, String[] thisLessonId, String[] mark, String[] studentId , Integer teacherId) {
      
        headOfDepartmentDAOImpl.insertMark2(termid, thisLessonId, mark, studentId , teacherId);
       
    }
      
      
     
}






