package com.ay.bean;

import java.io.Serializable;

public class StaffBean implements Serializable {
    private String sname,sphone,sdesg,gender,mid;

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getSphone() {
        return sphone;
    }

    public void setSphone(String sphone) {
        this.sphone = sphone;
    }

    public String getSdesg() {
        return sdesg;
    }

    public void setSdesg(String sdesg) {
        this.sdesg = sdesg;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    @Override
    public String toString() {
        return "StaffBean{" +
                "sname='" + sname + '\'' +
                ", sphone='" + sphone + '\'' +
                ", sdesg='" + sdesg + '\'' +
                ", gender='" + gender + '\'' +
                ", mid='" + mid + '\'' +
                '}';
    }

    public StaffBean() {

    }
}
