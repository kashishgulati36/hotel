package com.ay.filter;

import com.ay.DAO.ManagerLoginDAO;
import com.ay.bean.Managerbean;
import com.ay.bean.StaffBean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServlet;
import java.io.IOException;

@WebFilter("/manager1")
public class ManagerFilter extends HttpFilter {
    private static final long serialVersionUID = 1L;

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        Managerbean mb=new Managerbean();
        StaffBean sb=new StaffBean();
        mb.setMid(req.getParameter("mid"));
        mb.setMpword(req.getParameter("mpass"));

        ManagerLoginDAO dao= new ManagerLoginDAO();
       mb=dao.getlogin(mb);
       sb=dao.getstaffdetails(mb);

       if(mb==null){
           req.setAttribute("msg","invalid username or password");
       }
       else{
           req.setAttribute("mbean",mb);
           req.setAttribute("sbean",sb);
       }
        super.doFilter(req, res, chain);
    }
}
