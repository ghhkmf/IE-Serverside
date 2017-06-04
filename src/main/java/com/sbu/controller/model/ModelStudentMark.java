
package com.sbu.controller.model;
import com.dao.entity.User;
import com.sbu.controller.model.UserModel;
import java.util.List;

public class ModelStudentMark {

    //private List<UserModel> usermodel;
    //private List<String> lastmark;
    private String fname;
    private String lname;
    private Integer code;
    private String mark;
    


    public ModelStudentMark() {
        
    }

    public String getFname() {
        return fname;
    }

    public String getLname() {
        return lname;
    }

    public Integer getCode() {
        return code;
    }

    public String getMark() {
        return mark;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    

    
    

   
}
