
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manager Account Creation</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #f9a8d4, #fcd1d1); /* Gradient background with pink tones */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #333;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.9); /* Light semi-transparent background */
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        h2 {
            color: #e91e63; /* Vibrant pink color */
            font-size: 24px;
            margin-bottom: 20px;
            font-weight: 700;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
        }

        label {
            display: block;
            text-align: left;
            margin: 10px 0 5px;
            color: #333;
            font-weight: 600;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 2px solid #f06292; /* Light pink border */
            border-radius: 25px;
            font-size: 16px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background: #f06292; /* Light pink */
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 15px;
            transition: background 0.3s ease, transform 0.2s ease;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }

        input[type="submit"]:hover {
            background: #ec407a; /* Medium pink */
            transform: translateY(-3px);
        }

        input[type="submit"]:active {
            transform: translateY(1px);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
        }

        @media (max-width: 600px) {
            .form-container {
                padding: 20px;
            }

            h2 {
                font-size: 20px;
            }

            input[type="text"], input[type="password"], input[type="submit"] {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Create Manager Account</h2>
    <form action="manager2" method="post" onsubmit="return validateForm()">
        <label for="mname">Enter Your Full Name:</label>
        <input type="text" id="mname" name="mname" required>

        <label for="mphone">Enter Your Phone Number:</label>
        <input type="text" id="mphone" name="mphone" required>

        <label for="mid">Enter Manager ID:</label>
        <input type="text" id="mid" name="mid" required>

        <label for="mpass">Create Password:</label>
        <input type="password" id="mpass" name="mpass" required>

        <input type="submit" value="Create Account">
    </form>
</div>
<script>
    function validateForm() {
        const phoneInput = document.getElementById('mphone').value;
        if (phoneInput.length !== 10 || isNaN(phoneInput)) {
            alert('Please enter a valid 10-digit phone number.');
            return false;
        }
        return true;
    }
</script>
</body>
</html>
