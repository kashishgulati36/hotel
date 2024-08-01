package com.ay.servlets;

import com.ay.bean.Managerbean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/manager1")
public class ManagerLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Managerbean mb=(Managerbean) req.getAttribute("mbean");
        if(mb==null){
            RequestDispatcher rd=req.getRequestDispatcher("manager.jsp");
            rd.include(req,resp);
        }
        else{
            HttpSession hs=req.getSession();
            hs.setAttribute("mbean",mb);
            RequestDispatcher rd=req.getRequestDispatcher("Welcome.jsp");
            rd.include(req,resp);
        }
    }
}
