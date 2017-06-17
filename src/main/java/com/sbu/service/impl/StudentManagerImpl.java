package com.sbu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sbu.dao.impl.UserDAOImpl;
import com.sbu.dao.impl.StudentDAOImpl;
import com.dao.entity.Student;
import com.dao.entity.Studenttermavg;
import com.dao.entity.Studenttermlessonteacher;
import com.dao.entity.User;
import com.sbu.controller.model.UserModel;
import com.sbu.controller.model.StudentModel;
import com.sbu.controller.model.StudenttermavgModel;
import com.sbu.controller.model.StudenttermlessonteacherResultModel;
import java.util.ArrayList;

@Service
public class StudentManagerImpl /*implements UserManager*/ {

    public StudentManagerImpl() {
    }

    @Autowired
    public StudentDAOImpl StudentDAOImpl;
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
    public StudentModel findStudentByCode(Integer code) {
        Student found = StudentDAOImpl.findStudentByCode(code);
        
        if(found != null)
        {
            StudentModel s = new StudentModel();
            s.setId(found.getId());
            s.setBeginSemesterId(found.getBeginsemesterid().getId());
            s.setOrientationId(found.getOrientationid().getId());
            s.setQouta(found.getQouta());
            s.setSupervisorId(found.getSupervisorid().getCode());
            s.setUserCode(found.getUsercode().getCode());
            return s;
        }
        return null;
    }
    
    public List<StudenttermavgModel> findStudentSemesters(Integer code)
    {
        List<Studenttermavg> semesters = StudentDAOImpl.findStudentSemesters(code);
        List<StudenttermavgModel> foundSemesters = new ArrayList<>();
        for(int i=0; i<semesters.size(); i++)
        {
            Studenttermavg temp = semesters.get(i);
            StudenttermavgModel s = new StudenttermavgModel();
            s.setAvg(temp.getAvg());
            s.setId(temp.getId());
            s.setPassedUnits(temp.getPassedunits());
            s.setStatus(temp.getStatus());
            s.setTermId(temp.getTermid().getCode());
            foundSemesters.add(s);
        }
        System.out.println("com.sbu.service.impl.StudentManagerImpl.findStudentSemesters()");
        System.out.println("Lists in manager:  "+ foundSemesters.toString());
        return foundSemesters;
    }
    
    public List<StudenttermlessonteacherResultModel> findSemesterDetails(Integer code, Integer termid)
    {
        System.out.println("com.sbu.service.impl.StudentManagerImpl.findSemesterDetails()");
        List<Studenttermlessonteacher> semesters = StudentDAOImpl.findSemesterDetails(code, termid);
        List<StudenttermlessonteacherResultModel> foundSemesters = new ArrayList<>();
        for(int i=0; i<semesters.size(); i++)
        {
            Studenttermlessonteacher temp = semesters.get(i);
            StudenttermlessonteacherResultModel newEntry = new StudenttermlessonteacherResultModel();
            Integer tempTID = temp.getTermlessonteacherid().getTermid().getCode();

            System.out.println("sija" + tempTID +termid);
            if(tempTID.equals(termid))
            {
                newEntry.setCourseCode(temp.getTermlessonteacherid().getLessonid().getCode());
                newEntry.setCourseName(temp.getTermlessonteacherid().getLessonid().getName());
                newEntry.setCourseType(temp.getTermlessonteacherid().getLessonid().getType());
                newEntry.setId(temp.getId());
                newEntry.setCourseMark(temp.getMark());
                newEntry.setStudentid(temp.getStudentid().getCode());
                newEntry.setTermid(tempTID);

                String str = temp.getTermlessonteacherid().getTeacherid().getFname();
                str += " " + temp.getTermlessonteacherid().getTeacherid().getLname();
                newEntry.setTeacherName(str);
                newEntry.setCourseCredit(temp.getTermlessonteacherid().getLessonid().getUnit());
                foundSemesters.add(newEntry);
                System.out.println("teacher name"+newEntry.getTeacherName());
                System.out.println("gradee"+ newEntry.getCourseCredit());
            }
        }
        
        return foundSemesters;
    }
}






