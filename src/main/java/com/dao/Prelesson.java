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
@Table(name = "PRELESSON")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Prelesson.findAll", query = "SELECT p FROM Prelesson p"),
    @NamedQuery(name = "Prelesson.findById", query = "SELECT p FROM Prelesson p WHERE p.id = :id")})
public class Prelesson implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @JoinColumn(name = "LESSONCODE", referencedColumnName = "CODE")
    @ManyToOne(optional = false)
    private Lesson lessoncode;
    @JoinColumn(name = "PRECODE", referencedColumnName = "CODE")
    @ManyToOne
    private Lesson precode;

    public Prelesson() {
    }

    public Prelesson(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Lesson getLessoncode() {
        return lessoncode;
    }

    public void setLessoncode(Lesson lessoncode) {
        this.lessoncode = lessoncode;
    }

    public Lesson getPrecode() {
        return precode;
    }

    public void setPrecode(Lesson precode) {
        this.precode = precode;
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
        if (!(object instanceof Prelesson)) {
            return false;
        }
        Prelesson other = (Prelesson) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dao.entity.Prelesson[ id=" + id + " ]";
    }
    
}
