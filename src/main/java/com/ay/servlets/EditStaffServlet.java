package com.ay.servlets;

import com.ay.DAO.UpdateDAO;
import com.ay.bean.Managerbean;
import com.ay.bean.StaffBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/staff_edit")
public class EditStaffServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession hs = req.getSession(false);
        Managerbean mb = (Managerbean) hs.getAttribute("mbean");
        ArrayList<StaffBean> al=(ArrayList<StaffBean>) hs.getAttribute("items");
        if (mb == null) {
            req.setAttribute("msg", "session expired");
            req.getRequestDispatcher("manager.jsp").include(req, resp);
        } else {
            String name = req.getParameter("sname");
            String odesg= req.getParameter("odesg");
            for(StaffBean s:al){
                if(name.equals(s.getSname())){
                    StaffBean sb=new StaffBean();
                    sb.setSname(req.getParameter("sname"));
                    if(odesg.equals(s.getSdesg())){
                        sb.setSdesg(req.getParameter("ndesg"));
                    }
                    sb.setSphone(req.getParameter("uphone"));
                    int k=new UpdateDAO().updatestaff(sb);
                    if(k>0){
                        s.setSname(sb.getSname());
                        s.setSdesg(sb.getSdesg());
                        hs.setAttribute("items",al);
                        req.setAttribute("msg","updated successfully");
                    }
                    else{
                        req.setAttribute("msg","failed to update");
                    }


                }
                else{
                    req.setAttribute("msg","name do not match");
                }
            }
        }
        req.getRequestDispatcher("Welcome.jsp").include(req,resp);
    }
}


