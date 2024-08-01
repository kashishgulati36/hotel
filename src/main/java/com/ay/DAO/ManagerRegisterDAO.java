package com.ay.DAO;

import com.ay.bean.Managerbean;
import com.ay.connection.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ManagerRegisterDAO {
    private static final String addmanager="INSERT INTO MANAGERLOGIN VALUES(?,?,?,?)";
    public int registermanager(Managerbean mb){
        int k=0;
        try{
            Connection con= DBConnection.getConnection();
            PreparedStatement ps= con.prepareStatement(addmanager);
            ps.setString(1,mb.getMid());
            ps.setString(2, mb.getMpword());
            ps.setString(3, mb.getMname());
            ps.setString(4, mb.getMphone());
             k=ps.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        }
        return k;
    }
}
