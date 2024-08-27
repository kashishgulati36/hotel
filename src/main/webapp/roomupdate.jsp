<%@ page import="com.ay.bean.Managerbean" %><%--
  Created by IntelliJ IDEA.
  User: komal
  Date: 8/26/2024
  Time: 2:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>room update</title>
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
<form action="updateroom" method="post" >
    ENTER ROOM NUMBER:<input type="text" name="rnum"><br>
    UPDATED ROOM STATUS:<input type="text" name="rstatus"><br>
    GUEST NAME:<input type="text" name="gname"><br>
    GUEST PHONE NUMBER:<input type="text" name="gphone" maxlength="10"><br>
    GUEST AADHAR NUMBER:<input type="text" name="gaadhar" maxlength="12"><br>
    <input type="submit">
</form>
<%}
        %>
</body>
</html>
