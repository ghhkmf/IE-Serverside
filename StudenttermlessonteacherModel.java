/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sbu.controller.model;

public class StudenttermlessonteacherModel {

    private Integer id;
    private String status;
    private Integer mark;
    private Integer termLessonTeacherId;
    private Integer studentId;

    public Integer getId() {
        return id;
    }

    public String getStatus() {
        return status;
    }

    public Integer getMark() {
        return mark;
    }

    public Integer getTermLessonTeacherId() {
        return termLessonTeacherId;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setMark(Integer mark) {
        this.mark = mark;
    }

    public void setTermLessonTeacherId(Integer termLessonTeacherId) {
        this.termLessonTeacherId = termLessonTeacherId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }
   

   
   
}
