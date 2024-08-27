<%@ page import="com.ay.bean.StaffBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ay.bean.Managerbean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Staff Details</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #f8bbd0, #f48fb1); /* Pink gradient background */
            color: #333;
            text-align: center;
            padding: 20px;
        }

        h1 {
            color: #d81b60; /* Dark pink color */
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            margin-bottom: 30px;
        }

        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            border-radius: 15px;
            overflow: hidden;
        }

        thead {
            background: #d81b60; /* Dark pink */
            color: white;
        }

        th, td {
            padding: 15px;
            text-align: left;
        }

        th {
            text-transform: uppercase;
            font-size: 14px;
            letter-spacing: 1px;
        }

        tr:nth-child(even) {
            background: #fce4ec; /* Light pink */
        }

        tr:hover {
            background: #f8bbd0; /* Slightly darker pink on hover */
            transform: scale(1.02);
            transition: all 0.3s ease;
        }

        td {
            border-bottom: 1px solid #e0e0e0;
        }

        .no-data {
            font-size: 18px;
            color: #d81b60;
        }

        /* Add animation to rows */
        tr {
            animation: fadeIn 0.6s ease;
        }

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
    </style>
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
        ArrayList<StaffBean> al=(ArrayList<StaffBean>)hs.getAttribute("items");
        if ( al==null||al.size()==0) {
            request.setAttribute("msg", "no data found");
            RequestDispatcher rd = request.getRequestDispatcher("Welcome.jsp");
            rd.include(request, response);
        } else {
%>
<center>
    <h1>STAFF DETAILS</h1>
    <table>
        <thead>
        <tr>
            <th>Name</th>
            <th>Designation</th>
            <th>Phone</th>
            <th>Gender</th>
            <th>Manager ID</th>
        </tr>
        </thead>
        <tbody>
        <%
            for(StaffBean s:al){
        %>
        <tr>
            <td><%=s.getSname()%></td>
            <td><%=s.getSdesg()%></td>
            <td><%=s.getSphone()%></td>
            <td><%=s.getGender()%></td>
            <td><%=s.getMid()%></td>
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
