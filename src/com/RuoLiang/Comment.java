package com.RuoLiang;

public class Comment {
    private int CGID;
    private String CText;
    private String CUName;

    public Comment(){};
    public Comment(int CGID,String CText,String CUName){
        this.CGID = CGID;
        this.CText = CText;
        this.CUName = CUName;
    }

    public int getCGID() {
        return CGID;
    }

    public String getCText() {
        return CText;
    }

    public String getCUName() {
        return CUName;
    }
}
