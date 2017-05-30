package com.sbu.dao.impl;

import com.dao.entity.Lesson;
import com.dao.entity.Term;
import com.dao.entity.User;
import com.sbu.controller.model.CourseModel;
import com.sbu.controller.model.TermModel;
import com.sbu.controller.model.UserModel;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.Entity;

import javax.persistence.EntityManager;
import javax.persistence.NamedQuery;
import javax.persistence.PersistenceContext;
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

}
