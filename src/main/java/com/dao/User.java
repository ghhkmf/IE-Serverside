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
import javax.persistence.Id;
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
@Table(name = "USER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u"),
    @NamedQuery(name = "User.findById", query = "SELECT u FROM User u WHERE u.id = :id"),
    @NamedQuery(name = "User.findByCode", query = "SELECT u FROM User u WHERE u.code = :code"),
    @NamedQuery(name = "User.findByFname", query = "SELECT u FROM User u WHERE u.fname = :fname"),
    @NamedQuery(name = "User.findByLname", query = "SELECT u FROM User u WHERE u.lname = :lname"),
    @NamedQuery(name = "User.findByGender", query = "SELECT u FROM User u WHERE u.gender = :gender"),
    @NamedQuery(name = "User.findByBirthdate", query = "SELECT u FROM User u WHERE u.birthdate = :birthdate"),
    @NamedQuery(name = "User.findByNationalcode", query = "SELECT u FROM User u WHERE u.nationalcode = :nationalcode"),
    @NamedQuery(name = "User.findByEmail", query = "SELECT u FROM User u WHERE u.email = :email"),
    @NamedQuery(name = "User.findByPhone", query = "SELECT u FROM User u WHERE u.phone = :phone"),
    @NamedQuery(name = "User.findByAddress", query = "SELECT u FROM User u WHERE u.address = :address"),
    @NamedQuery(name = "User.findByPassword", query = "SELECT u FROM User u WHERE u.password = :password"),
    @NamedQuery(name = "User.findByUrole", query = "SELECT u FROM User u WHERE u.urole = :urole")})
public class User implements Serializable {
    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "ID")
    private int id;
    @Id
    @Basic(optional = false)
    @Column(name = "CODE")
    private Integer code;
    @Basic(optional = false)
    @Column(name = "FNAME")
    private String fname;
    @Basic(optional = false)
    @Column(name = "LNAME")
    private String lname;
    @Basic(optional = false)
    @Column(name = "GENDER")
    private String gender;
    @Basic(optional = false)
    @Column(name = "BIRTHDATE")
    @Temporal(TemporalType.DATE)
    private Date birthdate;
    @Basic(optional = false)
    @Column(name = "NATIONALCODE")
    private String nationalcode;
    @Column(name = "EMAIL")
    private String email;
    @Column(name = "PHONE")
    private Integer phone;
    @Column(name = "ADDRESS")
    private String address;
    @Column(name = "PASSWORD")
    private String password;
    @Column(name = "UROLE")
    private Integer urole;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "studentid")
    private Collection<Studenttermavg> studenttermavgCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "supervisorid")
    private Collection<Student> studentCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "usercode")
    private Collection<Student> studentCollection1;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "teacherid")
    private Collection<Termlessonteacher> termlessonteacherCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "studentid")
    private Collection<Studenttermlessonteacher> studenttermlessonteacherCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "usercode")
    private Collection<Teacher> teacherCollection;

    public User() {
    }

    public User(Integer code) {
        this.code = code;
    }

    public User(Integer code, int id, String fname, String lname, String gender, Date birthdate, String nationalcode) {
        this.code = code;
        this.id = id;
        this.fname = fname;
        this.lname = lname;
        this.gender = gender;
        this.birthdate = birthdate;
        this.nationalcode = nationalcode;
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

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public String getNationalcode() {
        return nationalcode;
    }

    public void setNationalcode(String nationalcode) {
        this.nationalcode = nationalcode;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getPhone() {
        return phone;
    }

    public void setPhone(Integer phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getUrole() {
        return urole;
    }

    public void setUrole(Integer urole) {
        this.urole = urole;
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
    public Collection<Student> getStudentCollection1() {
        return studentCollection1;
    }

    public void setStudentCollection1(Collection<Student> studentCollection1) {
        this.studentCollection1 = studentCollection1;
    }

    @XmlTransient
    public Collection<Termlessonteacher> getTermlessonteacherCollection() {
        return termlessonteacherCollection;
    }

    public void setTermlessonteacherCollection(Collection<Termlessonteacher> termlessonteacherCollection) {
        this.termlessonteacherCollection = termlessonteacherCollection;
    }

    @XmlTransient
    public Collection<Studenttermlessonteacher> getStudenttermlessonteacherCollection() {
        return studenttermlessonteacherCollection;
    }

    public void setStudenttermlessonteacherCollection(Collection<Studenttermlessonteacher> studenttermlessonteacherCollection) {
        this.studenttermlessonteacherCollection = studenttermlessonteacherCollection;
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
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.code == null && other.code != null) || (this.code != null && !this.code.equals(other.code))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dao.entity.User[ code=" + code + " ]";
    }
    
}
