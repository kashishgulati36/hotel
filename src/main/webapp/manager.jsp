
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>manager login</title>
</head>
<body>
<center>
    <form action="manager1" method="post">
       MANAGER ID:<input type="text" name="mid">
        <br>
        MANAGER PASSWORD:<input type="password" name="mpass">
        <br>
        <input type="submit">
        <a href="manager2.jsp"><input type="button" value="create account"></a>

        <br>
        <br>

    </form>
    <%
        String msg=(String) request.getAttribute("msg");
        if(msg!=null){
            out.print(msg);
        }
    %>
</center>

</body>
</html>
