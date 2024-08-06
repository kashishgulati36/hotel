package com.ay.servlets;

import com.ay.bean.Managerbean;
import com.ay.bean.RoomBean;
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

@WebServlet("/manager1")
public class ManagerLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Managerbean mb=(Managerbean) req.getAttribute("mbean");
       ArrayList<StaffBean> al=(ArrayList<StaffBean>) req.getAttribute("items");
        ArrayList<RoomBean> rl=(ArrayList<RoomBean>) req.getAttribute("rooms");
        if(mb==null){
            RequestDispatcher rd=req.getRequestDispatcher("manager.jsp");
            rd.forward(req,resp);
        }
        else{
            HttpSession hs=req.getSession();
            hs.setAttribute("mbean",mb);
            hs.setAttribute("items",al);
            hs.setAttribute("rooms",rl);
            System.out.println(al.size());
            RequestDispatcher rd=req.getRequestDispatcher("Welcome.jsp");
            rd.forward(req,resp);
        }
    }
}
