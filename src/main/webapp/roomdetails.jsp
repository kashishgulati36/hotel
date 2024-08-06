<%@ page import="com.ay.bean.Managerbean" %>
<%@ page import="com.ay.bean.RoomBean" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: komal
  Date: 8/6/2024
  Time: 2:03 PM
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
            ArrayList<RoomBean> rl=(ArrayList<RoomBean>)hs.getAttribute("rooms");
            if ( rl==null||rl.size()==0) {
                request.setAttribute("msg", "no rooms found");
                RequestDispatcher rd = request.getRequestDispatcher("Welcome.jsp");
                rd.include(request, response);
            }else{

%>
<center>
    <h1>ROOM DETAILS</h1>
    <table border="3px">
        <thead>
        <th>ROOM NO.</th>
        <th>FLOOR NO.</th>
        <th>TYPE</th>
        <th>STATUS</th>
        </thead>
        <tbody>
        <%
            for(RoomBean s:rl){
        %>
        <tr>
            <td><%=s.getRno()%></td>
            <td><%=s.getFloorno()%></td>
            <td><%=s.getRtype()%></td>
            <td><%=s.getRstatus()%></td>


        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</center>

<%}
    }
%>
</body>
</html>
