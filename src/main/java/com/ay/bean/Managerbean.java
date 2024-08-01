package com.ay.bean;

import java.io.Serializable;

public class Managerbean implements Serializable {
    private String mid;
    private String mpword,mname,mphone;

    public String getMid() {
        return mid;
    }



    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getMpword() {
        return mpword;
    }

    public void setMpword(String mpword) {
        this.mpword = mpword;
    }
    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getMphone() {
        return mphone;
    }

    public void setMphone(String mphone) {
        this.mphone = mphone;
    }

    @Override
    public String toString() {
        return "Managerbean{" +
                "mid='" + mid + '\'' +
                ", mpword='" + mpword + '\'' +
                ", mname='" + mname + '\'' +
                ", mphone='" + mphone + '\'' +
                '}';
    }

    public Managerbean() {
    }
}
