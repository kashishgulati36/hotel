package com.ay.filter;

import com.ay.DAO.ManagerRegisterDAO;
import com.ay.bean.Managerbean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import java.io.IOException;

@WebFilter("/manager2")
public class ManagerRegisterFilter extends HttpFilter {
    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        Managerbean mb=new Managerbean();
        mb.setMid(req.getParameter("mid"));
        mb.setMpword(req.getParameter("mpass"));
        mb.setMname(req.getParameter("mname"));
        mb.setMphone(req.getParameter("mphone"));

        int k=new ManagerRegisterDAO().registermanager(mb);
        if(k>0){
            req.setAttribute("msg","registered successfully");
        }
        else{
          req.setAttribute("msg","problem while registering");
        }
        chain.doFilter(req,res);
    }
}
