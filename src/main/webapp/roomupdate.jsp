<%@ page import="com.ay.bean.Managerbean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Room Update</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #f9a8d4, #fcd1d1); /* Pink gradient background */
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 600px;
            margin: 20px;
        }

        h1 {
            color: #e91e63;
            text-align: center;
            margin-bottom: 30px;
            font-size: 24px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        label {
            font-weight: bold;
            color: #333;
        }

        input[type="text"] {
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            width: calc(100% - 24px);
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #e91e63;
            color: #fff;
            border: none;
            padding: 15px;
            border-radius: 8px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        input[type="submit"]:hover {
            background-color: #d81b60;
            transform: scale(1.05);
        }

        input[type="submit"]:active {
            background-color: #c2185b;
        }

        .error {
            color: #d32f2f;
            font-size: 14px;
            margin-top: -10px;
            margin-bottom: 10px;
        }
    </style>
    <script>
        function validateForm() {
            const rnum = document.forms["updateForm"]["rnum"].value;
            const rstatus = document.forms["updateForm"]["rstatus"].value;
            const gname = document.forms["updateForm"]["gname"].value;
            const gphone = document.forms["updateForm"]["gphone"].value;
            const gaadhar = document.forms["updateForm"]["gaadhar"].value;

            let valid = true;
            let errorMessage = "";

            // Clear previous errors
            document.querySelectorAll(".error").forEach(el => el.textContent = "");

            if (rnum == "") {
                errorMessage += "Room number is required.\n";
                document.querySelector("#rnum-error").textContent = "Room number is required.";
                valid = false;
            }
            if (rstatus == "") {
                errorMessage += "Room status is required.\n";
                document.querySelector("#rstatus-error").textContent = "Room status is required.";
                valid = false;
            }
            if (gname == "") {
                errorMessage += "Guest name is required.\n";
                document.querySelector("#gname-error").textContent = "Guest name is required.";
                valid = false;
            }
            if (gphone == "" || gphone.length != 10) {
                errorMessage += "Valid guest phone number is required.\n";
                document.querySelector("#gphone-error").textContent = "Valid phone number (10 digits) is required.";
                valid = false;
            }
            if (gaadhar == "" || gaadhar.length != 12) {
                errorMessage += "Valid guest Aadhar number is required.\n";
                document.querySelector("#gaadhar-error").textContent = "Valid Aadhar number (12 digits) is required.";
                valid = false;
            }

            if (!valid) {
                alert(errorMessage);
            }

            return valid;
        }
    </script>
</head>
<body>
<%
    HttpSession hs = request.getSession(false);
    Managerbean mb = (Managerbean) hs.getAttribute("mbean");
    if (mb == null) {
        request.setAttribute("msg", "session expired");
        request.getRequestDispatcher("manager.jsp").include(request, response);
    } else {
%>
<div class="container">
    <h1>Update Room Information</h1>
    <form name="updateForm" action="updateroom" method="post" onsubmit="return validateForm()">
        <label for="rnum">ENTER ROOM NUMBER:</label>
        <input type="text" id="rnum" name="rnum">
        <span id="rnum-error" class="error"></span>

        <label for="rstatus">UPDATED ROOM STATUS:</label>
        <input type="text" id="rstatus" name="rstatus">
        <span id="rstatus-error" class="error"></span>

        <label for="gname">GUEST NAME:</label>
        <input type="text" id="gname" name="gname">
        <span id="gname-error" class="error"></span>

        <label for="gphone">GUEST PHONE NUMBER:</label>
        <input type="text" id="gphone" name="gphone" maxlength="10">
        <span id="gphone-error" class="error"></span>

        <label for="gaadhar">GUEST AADHAR NUMBER:</label>
        <input type="text" id="gaadhar" name="gaadhar" maxlength="12">
        <span id="gaadhar-error" class="error"></span>

        <input type="submit" value="Update Room">
    </form>
</div>
<%
    }
%>
</body>
</html>
