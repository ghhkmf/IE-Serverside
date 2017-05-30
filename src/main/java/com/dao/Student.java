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
@Table(name = "STUDENT")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Student.findAll", query = "SELECT s FROM Student s"),
    @NamedQuery(name = "Student.findByQouta", query = "SELECT s FROM Student s WHERE s.qouta = :qouta"),
    @NamedQuery(name = "Student.findById", query = "SELECT s FROM Student s WHERE s.id = :id"),
	@NamedQuery(name = "Student.findByUserCode", query = "SELECT s FROM Student s WHERE s.usercode.code = :usercode")})
public class Student implements Serializable {
    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "QOUTA")
    private String qouta;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @JoinColumn(name = "ORIENTATIONID", referencedColumnName = "CODE")
    @ManyToOne(optional = false)
    private Orientation orientationid;
    @JoinColumn(name = "BEGINSEMESTERID", referencedColumnName = "CODE")
    @ManyToOne(optional = false)
    private Term beginsemesterid;
    @JoinColumn(name = "SUPERVISORID", referencedColumnName = "CODE")
    @ManyToOne(optional = false)
    private User supervisorid;
    @JoinColumn(name = "USERCODE", referencedColumnName = "CODE")
    @ManyToOne(optional = false)
    private User usercode;

    public Student() {
    }

    public Student(Integer id) {
        this.id = id;
    }

    public Student(Integer id, String qouta) {
        this.id = id;
        this.qouta = qouta;
    }

    public String getQouta() {
        return qouta;
    }

    public void setQouta(String qouta) {
        this.qouta = qouta;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Orientation getOrientationid() {
        return orientationid;
    }

    public void setOrientationid(Orientation orientationid) {
        this.orientationid = orientationid;
    }

    public Term getBeginsemesterid() {
        return beginsemesterid;
    }

    public void setBeginsemesterid(Term beginsemesterid) {
        this.beginsemesterid = beginsemesterid;
    }

    public User getSupervisorid() {
        return supervisorid;
    }

    public void setSupervisorid(User supervisorid) {
        this.supervisorid = supervisorid;
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
        if (!(object instanceof Student)) {
            return false;
        }
        Student other = (Student) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dao.entity.Student[ id=" + id + " ]";
    }
    
}
