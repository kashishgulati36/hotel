<%--
  Created by IntelliJ IDEA.
  User: komal
  Date: 8/6/2024
  Time: 4:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    HttpSession hs=request.getSession(false);
    hs.removeAttribute("mbean");
    hs.removeAttribute("items");
    hs.removeAttribute("rooms");
    hs.invalidate();
    request.setAttribute("msg","logout successfully");
    request.getRequestDispatcher("manager.jsp").include(request,response);
%>
</body>
</html>
