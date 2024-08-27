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
import java.util.ArrayList;

@WebServlet("/updateroom")
public class RoomUpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession hs = req.getSession(false);
        Managerbean mb = (Managerbean) hs.getAttribute("mbean");
        ArrayList<RoomBean> rl=(ArrayList<RoomBean>) hs.getAttribute("rooms");
        if(mb==null){
            req.setAttribute("msg", "session expired");
            req.getRequestDispatcher("manager.jsp").include(req, resp);
        } else {
            int room=Integer.parseInt(req.getParameter("rnum"));
            for(RoomBean r:rl) {
                if (room == r.getRno()) {

                    RoomBean rb = new RoomBean();
                    rb.setRno(Integer.parseInt(req.getParameter("rnum")));
                    rb.setRstatus(req.getParameter("rstatus"));
                    rb.setGname(req.getParameter("gname"));
                    rb.setGphone(req.getParameter("gphone"));
                    rb.setGaadahar(req.getParameter("gaadhar"));
                    int k = new ManagerLoginDAO().updateroom(rb);
                    if (k > 0) {
                        r.setRstatus(rb.getRstatus());
                        if(rb.getRstatus().equals("vacant")){
                            r.setGname("null");
                            r.setGphone("null");
                            r.setGaadahar("null");
                        }
                        else {
                            r.setGname(rb.getGname());
                            r.setGphone(rb.getGphone());
                            r.setGaadahar(rb.getGaadahar());
                        }
                            hs.setAttribute("rooms", rl);
                            req.setAttribute("msg", "updated successfully");

                    } else {
                        req.setAttribute("msg", "some unknown error occcured");
                    }
                }
            }
        }
        req.getRequestDispatcher("Welcome.jsp").include(req,resp);
    }
}
