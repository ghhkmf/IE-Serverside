/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sbu.controller;

import javax.servlet.http.HttpSession;
import com.sbu.controller.model.UserModel;
import com.sbu.controller.model.TeacherModel;

import com.dao.entity.Student;
import com.sbu.controller.model.StudentModel;
import com.sbu.controller.model.StudenttermavgModel;
import com.sbu.service.impl.UserManagerImpl;
import com.sbu.service.impl.StudentManagerImpl;
import com.sbu.service.impl.TeacherManagerImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    public UserManagerImpl userManagerImpl;
    
    @Autowired
    public StudentManagerImpl studentManagerImpl;
    
    @Autowired
    public TeacherManagerImpl teacherManagerImpl;
    
    
   @RequestMapping(value = "submit", method = RequestMethod.GET)
   public String student() {
      return "student";
   }
   
   //just view profile
   @RequestMapping(value = "profile", method = RequestMethod.GET)
   public String profile() {
       
      return "/studentInformation";
   }
   
    //show list of terms
   @RequestMapping(value = "StudentSemesterInformation", method = RequestMethod.GET)
   public String StudentSemesterInformation() {
       
      return "/StudentSemesterInformation";
   }
   
   
 
   ///////////////////////////////////////////
   
     //show profile
   	@RequestMapping(value = "showProfile", method = RequestMethod.GET)
	public String showProfile(Model model, HttpSession session) {
                String userCode = ""; 
             if(session.getAttribute("userCode") != null)
              {
                userCode = session.getAttribute("userCode").toString();
                UserModel user = userManagerImpl.findUserByCode(Integer.parseInt(userCode));
		model.addAttribute("user", user);  
                
                String uRole_str = user.getUrole().toString();
                Integer urole_int = Integer.parseInt(uRole_str);
                if( urole_int == 0 )  //student
                {
                    StudentModel student = studentManagerImpl.findStudentByCode(Integer.parseInt(userCode));               
                    model.addAttribute("student", student);
                    return "/studentInformation";
                }
                else //teacher or manager
                {
                    TeacherModel teacher = teacherManagerImpl.findTeacherByCode(Integer.parseInt(userCode));               
                    model.addAttribute("teacher", teacher); 
                    if( urole_int == 1 ) //teacher
                        return "/TeacherInformation";
                    else
                        return "/HeadOfDepartmentInformation";                        
                }

              }
             else
                 return "redirect:/login";
	}
        
        //////////////////////////////////////////////////
        
        
     //edit profile
   	@RequestMapping(value = "editProfile", method = RequestMethod.POST)
	public String editProfile(HttpSession session , @ModelAttribute("SpringWeb")UserModel user1 , Model model ) {
                String userCode = ""; 

             if(session.getAttribute("userCode") != null)
              {
                    userCode = session.getAttribute("userCode").toString();
                    UserModel tempUser = new UserModel();
                    tempUser.setCode(Integer.parseInt(userCode));
                    tempUser.setlName(user1.getlName());
                    tempUser.setfName(user1.getfName());   
                    tempUser.setEmail(user1.getEmail());   
                    tempUser.setPhone(user1.getPhone());   
                    tempUser.setNationalCode(user1.getNationalCode());
                    tempUser.setPassword(user1.getPassword());   
                    userManagerImpl.updateUserByCode(tempUser);


//                   UserModel user = userManagerImpl.findUserByCode(Integer.parseInt(userCode));               
//                    String uRole_str = user.getUrole().toString();
//                    Integer urole_int = Integer.parseInt(uRole_str);
                   // if( urole_int == 0 )  //student          
                        //return "redirect:/studentInformation";
                        return "redirect:showProfile";
//                    else 
//                    {
//                        if ( urole_int == 1)
//                            return "redirect:/TeacherInformation";
//                        else // if ( urole_int == 2)      
//                            return "redirect:showProfile";
//                    }
              }
             else
                 return "redirect:/login";
	}
   @RequestMapping(value = "loadSemestersInfo", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<StudenttermavgModel> loadSemestersInfo(HttpSession session , Model model ) {
            System.out.println("com.sbu.controller.StudentController.loadSemestersInfo()");
                String userCode = ""; 
               // System.out.print("termid here"+termid);
                userCode = session.getAttribute("userCode").toString();
                Integer userCodeInt = Integer.parseInt(userCode);
                List<StudenttermavgModel> semesterList = studentManagerImpl.findStudentSemesters(userCodeInt);
                
                System.out.println("com.sbu.controller.StudentController.loadSemestersInfo()");
                System.out.println("list of semesters" + semesterList.toString());
                return  semesterList; 
	}

}
