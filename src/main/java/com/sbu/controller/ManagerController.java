/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sbu.controller;

import com.dao.entity.Lesson;
import com.dao.entity.Studenttermlessonteacher;
import com.sbu.controller.model.CourseModel;
import com.sbu.controller.model.TermModel;
import com.sbu.service.impl.HeadOfDepartmentManagerImpl;
import com.sbu.service.impl.UserManagerImpl;
import java.util.List;
import com.dao.entity.Term;
import com.dao.entity.Teacher;
import com.sbu.controller.model.ModelStudentMark;
import java.util.ArrayList;
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
        
        //show coursepage of head of department
        @RequestMapping(value = "/ShowCoursePage",method = RequestMethod.GET)
	public String ShowCoursePage(Model model, HttpSession session) {
             String userCode = ""; 
             if(session.getAttribute("userCode") != null)
              {
                List<Term> term = headOfDepartmentManagerImpl.findTerm();  
                model.addAttribute("termlist", term); 
                List<Teacher> teacher = headOfDepartmentManagerImpl.findTeacher();  
                model.addAttribute("teacherlist", teacher); 
                userCode = session.getAttribute("userCode").toString();
                 model.addAttribute("sessionId", userCode); 
               // if(Integer.parseInt(userCode) == 1)
                   return "CoursesManager";
               // else
                 //   return "CoursesManager";
              }
              return "redirect:/login";
        }
        
        
        
         @RequestMapping(value = "showCourseAjax", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody List<CourseModel> showCourse(HttpSession session , String termid , String techerid , Model model ) {
                
                Integer userCodeInt = Integer.parseInt(techerid);
                Integer termCodeInt =  Integer.parseInt(termid);
                
               
                List<Lesson> lesson = headOfDepartmentManagerImpl.findTermLessonTeacher( termCodeInt , userCodeInt); 
                List<CourseModel> courses = new ArrayList<CourseModel>();
                 //System.out.println("lesson.size() :  " + termid.toString());
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
                               

                return  courses;  
	}
        
       @RequestMapping(value = "showStudentsajax", method = RequestMethod.POST , produces = "application/json")//, produces = "application/json"
	public  @ResponseBody List<ModelStudentMark> showStudents( String lessonidOut , String termidOut , String techeridOut  , Model model ) {
           
             System.out.println("techeridOut" + techeridOut );
             System.out.println("termidOut" + termidOut );
             System.out.println("lessonidOut" + lessonidOut );
                
            int teacherCodeInt = Integer.parseInt(techeridOut);   
            int termCodeInt =  Integer.parseInt(termidOut);       
            int thisLessonIdInt =  Integer.parseInt(lessonidOut ); 
           
           
           List<Studenttermlessonteacher> stmalist =  headOfDepartmentManagerImpl.findStudentTermLessonTeacher(teacherCodeInt ,termCodeInt ,thisLessonIdInt);

           System.out.println("number of students : " + stmalist.size());
          // System.out.println("before  controlerrrrrrr : " + stmalist.get(0).getMark());
            List<ModelStudentMark> studentmarklist =  new ArrayList<ModelStudentMark>() ; 
           
            for(int i=0; i<stmalist.size(); i++){
                    ModelStudentMark m = new ModelStudentMark();
                    m.setCode(stmalist.get(i).getStudentid().getCode());
                    m.setFname(stmalist.get(i).getStudentid().getFname());
                    m.setLname(stmalist.get(i).getStudentid().getLname());
                    m.setMark(stmalist.get(i).getMark().toString());                    
                    studentmarklist.add(m);
                }


              return studentmarklist;
        }   
        
         @RequestMapping(value = "InsertMark", method = RequestMethod.POST ) 
        // @ResponseBody
	public  String InsertMark(HttpSession session , @RequestParam(value = "termid[]", required = false) String[] termid ,
                @RequestParam(value = "thisLessonId[]", required = false) String[] thisLessonId ,
                @RequestParam(value = "mark[]", required = false) String[] mark ,
                @RequestParam(value = "studentId[]", required = false) String[] studentId ,
                @RequestParam(value = "techerid[]", required = false) String[] techerid , Model model ) 
        {
            System.out.println("inner of Controller :)))) ");
            Integer teacherCodeInt = Integer.parseInt(techerid[0] );
            headOfDepartmentManagerImpl.insertMark2(termid, thisLessonId, mark, studentId, teacherCodeInt);
           // System.out.println("Insert Mark controller : " +  mark.length);
            return "CoursesManager";
        }
        
     
}