package com.project.community.domain;

import java.util.Date;

public class UserDto {
    private String id;
    private String pwd;
    private String name;
    private Date birth;
    private String email;
    private String num1;
    private String num2;
    private String num;
    private Date reg_date;

    public UserDto(String id, String pwd, String name, Date birth, String email, Date reg_date, String num1, String num2) {
        this.id = id;
        this.pwd = pwd;
        this.name = name;
        this.birth = birth;
        this.email = email;
        this.reg_date = reg_date;
        this.num1 = num1;
        this.num2 = num2;
        this.num = num1 + num2;
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

    public String getNum1() {
        return num1;
    }

    public void setNum1(String num1) {
        this.num1 = num1;
    }

    public String getNum2() {
        return num2;
    }

    public void setNum2(String num2) {
        this.num2 = num2;
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
