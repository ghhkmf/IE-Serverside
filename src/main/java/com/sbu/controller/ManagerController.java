/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sbu.controller;

import com.sbu.controller.model.CourseModel;
import com.sbu.controller.model.TermModel;
import com.sbu.service.impl.HeadOfDepartmentManagerImpl;
import com.sbu.service.impl.UserManagerImpl;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/headOfDepartment")
public class ManagerController {

    @Autowired
    public UserManagerImpl userManagerImpl;
    
   
    @Autowired
    public HeadOfDepartmentManagerImpl headOfDepartmentManagerImpl;
    
 
   ///////////////////////////////////////////
   
     //show newOrEditCourse page
   	@RequestMapping(value = "showInsertCoursePage", method = RequestMethod.GET)
	public String showInsertCoursePage(Model model, HttpSession session) {
             String userRole = ""; 
             if(session.getAttribute("userCode") != null)
              {
                userRole = session.getAttribute("userRole").toString();
                //if(Integer.parseInt(userRole) == 1)
                {                    
                    return "newOrEditCourse";
                }
              }
              return "redirect:/login";
	}
        
        //show defineNewTerm
      @RequestMapping(value = "showDefineNewTermPage", method = RequestMethod.GET)
	public String showDefineNewTermPage(Model model, HttpSession session) {
             String userRole = ""; 
             if(session.getAttribute("userCode") != null)
              {
                userRole = session.getAttribute("userRole").toString();
                if(Integer.parseInt(userRole) == 2)
                {                    
                    return "defineNewTerm";
                }
              }
              return "redirect:/login";
	}     
               
     //insertCourse
   	@RequestMapping(value = "insertCourse", method = RequestMethod.POST)
	public String insertCourse(HttpSession session , @ModelAttribute("SpringWeb")CourseModel course , Model model ) {
                String userRole = ""; 
             if(session.getAttribute("userCode") != null)
              {
                userRole = session.getAttribute("userRole").toString();
                 //if(Integer.parseInt(userRole) == 1)
                {         
                    CourseModel tempCourse = new CourseModel();
                    tempCourse.setCode(course.getCode());
                    tempCourse.setName(course.getName());   
                    tempCourse.setType(course.getType());
                    tempCourse.setUnit(course.getUnit());
                   
                    headOfDepartmentManagerImpl.insertNewCourse(tempCourse);

                    return "/newOrEditCourse";              
                }
               
              }
             else
                 return "redirect:/login";
	}
        
        //insertTerm
   	@RequestMapping(value = "insertTerm", method = RequestMethod.POST)
	public String insertTerm(HttpSession session , @ModelAttribute("SpringWeb")TermModel term , Model model ) {
                String userRole = ""; 
             if(session.getAttribute("userCode") != null)
              {
                userRole = session.getAttribute("userRole").toString();
                 //if(Integer.parseInt(userRole) == 1)
                {                            
                    headOfDepartmentManagerImpl.insertNewTerm(term);

                    return "/defineNewTerm";              
                }
               
              }
             else
                 return "redirect:/login";
	}
        
        //////////////////////////////////

           //show cource   
        
        @RequestMapping(value = "showCourse", method = RequestMethod.POST)
	public String showCourse(HttpSession session , @ModelAttribute("SpringWeb") CourseModel type , Model model ) {
                String userCode = ""; 

             if(session.getAttribute("userCode") != null)
              {
                List<CourseModel> lesson =  headOfDepartmentManagerImpl.findCourseByType(type.getType());
		model.addAttribute("lesson", lesson);  
                    return "/newOrEditCourse";
              }
             else
                 return "redirect:/login";
	}
                
         ///////////////////////////////////////////////
        
        //update
        
         //edit profile
   	@RequestMapping(value = "/editCourse", method = RequestMethod.POST)
	public boolean editCourse(String name, String code, String unit, String type) {
                
             //System.out.println("com.sbu.controller.ManagerController.editCourse()"+ name + code+unit+type);
             CourseModel course = new CourseModel();
             course.setName(name);
             course.setCode(Integer.parseInt(code));
             course.setUnit(Integer.parseInt(unit));
             course.setType(type);
            // System.out.println("Nameeeee"+ course.getName());
             //System.out.println("codeeee"+ course.getCode());
             //System.out.println("typeeee"+ course.getType());
             //System.out.println("Unitttt"+ course.getUnit());

             headOfDepartmentManagerImpl.updateCourseByCode(course);
             return true;
        }
        
     
}