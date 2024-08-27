<%@ page import="com.ay.bean.StaffBean" %>
<%@ page import="com.ay.bean.Managerbean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ADD DETAILS</title>
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
            transform: translate(-50%, -50%) rotate(-20deg); /* Centered and rotated */
            font-size: 150px;
            color: rgba(255, 182, 193, 0.3); /* Light pink color with transparency */
            font-weight: bold;
            text-transform: uppercase;
            white-space: nowrap;
            z-index: -1;
            animation: fadeIn 3s ease-in-out infinite alternate; /* Text fades in and out */
            text-align: center;
        }

        .content {
            position: relative;
            z-index: 1;
            text-align: center;
            padding: 50px;
            background: rgba(255, 255, 255, 0.9); /* Semi-transparent white background */
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1.5s ease-in-out; /* Content fades in on load */
            max-width: 500px;
            margin: 0 auto;
        }

        h1 {
            color: #e91e63;
            font-size: 28px;
            text-transform: uppercase;
            font-family: 'Brush Script MT', cursive; /* Stylish font for headers */
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        input[type="text"] {
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #e91e63;
            width: 100%;
            max-width: 400px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #d81b60;
            outline: none;
        }

        input[type="submit"] {
            padding: 12px 20px;
            background-color: #f06292; /* Light pink submit button */
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #ec407a; /* Darker pink on hover */
            transform: translateY(-3px);
        }

        input[type="submit"]:active {
            background-color: #d81b60; /* Even darker pink on active */
            transform: translateY(2px);
        }
    </style>
</head>
<body>
<div class="background-text">The Grand Vista</div>
<div class="content">
    <h1>ADD STAFF DETAILS</h1>
    <%
        HttpSession hs = request.getSession(false);
        Managerbean mb = (Managerbean) hs.getAttribute("mbean");
        if (mb == null) {
            request.setAttribute("msg", "Session expired");
            request.getRequestDispatcher("manager.jsp").include(request, response);
        } else {
    %>
    <form action="staff1" method="post">
        ENTER NAME :<input type="text" name="sname" required><br>
        ENTER DESIGNATION:<input type="text" name="sdesg" required><br>
        ENTER PHONE:<input type="text" name="sphone" maxlength="10" required><br>
        ENTER GENDER:<input type="text" name="gender" required><br>
        ENTER MANAGER ID:<input type="text" name="mid" required><br>
        <input type="submit" value="Submit">
    </form>
    <%
        }
    %>
</div>
</body>
</html>
