<%@ page import="com.ay.bean.StaffBean" %>
<%@ page import="com.ay.bean.Managerbean" %><%--
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
    Managerbean mb=(Managerbean) hs.getAttribute("mbean");
    if(mb==null){
        request.setAttribute("msg","session expired");
        request.getRequestDispatcher("manager.jsp").include(request,response);
    }
    else{


%>
<form action="staff1" method="post">
ENTER NAME :<input type="text" name="sname"><br>
ENTER DESIGNATION:<input type="text" name="sdesg"><br>
ENTER PHONE:<input type="text" name="sphone" maxlength="10"><br>
ENTER GENDER:<input type="text" name="gender"><br>
ENTER MANAGER ID:<input type="text" name="mid"><br>
    <input type="submit">
</form>
    <%
    }
%>
</body>
</html>
