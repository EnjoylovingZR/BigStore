package com.RuoLiang;

public class Good {
    private String GID;
    private String GName;
    private Integer GPrice;
    private String Type;
    private String GUrl;
    private Integer GNum;
    private String GText;

    public Good(){};



    public Good(String GID, String GName, Integer GPrice, String Type, String GUrl, Integer GNum, String GText){
        this.GID = GID;
        this.GName = GName;
        this.GPrice = GPrice;
        this.Type = Type;
        this.GUrl = GUrl;
        this.GNum = GNum;
        this.GText = GText;
    };

    public String getGID() {
        return GID;
    }

    public String getGName() {
        return GName;
    }

    public Integer getGPrice() {
        return GPrice;
    }

    public String getType() {
        return Type;
    }

    public String getGUrl() {
        return GUrl;
    }

    public Integer getGNum() {
        return GNum;
    }

    public String getGText() {
        return GText;
    }
}
