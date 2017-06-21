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
import javax.persistence.FetchType;
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
@Table(name = "STUDENTTERMLESSONTEACHER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Studenttermlessonteacher.findAll", query = "SELECT s FROM Studenttermlessonteacher s"),
    @NamedQuery(name = "Studenttermlessonteacher.findById", query = "SELECT s FROM Studenttermlessonteacher s WHERE s.id = :id"),
    @NamedQuery(name = "Studenttermlessonteacher.findByMark", query = "SELECT s FROM Studenttermlessonteacher s WHERE s.mark = :mark"),
     @NamedQuery(name = "Studenttermlessonteacher.findByStatus", query = "SELECT s FROM Studenttermlessonteacher s WHERE s.status = :status"),
    @NamedQuery(name = "Studenttermlessonteacher.findByStudentId", query = "SELECT s FROM Studenttermlessonteacher s WHERE s.studentid.code = :studentid")})

public class Studenttermlessonteacher implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Column(name = "MARK")
    private Integer mark;
    @Basic(optional = false)
    @Column(name = "STATUS")
    private String status;
    @JoinColumn(name = "TERMLESSONTEACHERID", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Termlessonteacher termlessonteacherid;
    @JoinColumn(name = "STUDENTID", referencedColumnName = "CODE")
    @ManyToOne(optional = false)
    @Basic(fetch = FetchType.LAZY)
    private User studentid;

    public Studenttermlessonteacher() {
    }

    public Studenttermlessonteacher(Integer id) {
        this.id = id;
    }

    public Studenttermlessonteacher(Integer id, String status) {
        this.id = id;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMark() {
        return mark;
    }

    public void setMark(Integer mark) {
        this.mark = mark;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Termlessonteacher getTermlessonteacherid() {
        return termlessonteacherid;
    }

    public void setTermlessonteacherid(Termlessonteacher termlessonteacherid) {
        this.termlessonteacherid = termlessonteacherid;
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
        if (!(object instanceof Studenttermlessonteacher)) {
            return false;
        }
        Studenttermlessonteacher other = (Studenttermlessonteacher) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dao.entity.Studenttermlessonteacher[ id=" + id + " ]";
    }
    
}
