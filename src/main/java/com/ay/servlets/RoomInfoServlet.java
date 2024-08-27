package com.ay.servlets;

import com.ay.DAO.ManagerLoginDAO;
import com.ay.bean.Managerbean;
import com.ay.bean.RoomBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/info")
public class RoomInfoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession hs = req.getSession(false);
        Managerbean mb = (Managerbean) hs.getAttribute("mbean");
        if(mb==null){
            req.setAttribute("msg", "session expired");
            req.getRequestDispatcher("manager.jsp").include(req, resp);
        } else {
            RoomBean rb=new RoomBean();
            rb.setRno(Integer.parseInt(req.getParameter("rnum")));
            ManagerLoginDAO dao=new ManagerLoginDAO();
            RoomBean r=new RoomBean();
            r=dao.roominfo(rb);
            hs.setAttribute("info",r);
        }
        req.getRequestDispatcher("viewroom.jsp").include(req,resp);
    }
}
