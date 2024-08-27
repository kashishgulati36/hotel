<%@ page import="com.ay.bean.Managerbean" %>
<%@ page import="com.ay.bean.RoomBean" %>
<%@ page import="java.util.ArrayList" %>
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

        table {
            width: 90%;
            border-collapse: separate;
            border-spacing: 0;
            margin: 20px 0;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
        }

        thead {
            background-color: #f06292;
            color: #fff;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            font-weight: bold;
            text-transform: uppercase;
        }

        tbody tr:nth-child(odd) {
            background-color: #f9e4f5; /* Light pink for odd rows */
        }

        tbody tr:nth-child(even) {
            background-color: #fce4ec; /* Slightly lighter pink for even rows */
        }

        tbody tr:hover {
            background-color: #f9b8d4; /* Pink on hover */
            transform: scale(1.02); /* Slightly larger on hover */
            transition: transform 0.3s ease; /* Smooth transition */
        }

        table caption {
            font-size: 1.5em;
            margin: 10px 0;
            color: #e91e63;
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

        .no-data {
            font-size: 18px;
            color: #e91e63;
            margin-top: 20px;
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
        ArrayList<RoomBean> rl=(ArrayList<RoomBean>)hs.getAttribute("rooms");
        if ( rl==null||rl.size()==0) {
            request.setAttribute("msg", "no rooms found");
            RequestDispatcher rd = request.getRequestDispatcher("Welcome.jsp");
            rd.include(request, response);
        } else {
%>
<center>
    <h1>ROOM DETAILS</h1>
    <table>
        <caption>Room Information</caption>
        <thead>
        <tr>
            <th>ROOM NO.</th>
            <th>FLOOR NO.</th>
            <th>TYPE</th>
            <th>STATUS</th>
            <th>GUEST NAME</th>
            <th>GUEST PHONE</th>
            <th>GUEST AADHAAR</th>
        </tr>
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
            <td><%=s.getGname()%></td>
            <td><%=s.getGphone()%></td>
            <td><%=s.getGaadahar()%></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</center>
<%
        }
    }
%>
</body>
</html>
