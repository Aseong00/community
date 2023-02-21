package com.project.community.domain;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthentication extends Authenticator {

    PasswordAuthentication account;

    public MyAuthentication(){
        String id = "***************";
        String pwd = "**********";
        account = new PasswordAuthentication(id, pwd);
    }

    public PasswordAuthentication getPasswordAuthentication(){
        return account;
    }
}
