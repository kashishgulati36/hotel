<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Hotel Management Login</title>
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
      animation: fadeIn 1s ease-in-out; /* Fade-in animation */
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

    .hotel-name {
      font-size: 36px;
      color: #e91e63; /* Vibrant pink color */
      font-weight: 700;
      margin-bottom: 20px;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.4);
      letter-spacing: 1px;
      transition: color 0.3s ease;
      animation: slideIn 1s ease-in-out; /* Slide-in animation */
    }

    .hotel-name:hover {
      color: #d81b60; /* Slightly darker pink */
    }

    h2 {
      color: #333;
      font-size: 28px;
      margin-bottom: 30px;
      font-weight: 500;
      letter-spacing: 1px;
      animation: fadeIn 1.5s ease-in-out; /* Fade-in animation */
    }

    a {
      display: block;
      text-decoration: none;
      color: #fff;
      padding: 15px 25px;
      margin: 15px 0;
      border-radius: 25px;
      font-size: 18px;
      font-weight: 600;
      position: relative;
      overflow: hidden;
      text-transform: uppercase;
      text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
      transition: all 0.3s ease;
      animation: slideIn 1s ease-in-out; /* Slide-in animation for links */
    }

    a::before {
      content: '';
      position: absolute;
      top: 0;
      left: 50%;
      width: 200%;
      height: 100%;
      background: rgba(255, 255, 255, 0.3);
      transform: translateX(-50%) scaleX(0);
      transition: transform 0.4s ease;
    }

    a:hover::before {
      transform: translateX(-50%) scaleX(1);
    }

    a:hover {
      transform: translateY(-5px);
      box-shadow: 0 15px 25px rgba(0, 0, 0, 0.3);
    }

    a:active {
      transform: translateY(0);
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    }

    .manager {
      background: #f06292; /* Light pink */
    }

    .staff {
      background: #ec407a; /* Medium pink */
    }

    .guest {
      background: #d81b60; /* Dark pink */
    }

    .manager:hover {
      background: #f48fb1; /* Lighter pink on hover */
    }

    .staff:hover {
      background: #f06292; /* Lighter pink on hover */
    }

    .guest:hover {
      background: #c2185b; /* Even darker pink on hover */
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

    @keyframes slideIn {
      from {
        transform: translateY(50px);
        opacity: 0;
      }
      to {
        transform: translateY(0);
        opacity: 1;
      }
    }

    @media (max-width: 600px) {
      .login-container {
        padding: 20px;
      }

      .hotel-name {
        font-size: 30px;
      }

      h2 {
        font-size: 24px;
      }

      a {
        font-size: 16px;
        padding: 12px 20px;
      }
    }
  </style>
  <script>
    function showLoginAlert(role) {
      const roleMessages = {
        'Manager': 'You have selected the Manager login.',
        'Staff': 'You have selected the Staff login.',
        'Guest': 'You have selected the Guest login.'
      };
      alert(roleMessages[role] || 'Role not recognized.');
    }
  </script>
</head>
<body>
<div class="login-container">
  <div class="hotel-name">The Grand Vista</div>
  <h2>LOGIN HERE</h2>
  <a href="manager.jsp" class="manager" onclick="showLoginAlert('Manager')">Manager</a>
  <a href="staff.jsp" class="staff" onclick="showLoginAlert('Staff')">Staff</a>
  <a href="guest.jsp" class="guest" onclick="showLoginAlert('Guest')">Guest</a>
</div>
</body>
</html>
