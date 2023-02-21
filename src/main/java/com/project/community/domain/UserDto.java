package com.project.community.domain;

import java.util.Date;

public class UserDto {
    private String id;
    private String pwd;
    private String name;
    private Date birth;
    private String email;
    private String num;
    private Date reg_date;

    public UserDto(String id, String pwd, String name, Date birth, String email, String num, Date reg_date) {
        this.id = id;
        this.pwd = pwd;
        this.name = name;
        this.birth = birth;
        this.email = email;
        this.num = num;
        this.reg_date = reg_date;
    }

    public UserDto() {

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    @Override
    public String toString() {
        return "UserDto{" +
                "id='" + id + '\'' +
                ", pwd='" + pwd + '\'' +
                ", name='" + name + '\'' +
                ", birth=" + birth +
                ", email='" + email + '\'' +
                ", num='" + num + '\'' +
                ", reg_date=" + reg_date +
                '}';
    }
}
