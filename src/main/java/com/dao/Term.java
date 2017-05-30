/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dao.entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author melsa
 */
@Entity
@Table(name = "TERM")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Term.findAll", query = "SELECT t FROM Term t"),
    @NamedQuery(name = "Term.findById", query = "SELECT t FROM Term t WHERE t.id = :id"),
    @NamedQuery(name = "Term.findByTermyear", query = "SELECT t FROM Term t WHERE t.termyear = :termyear"),
    @NamedQuery(name = "Term.findBySemester", query = "SELECT t FROM Term t WHERE t.semester = :semester"),
    @NamedQuery(name = "Term.findByType", query = "SELECT t FROM Term t WHERE t.type = :type"),
    @NamedQuery(name = "Term.findByCode", query = "SELECT t FROM Term t WHERE t.code = :code")})
public class Term implements Serializable {
    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "ID")
    private int id;
    @Basic(optional = false)
    @Column(name = "TERMYEAR")
    private String termyear;
    @Basic(optional = false)
    @Column(name = "SEMESTER")
    private String semester;
    @Basic(optional = false)
    @Column(name = "TYPE")
    private String type;
    @Id
    @Basic(optional = false)
    @Column(name = "CODE")
    private Integer code;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "termid")
    private Collection<Studenttermavg> studenttermavgCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "beginsemesterid")
    private Collection<Student> studentCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "termid")
    private Collection<Termlessonteacher> termlessonteacherCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "beginsemesterid")
    private Collection<Teacher> teacherCollection;

    public Term() {
    }

    public Term(Integer code) {
        this.code = code;
    }

    public Term(Integer code, int id, String termyear, String semester, String type) {
        this.code = code;
        this.id = id;
        this.termyear = termyear;
        this.semester = semester;
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTermyear() {
        return termyear;
    }

    public void setTermyear(String termyear) {
        this.termyear = termyear;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    @XmlTransient
    public Collection<Studenttermavg> getStudenttermavgCollection() {
        return studenttermavgCollection;
    }

    public void setStudenttermavgCollection(Collection<Studenttermavg> studenttermavgCollection) {
        this.studenttermavgCollection = studenttermavgCollection;
    }

    @XmlTransient
    public Collection<Student> getStudentCollection() {
        return studentCollection;
    }

    public void setStudentCollection(Collection<Student> studentCollection) {
        this.studentCollection = studentCollection;
    }

    @XmlTransient
    public Collection<Termlessonteacher> getTermlessonteacherCollection() {
        return termlessonteacherCollection;
    }

    public void setTermlessonteacherCollection(Collection<Termlessonteacher> termlessonteacherCollection) {
        this.termlessonteacherCollection = termlessonteacherCollection;
    }

    @XmlTransient
    public Collection<Teacher> getTeacherCollection() {
        return teacherCollection;
    }

    public void setTeacherCollection(Collection<Teacher> teacherCollection) {
        this.teacherCollection = teacherCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (code != null ? code.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Term)) {
            return false;
        }
        Term other = (Term) object;
        if ((this.code == null && other.code != null) || (this.code != null && !this.code.equals(other.code))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dao.entity.Term[ code=" + code + " ]";
    }
    
}
