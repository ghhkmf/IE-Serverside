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
@Table(name = "STUDENTTERMAVG")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Studenttermavg.findAll", query = "SELECT s FROM Studenttermavg s"),
    @NamedQuery(name = "Studenttermavg.findById", query = "SELECT s FROM Studenttermavg s WHERE s.id = :id"),
    @NamedQuery(name = "Studenttermavg.findByAvg", query = "SELECT s FROM Studenttermavg s WHERE s.avg = :avg"),
    @NamedQuery(name = "Studenttermavg.findByPassedunits", query = "SELECT s FROM Studenttermavg s WHERE s.passedunits = :passedunits"),
    @NamedQuery(name = "Studenttermavg.findByStatus", query = "SELECT s FROM Studenttermavg s WHERE s.status = :status"),
    @NamedQuery(name = "Studenttermavg.findByUserCode", query = "SELECT s FROM Studenttermavg s WHERE s.studentid.code = :studentid")})

public class Studenttermavg implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "AVG")
    private double avg;
    @Column(name = "PASSEDUNITS")
    private Integer passedunits;
    @Basic(optional = false)
    @Column(name = "STATUS")
    private String status;
    @JoinColumn(name = "TERMID", referencedColumnName = "CODE")
    @ManyToOne(optional = false)
    private Term termid;
    @JoinColumn(name = "STUDENTID", referencedColumnName = "CODE")
    @ManyToOne(optional = false)
    private User studentid;

    public Studenttermavg() {
    }

    public Studenttermavg(Integer id) {
        this.id = id;
    }

    public Studenttermavg(Integer id, double avg, String status) {
        this.id = id;
        this.avg = avg;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public double getAvg() {
        return avg;
    }

    public void setAvg(double avg) {
        this.avg = avg;
    }

    public Integer getPassedunits() {
        return passedunits;
    }

    public void setPassedunits(Integer passedunits) {
        this.passedunits = passedunits;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Term getTermid() {
        return termid;
    }

    public void setTermid(Term termid) {
        this.termid = termid;
    }

    public User getStudentid() {
        return studentid;
    }

    public void setStudentid(User studentid) {
        this.studentid = studentid;
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
        if (!(object instanceof Studenttermavg)) {
            return false;
        }
        Studenttermavg other = (Studenttermavg) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dao.entity.Studenttermavg[ id=" + id + " ]";
    }
    
}
