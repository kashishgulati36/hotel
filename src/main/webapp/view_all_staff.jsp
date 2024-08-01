<%@ page import="com.ay.bean.StaffBean" %><%--
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
    StaffBean sb=(StaffBean) hs.getAttribute("sbean");
    if(sb==null){
        request.setAttribute("msg","session expired");
        request.getRequestDispatcher("manager.jsp").include(request,response);
    }
    else{


%>
<center>
    <h1>STAFF DETAILS</h1>
    <table border="3px">
        <thead>
        <th>name</th>
        <th>designation</th>
        <th>phone</th>
        <th>gender</th>
        </thead>
        <tbody>
        <tr>
            <td><%=sb.getSname()%></td>
            <td><%=sb.getSdesg()%></td>
            <td><%=sb.getSphone()%></td>
            <td><%=sb.getGender()%></td>

        </tr>
        </tbody>
    </table>
</center>




<%
    }
%>
</body>
</html>
