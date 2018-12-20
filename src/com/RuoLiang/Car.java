package com.RuoLiang;

public class Car {
    private int OID;
    private String OUEmail;
    private int OGID;
    private int ONum;
    private int OStatus;

    public Car(){};
    public Car(int OID ,String Email,int GID,int Num,int Status){
        this.OID = OID;
        this.OUEmail = Email;
        this.OGID = GID;
        this.ONum = Num;
        this.OStatus = Status;
    };


    public String getOUEmail() {
        return OUEmail;
    }

    public int getOGID() {
        return OGID;
    }

    public int getONum() {
        return ONum;
    }


    public int getOID() {
        return OID;
    }

    public int getOStatus() {
        return OStatus;
    }
}
