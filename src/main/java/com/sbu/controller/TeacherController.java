/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sbu.controller;
import com.dao.entity.Lesson;
import com.dao.entity.Student;
import com.dao.entity.Studenttermlessonteacher;
import com.dao.entity.Term;
import com.dao.entity.User;
import com.sbu.controller.model.CourseModel;
import com.sbu.controller.model.StudentModel;
import com.sbu.controller.model.StudenttermlessonteacherModel;
import com.sbu.controller.model.UserModel;
import com.sbu.service.impl.TeacherManagerImpl;
import com.sbu.service.impl.UserManagerImpl;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    
//    @Autowired
//    public StudenttermlessonteacherModel  sttltmodel;
    
 
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
              
        
        //////////////////////////////////

           //show cource   

    /**
     *
     * @param session
     * @param termid
     * @param model
     * @return
     */
        
        @RequestMapping(value = "showCourse", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody List<CourseModel> showCourse(HttpSession session , String termid , Model model ) {
                String userCode = ""; 
               // System.out.print("termid here"+termid);
                userCode = session.getAttribute("userCode").toString();
                Integer userCodeInt = Integer.parseInt(userCode);
                Integer termCodeInt =  Integer.parseInt(termid);
                
                //System.out.println("termid" + termid.toString());
                List<Lesson> lesson = teacherManagerImpl.findTermLessonTeacher( termCodeInt , userCodeInt); 
                List<CourseModel> courses = new ArrayList<CourseModel>();
                for(int i=0; i<lesson.size(); i++)
                {
                    Lesson l = lesson.get(i);
                    CourseModel temp = new CourseModel();
                    temp.setCode(l.getCode());
                    temp.setId(l.getId());
                    temp.setName(l.getName());
                    temp.setType(l.getType());
                    temp.setUnit(l.getUnit());
                    courses.add(temp);                   
                }
                               

                return  courses;  // "/CoursesTeacher" ; // "me" ; //  "/CoursesTeacher";
	}
                
         ///////////////////////////////////////////////
        
        //show students
          @RequestMapping(value = "showStudents", method = RequestMethod.POST , produces = "application/json")
	public  @ResponseBody List<UserModel> showStudents(HttpSession session  , String tid , String thisLessonId , Model model ) {
            String teacherCode = "";  
            teacherCode = session.getAttribute("userCode").toString();
            Integer teacherCodeInt = Integer.parseInt(teacherCode);
            Integer termCodeInt =  Integer.parseInt(tid);
            Integer thisLessonIdInt =  Integer.parseInt(thisLessonId);  
            List<User> stltlist = teacherManagerImpl.findStudentTermLessonTeacher(teacherCodeInt ,termCodeInt ,thisLessonIdInt);
            
            List<UserModel> studentlist =  new ArrayList<UserModel>() ; 
            
            for(int i=0; i<stltlist.size(); i++)
                {
                    User l = stltlist.get(i);
                    UserModel temp = new UserModel();
                    temp.setId(l.getId());
                    temp.setCode(l.getCode());
                    temp.setfName(l.getFname());
                    temp.setlName(l.getLname());
                    
                   // temp.setSupervisorId(l.getSupervisorid().getCode());
                    studentlist.add(temp);                    
                }
           // String t = studentlist.get(0).getUserCode().toString();
            //System.out.println("afterr  controler : " + t );

              return studentlist;
        }
                     
        ///////////////////////////////////////////////
        
         @RequestMapping(value = "InsertMark", method = RequestMethod.POST ) // , produces = "application/json")
        // @ResponseBody
	public  String InsertMark(HttpSession session , @RequestParam(value = "termid[]", required = false) String[] termid ,
                @RequestParam(value = "thisLessonId[]", required = false) String[] thisLessonId ,
                @RequestParam(value = "mark[]", required = false) String[] mark ,
                @RequestParam(value = "studentId[]", required = false) String[] studentId  , Model model ) 
        {
            String teacherCode = "";  
            teacherCode = session.getAttribute("userCode").toString();
            Integer teacherCodeInt = Integer.parseInt(teacherCode);
            teacherManagerImpl.insertMark(termid, thisLessonId, mark, studentId, teacherCodeInt);
           // System.out.println("Insert Mark controller : " +  mark.length);
            return "CoursesTeacher";
        }
        
     
}

