package com.sbu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.sbu.controller.model.TermLessonTeacherModel;
import com.sbu.controller.model.CourseModel;
import com.sbu.dao.impl.UserDAOImpl;
import com.sbu.dao.impl.StudentDAOImpl;
import com.sbu.dao.impl.TeacherDAOImpl;
import com.dao.entity.Student;
import com.dao.entity.Lesson;
import com.dao.entity.Studenttermlessonteacher;
import com.dao.entity.Teacher;
import com.dao.entity.User;
import com.dao.entity.Term;
import com.dao.entity.Termlessonteacher;
import com.sbu.controller.model.UserModel;
import com.sbu.controller.model.StudentModel;
import com.sbu.controller.model.TeacherModel;
import com.sbu.controller.model.TermLessonTeacherModel;

@Service
public class TeacherManagerImpl /*implements UserManager*/ {

    public TeacherManagerImpl() {
    }

    
        @Autowired
    public TeacherDAOImpl TeacherDAOImpl;
//
//    //@Override
//    @Transactional
//    public void insertUser(User2 user) {
//        userDAOImpl.insertUser(user);
//    }
//
    //@Override
 //   public List<User> findAllUsers() {
 //      return userDAOImpl.findAllUsers();
 //   }
    
   // @Override
    public TeacherModel findTeacherByCode(Integer code) {
        Teacher found = TeacherDAOImpl.findTeacherByCode(code);
        
        if(found != null)
        {
            TeacherModel t = new TeacherModel();
            t.setId(found.getId());
            t.setCode(found.getCode());            
            t.setBeginSemesterId(found.getBeginsemesterid().getId());
            t.setEduGroup(found.getEdugroup());
            t.setDegree(found.getDegree());
            t.setIsMGR(found.getIsmgr());
            t.setUserCode(found.getUsercode().getCode());
            return t;
        }
        return null;
    }
    
    
    public List<Term> findTerm ()
    {
        return TeacherDAOImpl.findTerm();

    }
    
    
     public List<Lesson> findTermLessonTeacher(Integer termCode , Integer userCode)
     {
         return TeacherDAOImpl.findTermLessonTeacher(termCode , userCode);
     }
     
     public List<User> findStudentTermLessonTeacher(Integer teacherCodeInt ,Integer termCodeInt ,Integer thisLessonIdInt)
     {
         //System.out.println(" Manager resulttttt " );
         return  TeacherDAOImpl.findStudentTermLessonTeacher(teacherCodeInt ,termCodeInt ,thisLessonIdInt);
         
     }
}






