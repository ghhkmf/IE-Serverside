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
@Table(name = "LESSON")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Lesson.findAll", query = "SELECT l FROM Lesson l"),
    @NamedQuery(name = "Lesson.findById", query = "SELECT l FROM Lesson l WHERE l.id = :id"),
    @NamedQuery(name = "Lesson.findByCode", query = "SELECT l FROM Lesson l WHERE l.code = :code"),
    @NamedQuery(name = "Lesson.findByName", query = "SELECT l FROM Lesson l WHERE l.name = :name"),
    @NamedQuery(name = "Lesson.findByUnit", query = "SELECT l FROM Lesson l WHERE l.unit = :unit"),
    @NamedQuery(name = "Lesson.findByType", query = "SELECT l FROM Lesson l WHERE l.type = :type")})
public class Lesson implements Serializable {
    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "ID")
    private int id;
    @Id
    @Basic(optional = false)
    @Column(name = "CODE")
    private Integer code;
    @Basic(optional = false)
    @Column(name = "NAME")
    private String name;
    @Basic(optional = false)
    @Column(name = "UNIT")
    private int unit;
    @Basic(optional = false)
    @Column(name = "TYPE")
    private String type;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "lessonid")
    private Collection<Termlessonteacher> termlessonteacherCollection;

    public Lesson() {
    }

    public Lesson(Integer code) {
        this.code = code;
    }

    public Lesson(Integer code, int id, String name, int unit, String type) {
        this.code = code;
        this.id = id;
        this.name = name;
        this.unit = unit;
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getUnit() {
        return unit;
    }

    public void setUnit(int unit) {
        this.unit = unit;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @XmlTransient
    public Collection<Termlessonteacher> getTermlessonteacherCollection() {
        return termlessonteacherCollection;
    }

    public void setTermlessonteacherCollection(Collection<Termlessonteacher> termlessonteacherCollection) {
        this.termlessonteacherCollection = termlessonteacherCollection;
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
        if (!(object instanceof Lesson)) {
            return false;
        }
        Lesson other = (Lesson) object;
        if ((this.code == null && other.code != null) || (this.code != null && !this.code.equals(other.code))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dao.entity.Lesson[ code=" + code + " ]";
    }
    
}
