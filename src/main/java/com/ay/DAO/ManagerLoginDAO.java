package com.ay.DAO;

import com.ay.bean.Managerbean;
import com.ay.bean.RoomBean;
import com.ay.bean.StaffBean;
import com.ay.connection.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
    public ArrayList<StaffBean> getstaffdetails(Managerbean mb) {
        ArrayList<StaffBean> al = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(details);

            ps.setString(1,mb.getMid());
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
               StaffBean sb=new StaffBean();
                sb.setSname(rs.getString(1));
                sb.setSdesg(rs.getString(2));
                sb.setSphone(rs.getString(3));
                sb.setGender(rs.getString(4));
                sb.setMid(rs.getString(5));
                al.add(sb);
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;
    }
    public ArrayList<RoomBean> getroomdetails(){
        ArrayList<RoomBean> rl=new ArrayList<>();
        try{
            Connection con=DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement("SELECT * FROM HOTELROOMS ");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                RoomBean rb=new RoomBean();
                rb.setRno(rs.getInt(1));
                rb.setFloorno(rs.getInt(2));
                rb.setRtype(rs.getString(3));
                rb.setRstatus(rs.getString(4));
                rl.add(rb);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return rl;
    }
}
