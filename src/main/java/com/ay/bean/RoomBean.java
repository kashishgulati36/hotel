package com.ay.bean;

import java.io.Serializable;

public class RoomBean implements Serializable {
    private int rno,floorno;
    private String rtype,rstatus;

    public int getRno() {
        return rno;
    }

    public void setRno(int rno) {
        this.rno = rno;
    }

    public int getFloorno() {
        return floorno;
    }

    public void setFloorno(int floorno) {
        this.floorno = floorno;
    }

    public String getRtype() {
        return rtype;
    }

    public void setRtype(String rtype) {
        this.rtype = rtype;
    }

    public String getRstatus() {
        return rstatus;
    }

    public void setRstatus(String rstatus) {
        this.rstatus = rstatus;
    }

    @Override
    public String toString() {
        return "RoomBean{" +
                "rno=" + rno +
                ", floorno=" + floorno +
                ", rtype='" + rtype + '\'' +
                ", rstatus='" + rstatus + '\'' +
                '}';
    }

    public RoomBean() {

    }
}
