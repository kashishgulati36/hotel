package com.ay.DAO;

import com.ay.bean.StaffBean;
import com.ay.connection.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class AddStaffDAO {
    private static final String addstaff="INSERT INTO STAFFDETAILS VALUES(?,?,?,?,?)";

    public int registerstaff(StaffBean sb)
    {
        int k=0;
        try{
            Connection con= DBConnection.getConnection();
            PreparedStatement ps1=con.prepareStatement(addstaff);
            ps1.setString(1,sb.getSname());
            ps1.setString(2,sb.getSdesg());
            ps1.setString(3,sb.getSphone());
            ps1.setString(4, sb.getGender());
            ps1.setString(5, sb.getMid());

            k= ps1.executeUpdate();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return k;
    }
}
