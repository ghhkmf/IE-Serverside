package com.sbu.service.impl;

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
}






