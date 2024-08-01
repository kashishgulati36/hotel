<%@ page import="com.ay.bean.Managerbean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login successfully</title>
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
<h1>hello manager <%=mb.getMname()%></h1>

<a href="#staffInfo">Staff Info</a>
<div id="staffInfo" class="info-section">
    <ul>
        <a href="view_all_staff.jsp"><input type="button" value="view all Staff details"></a>
        <a href="view_staff_by_id.jsp"><input type="button" value="view staff details by id"></a>
        <a href="edit_staff.jsp"><input type="button" value="edit Staff details"></a>
    </ul>
</div>

<a href="#roomInfo">Room Info</a>
<div id="roomInfo" class="info-section">
    <ul>
       <a href="room.jsp"><input type="button" value="check all rooms status"></a>
        <a><input type="button" value="check status by room number"></a>
        <a><input type="button" value="update status"></a>
    </ul>
</div>

<a href="#guestFeedback">Guests Feedback</a>
<div id="guestFeedback" class="info-section">
    <ul>
        <li><a><input type="button" value="view guest feedback"></a></li>

    </ul>
</div>
<%
    }
%>
</body>
</html>
