package com.ay.DAO;

import com.ay.bean.Managerbean;
import com.ay.bean.StaffBean;
import com.ay.connection.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ManagerLoginDAO {
    private static final String login="SELECT * FROM MANAGERLOGIN WHERE MANAGER_ID=? AND PASSWORD=?";
    private static final String details = "SELECT * FROM STAFFDETAILS WHERE MANAGER_ID=?";
    public Managerbean getlogin(Managerbean mb){
        try{
            Connection con= DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement(login);
            ps.setString(1,mb.getMid());
            ps.setString(2, mb.getMpword());
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                mb.setMid(rs.getString(1));
                mb.setMpword(rs.getString(2));
                mb.setMname(rs.getString(3));
                mb.setMphone(rs.getString(4));
            }
            else{
                mb=null;
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return mb;
    }
    public StaffBean getstaffdetails(Managerbean mb) {
        StaffBean sb = null;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(details);

            ps.setString(1,mb.getMid());
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                sb=new StaffBean();
                sb.setSname(rs.getString(1));
                sb.setSdesg(rs.getString(2));
                sb.setSphone(rs.getString(3));
                sb.setGender(rs.getString(4));
                sb.setMid(rs.getString(5));
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb;
    }
}
