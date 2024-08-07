package com.ay.DAO;

import com.ay.bean.StaffBean;
import com.ay.connection.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UpdateDAO {
    private static final String update = "UPDATE STAFFDETAILS SET NAME=?,DESIGNATION=? WHERE PHONE=?";
    public int updatestaff(StaffBean sb) {
    int k=0;
    try{
        Connection con= DBConnection.getConnection();
        PreparedStatement ps= con.prepareStatement(update);
        ps.setString(1,sb.getSname());
        ps.setString(2,sb.getSdesg());
        ps.setString(3,sb.getSphone());
        k= ps.executeUpdate();
    }
    catch(Exception e){
        e.printStackTrace();
    }
    return k;
    }

}
