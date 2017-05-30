/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sbu.controller;

import com.sbu.controller.model.UserModel;
import com.sbu.service.impl.UserManagerImpl;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("login")
public class LoginController {

    @Autowired
    public UserManagerImpl userManagerImpl;
    
    
   @RequestMapping(value = "", method = RequestMethod.GET)
   public String login(HttpSession session) {
        String userCode = "";
        String userRole = "";
        //session.setAttribute("userId", 1);
        //session.setAttribute("userRole", "std");
        //System.out.println("addedfeature" + session.getAttribute("userId").toString());
        if(session.getAttribute("userCode") != null)
        {
            userCode = session.getAttribute("userCode").toString();
            
            if(session.getAttribute("userRole") != null)
            {
                userRole = session.getAttribute("userRole").toString();
                if(Integer.parseInt(userRole) == 0)
                   return "studentHome";
                else if(Integer.parseInt(userRole) == 1)
                    return "TeacherHome";
                else
                    return "HeadOfDepartmentHome";
            }
        }
      return "Login";
   }
   
   @RequestMapping(value = "check", method = RequestMethod.POST)
   public String check(HttpSession session, @ModelAttribute("SpringWeb")UserModel user, Model model) {
      
        Integer code = user.getCode();
        String pass = user.getPassword();
       
              System.out.println("pass" + user.getPassword());

        UserModel u = userManagerImpl.findUser(code, pass);
        
       if(u != null)
       {
            System.out.println("jdndfs" + u.getCode());
            System.out.println("jdndfs" + u.getUrole());
            session.setAttribute("userCode", code);
            session.setAttribute("userRole", u.getUrole());
            
            Integer role = u.getUrole();
            if(role == 0)
                return "studentHome";
            else if(role == 1)
                return "TeacherHome";
//            else
//                return ;
       }
      return "redirect:/login";

   }
   
   //logout
   @RequestMapping(value = "logout", method = RequestMethod.GET)
   public String logout(HttpSession session) {
       session.invalidate();
        
      return "redirect:/login";
   }
   
    
   
}