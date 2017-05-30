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
public class TermLessonTeacherModel {
    Integer id;
    String examDate;
    Integer ClassNum;
    Integer TermId;
    Integer LessonId;
    Integer TeacherID;

    public void setId(Integer id) {
        this.id = id;
    }

    public void setExamDate(String examDate) {
        this.examDate = examDate;
    }

    public void setClassNum(Integer ClassNum) {
        this.ClassNum = ClassNum;
    }

    public void setTermId(Integer TermId) {
        this.TermId = TermId;
    }

    public void setLessonId(Integer LessonId) {
        this.LessonId = LessonId;
    }

    public void setTeacherID(Integer TeacherID) {
        this.TeacherID = TeacherID;
    }

    public Integer getId() {
        return id;
    }

    public String getExamDate() {
        return examDate;
    }

    public Integer getClassNum() {
        return ClassNum;
    }

    public Integer getTermId() {
        return TermId;
    }

    public Integer getLessonId() {
        return LessonId;
    }

    public Integer getTeacherID() {
        return TeacherID;
    }
    
    

  
    
    
}
