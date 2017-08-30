package com.shop.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User {
    private  Integer id;
    private  String userName;
    private String passWord;
    private  Integer gender;

   /* public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }*/
}
