<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manager Login - The Grand Vista</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #f9a8d4, #fcd1d1); /* Gradient background matching the previous page */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #333;
        }

        .login-container {
            max-width: 450px;
            width: 100%;
            padding: 40px;
            border-radius: 15px;
            background: rgba(255, 255, 255, 0.9); /* Light semi-transparent background */
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
            text-align: center;
            position: relative;
            z-index: 1;
            animation: fadeIn 1s ease-in-out;
        }

        .login-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.2));
            z-index: -1;
        }

        .login-title {
            font-size: 28px;
            color: #e91e63;
            font-weight: 700;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.4);
            letter-spacing: 1px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 10px;
            border: 1px solid #ddd;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #e91e63;
            outline: none;
        }

        input[type="submit"],
        input[type="button"] {
            background: #ec407a; /* Medium pink matching the previous buttons */
            color: #fff;
            padding: 12px 25px;
            margin: 15px 0;
            border: none;
            border-radius: 25px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        input[type="submit"]:hover,
        input[type="button"]:hover {
            background: #d81b60; /* Darker pink on hover */
            transform: translateY(-3px);
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.3);
        }

        input[type="submit"]:active,
        input[type="button"]:active {
            transform: translateY(0);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        a {
            text-decoration: none;
            color: #fff;
            margin-top: 10px;
            display: inline-block;
            font-size: 14px;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #f06292;
        }

        /* Keyframes for animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @media (max-width: 600px) {
            .login-container {
                padding: 20px;
            }

            .login-title {
                font-size: 24px;
            }

            input[type="submit"],
            input[type="button"] {
                font-size: 16px;
                padding: 10px 20px;
            }
        }
    </style>
    <script>
        function showLoginAlert() {
            alert("You have successfully submitted your login details.");
        }
    </script>
</head>
<body>
<div class="login-container">
    <div class="login-title">Manager Login</div>
    <form action="manager1" method="post" onsubmit="showLoginAlert()">
        <label for="mid">MANAGER ID:</label>
        <input type="text" id="mid" name="mid" required>
        <label for="mpass">MANAGER PASSWORD:</label>
        <input type="password" id="mpass" name="mpass" required>
        <input type="submit" value="Login">
        <a href="manager2.jsp"><input type="button" value="Create Account"></a>
    </form>
    <%
        String msg = (String) request.getAttribute("msg");
        if (msg != null) {
            out.print("<p style='color: #e91e63; font-weight: bold;'>" + msg + "</p>");
        }
    %>
</div>
</body>
</html>
