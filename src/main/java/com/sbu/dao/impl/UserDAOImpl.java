package com.sbu.dao.impl;

import com.dao.entity.User;
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
public class UserDAOImpl /*implements UserDAO*/ {

    public UserDAOImpl() {
    }
  
    @PersistenceContext
    public EntityManager entityManager;


    

    public User findUser(Integer code)
    {
        List<User> findedUsers = entityManager.createNamedQuery("User.findByCode").setParameter("code", code).getResultList();
        if(!findedUsers.isEmpty())
            return findedUsers.get(0);
        else
        {
            System.err.println("Query Not Found");
            return null;
        }
    }
       
    @Transactional
    public void updateUserByCode(UserModel user)
    {
        List<User> findedUsers = entityManager.createNamedQuery("User.findByCode").setParameter("code", user.getCode()).getResultList();
        if(!findedUsers.isEmpty())
        {
            User user1 = findedUsers.get(0);
            user1.setAddress(user.getAddress());
            user1.setEmail(user.getEmail());
            user1.setFname(user.getfName());
            user1.setLname(user.getlName());
            user1.setNationalcode(user.getPassword());
            user1.setPhone(Integer.parseInt(user.getPhone()));
            user1.setPassword(user.getPassword());
           // System.out.println("melikaaaaaaaaaaaaa" +user.getfName());             
        }
        else
        {
            System.err.println("Query Not Found");
            
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
