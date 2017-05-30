/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sbu.controller.model;

public class TeacherModel {

    private Integer code;
    private String isMGR;
    private Integer id;
    private String eduGroup;
    private Integer userCode; 
    private Integer beginSemesterId;
    private String degree;     

    public Integer getCode() {
        return code;
    }

    public String getIsMGR() {
        return isMGR;
    }

    public Integer getId() {
        return id;
    }

    public String getEduGroup() {
        return eduGroup;
    }

    public Integer getUserCode() {
        return userCode;
    }

    public Integer getBeginSemesterId() {
        return beginSemesterId;
    }

    public String getDegree() {
        return degree;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public void setIsMGR(String isMGR) {
        this.isMGR = isMGR;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setEduGroup(String eduGroup) {
        this.eduGroup = eduGroup;
    }

    public void setUserCode(Integer userCode) {
        this.userCode = userCode;
    }

    public void setBeginSemesterId(Integer beginSemesterId) {
        this.beginSemesterId = beginSemesterId;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }
 
    
}
