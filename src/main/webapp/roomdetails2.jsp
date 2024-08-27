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
    <title>Room Number Entry</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #f9a8d4, #fcd1d1); /* Pink gradient background */
            color: #333;
            margin: 0;
            padding: 0;
            position: relative;
            z-index: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h1 {
            color: #e91e63;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            margin-bottom: 20px;
        }

        .form-wrapper {
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: center;
            animation: fadeIn 2s ease-in;
        }

        input[type="text"] {
            padding: 10px;
            width: 80%;
            margin: 10px 0;
            border: 2px solid #e91e63;
            border-radius: 5px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #f06292; /* Darker pink on focus */
            box-shadow: 0 0 10px rgba(233, 30, 99, 0.5);
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #e91e63;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #f06292;
            transform: scale(1.1); /* Slight zoom effect on hover */
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Hotel name in background */
        body::before {
            content: 'The Grand Vista';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 80px;
            color: rgba(233, 30, 99, 0.1); /* Very light pink */
            z-index: -1;
            white-space: nowrap;
        }
    </style>
</head>
<body>
<%
    HttpSession hs= request.getSession(false);
    Managerbean mb=(Managerbean) hs.getAttribute("mbean");
    if(mb==null){
        request.setAttribute("msg","session expired");
        request.getRequestDispatcher("manager.jsp").include(request,response);
    } else {
%>
<div class="form-wrapper">
    <h1>Enter Room Number</h1>
    <form action="info" method="post">
        <input type="text" name="rnum" placeholder="Enter Room Number"><br>
        <input type="submit" value="Submit">
    </form>
</div>
<%
    }
%>
</body>
</html>
