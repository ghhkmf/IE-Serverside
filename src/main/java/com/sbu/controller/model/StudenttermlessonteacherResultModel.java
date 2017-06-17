/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sbu.controller.model;

/**
 *
 * @author ghazalhakimifard
 */
public class StudenttermlessonteacherResultModel {
    Integer id;
    String courseName;
    Integer courseCode;
    String courseType;
    Integer courseCredit;
    String teacherName;
    Integer courseMark;
    Integer studentid;
    Integer termid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Integer getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(Integer courseCode) {
        this.courseCode = courseCode;
    }

    public String getCourseType() {
        return courseType;
    }

    public void setCourseType(String courseType) {
        this.courseType = courseType;
    }



    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public Integer getCourseCredit() {
        return courseCredit;
    }

    public void setCourseCredit(Integer courseCredit) {
        this.courseCredit = courseCredit;
    }

    public Integer getCourseMark() {
        return courseMark;
    }

    public void setCourseMark(Integer courseMark) {
        this.courseMark = courseMark;
    }

 
    public Integer getStudentid() {
        return studentid;
    }

    public void setStudentid(Integer studentid) {
        this.studentid = studentid;
    }

    public Integer getTermid() {
        return termid;
    }

    public void setTermid(Integer termid) {
        this.termid = termid;
    }
    

    
}
