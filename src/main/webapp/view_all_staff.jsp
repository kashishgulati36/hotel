<%@ page import="com.ay.bean.StaffBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ay.bean.Managerbean" %><%--
  Created by IntelliJ IDEA.
  User: komal
  Date: 8/1/2024
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>staff details</title>
</head>
<body>
<%
    HttpSession hs= request.getSession(false);
    Managerbean mb=(Managerbean) hs.getAttribute("mbean");
    if(mb==null){
        request.setAttribute("msg","session expired");
        request.getRequestDispatcher("manager.jsp").include(request,response);
    }
    else{
        ArrayList<StaffBean> al=(ArrayList<StaffBean>)hs.getAttribute("items");
        if ( al==null||al.size()==0) {
            request.setAttribute("msg", "no data found");
            RequestDispatcher rd = request.getRequestDispatcher("Welcome.jsp");
            rd.include(request, response);
        }else{


%>
<center>
    <h1>STAFF DETAILS</h1>
    <table border="3px">
        <thead>
        <th>name</th>
        <th>designation</th>
        <th>phone</th>
        <th>gender</th>
        <th>manager_id</th>
        </thead>
        <tbody>
        <%
            for(StaffBean s:al){
        %>
        <tr>
            <td><%=s.getSname()%></td>
            <td><%=s.getSdesg()%></td>
            <td><%=s.getSphone()%></td>
            <td><%=s.getGender()%></td>
            <td><%=s.getMid()%></td>


        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</center>




<%
        }
    }
%>
</body>
</html>
