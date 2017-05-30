/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sbu.controller;
import com.dao.entity.Lesson;
import com.dao.entity.Term;
import com.dao.entity.Termlessonteacher;
import com.sbu.controller.model.CourseModel;
import com.sbu.controller.model.TermLessonTeacherModel;
import com.sbu.service.impl.TeacherManagerImpl;
import com.sbu.service.impl.UserManagerImpl;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/Teacher")
public class TeacherController {

    @Autowired
    public UserManagerImpl userManagerImpl;
    
   
    @Autowired
    public TeacherManagerImpl teacherManagerImpl;
    

    
 
   ///////////////////////////////////////////
   
     //show course page   term drop down
   	@RequestMapping(value = "showCoursePage", method = RequestMethod.GET)
	public String showCoursePage(Model model, HttpSession session) {
             String userCode = ""; 
             if(session.getAttribute("userCode") != null)
              {
                List<Term> term = teacherManagerImpl.findTerm();  
                model.addAttribute("termlist", term); 
                userCode = session.getAttribute("userCode").toString();
               // if(Integer.parseInt(userCode) == 1)
                   return "CoursesTeacher";
               // else
                 //   return "CoursesManager";
              }
              return "redirect:/login";
	}
              
                
     //insertCourse
//   	@RequestMapping(value = "insertCourse", method = RequestMethod.POST)
//	public String insertCourse(HttpSession session , @ModelAttribute("SpringWeb")CourseModel course , Model model ) {
//                String userCode = ""; 
//                System.out.println("inside insertCourse function");
//             if(session.getAttribute("userCode") != null)
//              {
//                userCode = session.getAttribute("userCode").toString();
//                 //if(Integer.parseInt(userCode) == 1)
//                {         
//                    System.out.println("codeeee" + course.getCode());
//                    System.out.println("nameeee" + course.getName());
//                    System.out.println("typeeeee" + course.getType());
//                    System.out.println("unitttt" + course.getUnit());
//
//                    CourseModel tempCourse = new CourseModel();
//                    tempCourse.setCode(course.getCode());
//                    tempCourse.setName(course.getName());   
//                    tempCourse.setType(course.getType());
//                    tempCourse.setUnit(course.getUnit());
//                   
//                    headOfDepartmentManagerImpl.insertNewCourse(tempCourse);
//
//                    return "/newOrEditCourse";              
//                }
//               
//              }
//             else
//                 return "redirect:/login";
//	}
        
        //////////////////////////////////

           //show cource   
        
        @RequestMapping(value = "showCourse", method = RequestMethod.POST)
	public @ResponseBody String   showCourse(HttpSession session , String termid , Model model ) {
                String userCode = ""; 
                userCode = session.getAttribute("userCode").toString();
                Integer userCodeInt = Integer.parseInt(userCode);
                Integer termCodeInt =  Integer.parseInt(termid);

                //System.out.println("termid" + termid.toString());
                List<Lesson> lesson = teacherManagerImpl.findTermLessonTeacher( termCodeInt , userCodeInt);                
		//model.addAttribute("lessonlist", lesson);            
               Lesson response = lesson.get(0);

                
               System.out.println("unitttttttttttttt");
                    return  "me";  // "/CoursesTeacher" ; // "me" ; //  "/CoursesTeacher";
	}
                
         ///////////////////////////////////////////////
        
        //update
        
         //edit profile
//   	@RequestMapping(value = "/editCourse", method = RequestMethod.POST)
//	public @ResponseBody boolean editCourse(@RequestBody CourseModel course) {
//                
//             System.out.println("com.sbu.controller.ManagerController.editCourse()");
//             headOfDepartmentManagerImpl.updateCourseByCode(course);
//            return true;
//        }
//        
     
}