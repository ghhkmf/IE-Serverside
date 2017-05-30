/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dao.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author melsa
 */
@Entity
@Table(name = "TERMLESSONTEACHER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Termlessonteacher.findAll", query = "SELECT t FROM Termlessonteacher t"),
    @NamedQuery(name = "Termlessonteacher.findById", query = "SELECT t FROM Termlessonteacher t WHERE t.id = :id"),
    @NamedQuery(name = "Termlessonteacher.findByExamdate", query = "SELECT t FROM Termlessonteacher t WHERE t.examdate = :examdate"),
    @NamedQuery(name = "Termlessonteacher.findByClassdate", query = "SELECT t FROM Termlessonteacher t WHERE t.classdate = :classdate"),
    @NamedQuery(name = "Termlessonteacher.findByClassnum", query = "SELECT t FROM Termlessonteacher t WHERE t.classnum = :classnum")})
  //  @NamedQuery(name = "Termlessonteacher.findByTermidTeacherid", query = "SELECT t FROM Termlessonteacher t  WHERE t.teacherid.code = :teacherid  AND  t.termid.code = :termid  AND t.lessonid.code = :lessonid")})
public class Termlessonteacher implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "EXAMDATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date examdate;
    @Basic(optional = false)
    @Column(name = "CLASSDATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date classdate;
    @Basic(optional = false)
    @Column(name = "CLASSNUM")
    private int classnum;
    @JoinColumn(name = "LESSONID", referencedColumnName = "CODE")
    @ManyToOne(optional = false)
    private Lesson lessonid;
    @JoinColumn(name = "TERMID", referencedColumnName = "CODE")
    @ManyToOne(optional = false)
    private Term termid;
    @JoinColumn(name = "TEACHERID", referencedColumnName = "CODE")
    @ManyToOne(optional = false)
    private User teacherid;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "termlessonteacherid")
    private Collection<Studenttermlessonteacher> studenttermlessonteacherCollection;

    public Termlessonteacher() {
    }

    public Termlessonteacher(Integer id) {
        this.id = id;
    }

    public Termlessonteacher(Integer id, Date examdate, Date classdate, int classnum) {
        this.id = id;
        this.examdate = examdate;
        this.classdate = classdate;
        this.classnum = classnum;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getExamdate() {
        return examdate;
    }

    public void setExamdate(Date examdate) {
        this.examdate = examdate;
    }

    public Date getClassdate() {
        return classdate;
    }

    public void setClassdate(Date classdate) {
        this.classdate = classdate;
    }

    public int getClassnum() {
        return classnum;
    }

    public void setClassnum(int classnum) {
        this.classnum = classnum;
    }

    public Lesson getLessonid() {
        return lessonid;
    }

    public void setLessonid(Lesson lessonid) {
        this.lessonid = lessonid;
    }

    public Term getTermid() {
        return termid;
    }

    public void setTermid(Term termid) {
        this.termid = termid;
    }

    public User getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(User teacherid) {
        this.teacherid = teacherid;
    }

    @XmlTransient
    public Collection<Studenttermlessonteacher> getStudenttermlessonteacherCollection() {
        return studenttermlessonteacherCollection;
    }

    public void setStudenttermlessonteacherCollection(Collection<Studenttermlessonteacher> studenttermlessonteacherCollection) {
        this.studenttermlessonteacherCollection = studenttermlessonteacherCollection;
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
        if (!(object instanceof Termlessonteacher)) {
            return false;
        }
        Termlessonteacher other = (Termlessonteacher) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dao.entity.Termlessonteacher[ id=" + id + " ]";
    }
    
}
