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
@Table(name = "ORIENTATION")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orientation.findAll", query = "SELECT o FROM Orientation o"),
    @NamedQuery(name = "Orientation.findById", query = "SELECT o FROM Orientation o WHERE o.id = :id"),
    @NamedQuery(name = "Orientation.findByCode", query = "SELECT o FROM Orientation o WHERE o.code = :code"),
    @NamedQuery(name = "Orientation.findByName", query = "SELECT o FROM Orientation o WHERE o.name = :name")})
public class Orientation implements Serializable {
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
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "orientationid")
    private Collection<Student> studentCollection;

    public Orientation() {
    }

    public Orientation(Integer code) {
        this.code = code;
    }

    public Orientation(Integer code, int id, String name) {
        this.code = code;
        this.id = id;
        this.name = name;
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

    @XmlTransient
    public Collection<Student> getStudentCollection() {
        return studentCollection;
    }

    public void setStudentCollection(Collection<Student> studentCollection) {
        this.studentCollection = studentCollection;
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
        if (!(object instanceof Orientation)) {
            return false;
        }
        Orientation other = (Orientation) object;
        if ((this.code == null && other.code != null) || (this.code != null && !this.code.equals(other.code))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dao.entity.Orientation[ code=" + code + " ]";
    }
    
}
