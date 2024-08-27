<%@ page import="com.ay.bean.Managerbean" %><%--
  Created by IntelliJ IDEA.
  User: komal
  Date: 8/8/2024
  Time: 10:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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

<form action="info" method="post">
    ENTER ROOM NUMBER:<input type="text" name="rnum">
    <input type="submit">

</form>
<%
    }
%>
</body>
</html>
