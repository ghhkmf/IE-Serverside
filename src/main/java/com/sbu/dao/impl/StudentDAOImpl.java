
package com.sbu.dao.impl;

import com.dao.entity.User;
import com.dao.entity.Student;
import java.util.List;
import javax.persistence.Entity;
import com.sbu.controller.model.UserModel;
import com.sbu.controller.model.StudentModel;
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
public class StudentDAOImpl /*implements UserDAO*/ {

    public StudentDAOImpl() {
    }
  
    @PersistenceContext
    public EntityManager entityManager;


    @Transactional
    public Student findStudentByCode(Integer code)
    {
        List<Student> foundStudent = entityManager.createNamedQuery("Student.findByUserCode").setParameter("usercode" , code).getResultList();
        if(!foundStudent.isEmpty())
        {
            Student s = foundStudent.get(0);
              return s;
        }
           
        else
        {
            System.err.println("Query Not Found");
            return null;
        }

    }
    

//    @Override
//    @Transactional
//    public void insertUser(User2 user) {
//        //entityManager.getTransaction().begin();
//        entityManager.persist(user);
//        //entityManager.getTransaction().commit();
//    }

//    @Override
//    public List<User2> findAllUsers() {
//        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
//        CriteriaQuery<User2> cq = builder.createQuery(User2.class);
//        Root<User2> root = cq.from(User2.class);
//        cq.select(root);
//        return entityManager.createQuery(cq).getResultList();
//    }

}
