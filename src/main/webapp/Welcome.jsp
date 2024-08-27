<%@ page import="com.ay.bean.Managerbean" %>
<%@ page import="com.ay.bean.StaffBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Successful</title>
    <style>
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideInLeft {
            from {
                opacity: 0;
                transform: translateX(-100%);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes slideInRight {
            from {
                opacity: 0;
                transform: translateX(100%);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #fce4ec; /* Soft pink background */
            color: #333;
            position: relative;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        .background-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 100px;
            color: rgba(255, 182, 193, 0.3); /* Light pink color with transparency */
            font-weight: bold;
            text-transform: uppercase;
            white-space: nowrap;
            z-index: -1;
            animation: fadeIn 3s ease-in-out infinite alternate; /* Text fades in and out */
        }

        .content {
            position: relative;
            z-index: 1;
            text-align: center;
            padding-top: 50px;
            animation: fadeIn 1.5s ease-in-out; /* Content fades in on load */
        }

        h1 {
            color: #e91e63;
            font-size: 32px;
            text-transform: uppercase; /* Make manager's name in all caps */
            font-family: 'Brush Script MT', cursive; /* Stylish font for manager's name */
            margin-bottom: 20px;
        }

        .info-section {
            margin-bottom: 30px;
            padding: 20px;
            background-color: #f8bbd0;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1.5s ease-in-out, slideInLeft 1s ease-out; /* Sections slide in from the left */
        }

        .info-section:nth-child(even) {
            animation: fadeIn 1.5s ease-in-out, slideInRight 1s ease-out; /* Alternate sections slide in from the right */
        }

        a {
            text-decoration: none;
            display: inline-block;
            padding: 12px 20px;
            background-color: #f06292; /* Light pink buttons */
            color: white;
            border-radius: 25px;
            margin: 10px 0;
            transition: background-color 0.3s ease, transform 0.3s ease;
            font-size: 18px;
            font-weight: bold;
            animation: fadeIn 2s ease-in-out; /* Buttons fade in */
        }

        a:hover {
            background-color: #ec407a; /* Darker pink on hover */
            transform: translateY(-3px);
        }

        a:active {
            background-color: #d81b60; /* Even darker pink on active */
            transform: translateY(2px);
        }
    </style>
</head>
<body>
<div class="background-text">The Grand Vista</div>
<div class="content">
    <%
        HttpSession hs = request.getSession(false);
        Managerbean mb = (Managerbean) hs.getAttribute("mbean");
        if (mb == null) {
            request.setAttribute("msg", "Session expired");
            request.getRequestDispatcher("manager.jsp").include(request, response);
        } else {
    %>
    <h1>HELLO MANAGER <%= mb.getMname().toUpperCase() %></h1> <!-- Manager's name in all caps -->

    <div class="info-section">
        <h2>Staff Info</h2>
        <a href="view_all_staff.jsp">View All Staff Details</a><br>
        <a href="edit_staff.jsp">Edit Staff Details</a><br>
        <a href="add_staff.jsp">Add Staff Details</a><br>
    </div>

    <div class="info-section">
        <h2>Room Info</h2>
        <a href="roomdetails.jsp">View All Rooms</a><br>
        <a href="roomdetails2.jsp">Check Details by Room Number</a><br>
        <a href="roomupdate.jsp">Update Status</a><br>
    </div>

    <div class="info-section">
        <h2>Guests Feedback</h2>
        <a href="#">View Guest Feedback</a><br>
    </div>

    <a href="logout.jsp">LOGOUT</a>

    <%
        }
    %>
    <%
        String msg = (String) request.getAttribute("msg");
        if (msg != null) {
            out.print(msg);
        }
    %>
</div>
</body>
</html>
