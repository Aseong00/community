package com.project.community.domain;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthentication extends Authenticator {

    PasswordAuthentication account;

    public MyAuthentication(){
        String id = "community1025@naver.com";
        String pwd = "(community)";
        account = new PasswordAuthentication(id, pwd);
    }

    public PasswordAuthentication getPasswordAuthentication(){
        return account;
    }
}
