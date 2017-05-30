package com.sbu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sbu.dao.impl.UserDAOImpl;
import com.dao.entity.User;
import com.sbu.controller.model.UserModel;


@Service
public class UserManagerImpl /*implements UserManager*/ {

    public UserManagerImpl() {
    }

    @Autowired
    public UserDAOImpl userDAOImpl;
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
    public UserModel findUser(Integer code, String password) {
        User found = userDAOImpl.findUser(code);
        if(found != null && (found.getPassword().equals(password)))
        {
            UserModel u = new UserModel();
            u.setCode(found.getCode());
            u.setUrole(found.getUrole());         
            return u;
        }
        return null;
    }
    
    public UserModel findUserByCode(Integer code) {
        User found = userDAOImpl.findUser(code);
        if(found != null)
        {
            UserModel u = new UserModel();
            u.setCode(found.getCode());
            u.setAddress(found.getAddress());
            u.setBirthDate(found.getBirthdate().toString());
            u.setEmail(found.getEmail());
            u.setGender(found.getGender());
            u.setId(found.getId());
            u.setNationalCode(found.getNationalcode());
            u.setPassword(found.getPassword());
            u.setPhone(found.getPhone().toString());
            u.setUrole(found.getUrole());
            u.setfName(found.getFname());
            u.setlName(found.getLname());

            return u;
        }
        return null;
    }
    
    public void updateUserByCode (UserModel user) {
        userDAOImpl.updateUserByCode(user);
    }
    
}






