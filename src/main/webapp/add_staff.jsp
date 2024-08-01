<%@ page import="com.ay.bean.StaffBean" %><%--
  Created by IntelliJ IDEA.
  User: komal
  Date: 8/1/2024
  Time: 10:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ADD DETAILS</title>
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
<form action="staff1" method="post">
ENTER NAME :<input type="text" name="sname">
ENTER DESIGNATION:<input type="text" name="sdesg">
ENTER PHONE:<input type="text" name="sphone" maxlength="10">
ENTER GENDER:<input type="text" name="gender">
ENTER MANAGER ID:<input type="text" name="mid">
    <input type="submit">
</form>
    <%
    }
%>
</body>
</html>
