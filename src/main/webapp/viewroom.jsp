<%@ page import="com.ay.bean.Managerbean" %>
<%@ page import="com.ay.bean.RoomBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Room Details</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #f9a8d4, #fcd1d1); /* Pink gradient background */
            color: #333;
            margin: 0;
            padding: 0;
            position: relative;
            z-index: 1;
        }

        h1 {
            color: #e91e63;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            margin-bottom: 20px;
        }

        .content-wrapper {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            position: relative;
            z-index: 1;
            animation: fadeIn 2s ease-in;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
        }

        table, th, td {
            border: 3px solid #e91e63;
            padding: 15px;
            text-align: center;
            transition: all 0.3s ease;
        }

        th {
            background-color: #f06292; /* Darker pink for headers */
            color: #fff;
            font-size: 18px;
            text-transform: uppercase;
        }

        td {
            font-size: 16px;
            color: #333;
        }

        tr:hover {
            background-color: #fcd1d1; /* Lighter pink on hover */
        }

        tr:nth-child(even) {
            background-color: #f8bbd0; /* Alternating row color */
        }

        tr:nth-child(odd) {
            background-color: #fce4ec;
        }

        /* Hotel name in background */
        body::before {
            content: 'The Grand Vista';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 100px;
            color: rgba(233, 30, 99, 0.1); /* Very light pink */
            z-index: -1;
            white-space: nowrap;
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </style>
</head>
<body>
<%
    HttpSession hs = request.getSession(false);
    Managerbean mb = (Managerbean) hs.getAttribute("mbean");
    if (mb == null) {
        request.setAttribute("msg", "session expired");
        request.getRequestDispatcher("manager.jsp").include(request, response);
    } else {
        RoomBean r = (RoomBean) hs.getAttribute("info");
%>
<div class="content-wrapper">
    <center>
        <h1>ROOM DETAILS</h1>
        <table>
            <thead>
            <tr>
                <th>Room Number</th>
                <th>Room Floor</th>
                <th>Room Type</th>
                <th>Room Status</th>
                <th>Guest Name</th>
                <th>Guest Phone</th>
                <th>Guest Aadhar</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><%= r.getRno() %></td>
                <td><%= r.getFloorno() %></td>
                <td><%= r.getRtype() %></td>
                <td><%= r.getRstatus() %></td>
                <td><%= r.getGname() %></td>
                <td><%= r.getGphone() %></td>
                <td><%= r.getGaadahar() %></td>
            </tr>
            </tbody>
        </table>
    </center>
</div>
<%
    }
%>
</body>
</html>
