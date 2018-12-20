package com.RuoLiang;

public class User {
    private String nowName;
    private String nowPassword;
    private String nowEmail;
    private int nowBalance;

    public User(){}
    public User(String name, String password, String email){
        nowName = name;
        nowPassword = password;
        nowEmail = email;
    }
    public User(String name, String password, String email,int nowBalance){
        nowName = name;
        nowPassword = password;
        nowEmail = email;
        this.nowBalance = nowBalance;
    }
    public int getNowBalance() {
        return nowBalance;
    }

    public String getNowName() {
        return nowName;
    }

    public void setNowName(String nowName) {
        this.nowName = nowName;
    }

    public String getNowPassword() {
        return nowPassword;
    }

    public void setNowPassword(String nowPassword) {
        this.nowPassword = nowPassword;
    }

    public String getNowEmail() {
        return nowEmail;
    }

    public void setNowEmail(String nowEmail) {
        this.nowEmail = nowEmail;
    }
}
