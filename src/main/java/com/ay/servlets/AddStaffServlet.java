package com.ay.servlets;

import com.ay.DAO.AddStaffDAO;
import com.ay.bean.Managerbean;
import com.ay.bean.StaffBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/staff1")
public class AddStaffServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession hs = req.getSession(false);
        Managerbean mb = (Managerbean) hs.getAttribute("mbean");
       ArrayList<StaffBean> al=(ArrayList<StaffBean>) hs.getAttribute("items");
       // System.out.println(al.size());
        if (mb == null) {
            req.setAttribute("msg", "session expired");
            req.getRequestDispatcher("manager.jsp").include(req, resp);
        } else {
            StaffBean temp=new StaffBean();
            temp.setMid(req.getParameter("mid"));
            temp.setSname(req.getParameter("sname"));
            temp.setSdesg(req.getParameter("sdesg"));
            temp.setSphone(req.getParameter("sphone"));
            temp.setGender(req.getParameter("gender"));

            int k=new AddStaffDAO().registerstaff(temp);
            if(k>0)
            {
                if(al==null){
                    al=new ArrayList<>();
                    hs.setAttribute("items",al);
                }
                al.add(temp);
                hs.setAttribute("items ", al);
                req.setAttribute("msg","registered succesfully");
            }
            else{
                req.setAttribute("msg","failed to add new staff");
                req.getRequestDispatcher("Welcome.jsp").forward(req,resp);
            }
            RequestDispatcher rd = req.getRequestDispatcher("Welcome.jsp");
            rd.include(req, resp);
        }
    }
}
