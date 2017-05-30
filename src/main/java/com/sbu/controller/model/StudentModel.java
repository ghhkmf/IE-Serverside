/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sbu.controller.model;

public class StudentModel {

    private Integer id;
    private String qouta;
    private Integer beginSemesterId;
    private Integer supervisorId;
    private Integer orientationId;
    private Integer userCode;    

    public Integer getId() {
        return id;
    }

    public String getQouta() {
        return qouta;
    }

    public Integer getBeginSemesterId() {
        return beginSemesterId;
    }

    public Integer getSupervisorId() {
        return supervisorId;
    }

    public Integer getOrientationId() {
        return orientationId;
    }

    public Integer getUserCode() {
        return userCode;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setQouta(String qouta) {
        this.qouta = qouta;
    }

    public void setBeginSemesterId(Integer beginSemesterId) {
        this.beginSemesterId = beginSemesterId;
    }

    public void setSupervisorId(Integer supervisorId) {
        this.supervisorId = supervisorId;
    }

    public void setOrientationId(Integer orientationId) {
        this.orientationId = orientationId;
    }

    public void setUserCode(Integer userCode) {
        this.userCode = userCode;
    }

   
}
