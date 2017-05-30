package com.sbu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sbu.dao.impl.UserDAOImpl;
import com.sbu.dao.impl.StudentDAOImpl;
import com.dao.entity.Student;
import com.dao.entity.User;
import com.sbu.controller.model.UserModel;
import com.sbu.controller.model.StudentModel;

@Service
public class StudentManagerImpl /*implements UserManager*/ {

    public StudentManagerImpl() {
    }

    @Autowired
    public StudentDAOImpl StudentDAOImpl;
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
    public StudentModel findStudentByCode(Integer code) {
        Student found = StudentDAOImpl.findStudentByCode(code);
        
        if(found != null)
        {
            StudentModel s = new StudentModel();
            s.setId(found.getId());
            s.setBeginSemesterId(found.getBeginsemesterid().getId());
            s.setOrientationId(found.getOrientationid().getId());
            s.setQouta(found.getQouta());
            s.setSupervisorId(found.getSupervisorid().getCode());
            s.setUserCode(found.getUsercode().getCode());
            return s;
        }
        return null;
    }
}






