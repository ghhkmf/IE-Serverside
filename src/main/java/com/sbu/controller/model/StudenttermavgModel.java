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
public class StudenttermavgModel {
    Integer id;
    Integer studetId;
    Integer termId;
    double avg;
    Integer passedUnits;
    String status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStudetId() {
        return studetId;
    }

    public void setStudetId(Integer studetId) {
        this.studetId = studetId;
    }

    public Integer getTermId() {
        return termId;
    }

    public void setTermId(Integer termId) {
        this.termId = termId;
    }

    public double getAvg() {
        return avg;
    }

    public void setAvg(double avg) {
        this.avg = avg;
    }

    public Integer getPassedUnits() {
        return passedUnits;
    }

    public void setPassedUnits(Integer passedUnits) {
        this.passedUnits = passedUnits;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
