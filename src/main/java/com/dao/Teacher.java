/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dao.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author melsa
 */
@Entity
@Table(name = "TEACHER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Teacher.findAll", query = "SELECT t FROM Teacher t"),
    @NamedQuery(name = "Teacher.findById", query = "SELECT t FROM Teacher t WHERE t.id = :id"),
    @NamedQuery(name = "Teacher.findByIsmgr", query = "SELECT t FROM Teacher t WHERE t.ismgr = :ismgr"),
    @NamedQuery(name = "Teacher.findByEdugroup", query = "SELECT t FROM Teacher t WHERE t.edugroup = :edugroup"),
    @NamedQuery(name = "Teacher.findByDegree", query = "SELECT t FROM Teacher t WHERE t.degree = :degree"),
    @NamedQuery(name = "Teacher.findByCode", query = "SELECT t FROM Teacher t WHERE t.code = :code"),
    @NamedQuery(name = "Teacher.findByUserCode", query = "SELECT t FROM Teacher t WHERE t.usercode.code = :usercode")})
public class Teacher implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Column(name = "ISMGR")
    private String ismgr;
    @Basic(optional = false)
    @Column(name = "EDUGROUP")
    private String edugroup;
    @Basic(optional = false)
    @Column(name = "DEGREE")
    private String degree;
    @Basic(optional = false)
    @Column(name = "CODE")
    private int code;
    @JoinColumn(name = "BEGINSEMESTERID", referencedColumnName = "CODE")
    @ManyToOne(optional = false)
    private Term beginsemesterid;
    @JoinColumn(name = "USERCODE", referencedColumnName = "CODE")
    @ManyToOne(optional = false)
    private User usercode;

    public Teacher() {
    }

    public Teacher(Integer id) {
        this.id = id;
    }

    public Teacher(Integer id, String edugroup, String degree, int code) {
        this.id = id;
        this.edugroup = edugroup;
        this.degree = degree;
        this.code = code;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIsmgr() {
        return ismgr;
    }

    public void setIsmgr(String ismgr) {
        this.ismgr = ismgr;
    }

    public String getEdugroup() {
        return edugroup;
    }

    public void setEdugroup(String edugroup) {
        this.edugroup = edugroup;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public Term getBeginsemesterid() {
        return beginsemesterid;
    }

    public void setBeginsemesterid(Term beginsemesterid) {
        this.beginsemesterid = beginsemesterid;
    }

    public User getUsercode() {
        return usercode;
    }

    public void setUsercode(User usercode) {
        this.usercode = usercode;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Teacher)) {
            return false;
        }
        Teacher other = (Teacher) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dao.entity.Teacher[ id=" + id + " ]";
    }
    
}
