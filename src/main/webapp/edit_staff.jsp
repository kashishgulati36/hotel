<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Staff Details</title>
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

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8bbd0; /* Soft pink background */
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            position: relative;
        }

        .background-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) rotate(-20deg);
            font-size: 150px;
            color: rgba(255, 182, 193, 0.3); /* Light pink color with transparency */
            font-weight: bold;
            text-transform: uppercase;
            white-space: nowrap;
            z-index: -1;
            text-align: center;
            animation: fadeIn 3s ease-in-out infinite alternate;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.9); /* Semi-transparent background */
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            z-index: 1;
            animation: fadeIn 1.5s ease-in-out;
            text-align: center;
        }

        h1 {
            color: #e91e63;
            font-size: 28px;
            text-transform: uppercase;
            font-family: 'Brush Script MT', cursive; /* Stylish font for headers */
            margin-bottom: 20px;
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
<div class="form-container">
    <h1>Edit Staff Details</h1>
    <form action="staff_edit" method="post">
        ENTER STAFF NAME: <input type="text" name="sname" required><br>
        ENTER OLD DESIGNATION: <input type="text" name="odesg" required><br>
        ENTER NEW DESIGNATION: <input type="text" name="ndesg" required><br>
        ENTER REGISTERED PHONE NUMBER: <input type="text" name="uphone" maxlength="10" required><br>
        <input type="submit" value="Submit">
    </form>
</div>
</body>
</html>
