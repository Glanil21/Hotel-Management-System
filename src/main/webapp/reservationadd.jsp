<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Reservation | Hotel Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #333;
            line-height: 1.6;
            min-height: 100vh;
        }
        /* Header */
        .header {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            padding: 1.2rem 0;
            position: sticky;
            top: 0;
            z-index: 100;
        }
        .header-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }
        .logo {
            display: flex;
            align-items: center;
            gap: 12px;
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
        }
        .logo i {
            font-size: 1.8rem;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .logo h2 {
            font-size: 1.6rem;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .nav-links {
            display: flex;
            gap: 30px;
        }
        .nav-links a {
            color: #333;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 25px;
            transition: all 0.3s ease;
            font-weight: 500;
            position: relative;
            overflow: hidden;
        }
        .nav-links a::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #667eea, #764ba2);
            transition: left 0.3s ease;
            z-index: -1;
        }
        .nav-links a:hover::before {
            left: 0;
        }
        .nav-links a:hover {
            color: white;
            transform: translateY(-2px);
        }
        /* Main Content */
        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 0 20px;
        }
        .page-title {
            text-align: center;
            margin-bottom: 40px;
            color: white;
            font-size: 2.5rem;
            font-weight: 300;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }
        .form-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            position: relative;
            overflow: hidden;
        }
        .form-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.05), rgba(118, 75, 162, 0.05));
            transition: left 0.5s ease;
        }
        .form-container:hover::before {
            left: 0;
        }
        .form-header {
            text-align: center;
            margin-bottom: 30px;
            position: relative;
            z-index: 1;
        }
        .form-header i {
            font-size: 3rem;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 15px;
        }
        .form-header h2 {
            color: #333;
            font-size: 1.8rem;
            font-weight: 600;
            margin-bottom: 8px;
        }
        .form-header p {
            color: #666;
            font-size: 0.95rem;
        }
        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
            position: relative;
            z-index: 1;
        }
        .form-group {
            display: flex;
            flex-direction: column;
        }
        .form-group.full-width {
            grid-column: 1 / -1;
        }
        label {
            margin-bottom: 8px;
            color: #333;
            font-weight: 600;
            font-size: 0.95rem;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        label i {
            color: #667eea;
            font-size: 1rem;
        }
        input {
            padding: 15px 18px;
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: white;
            color: #333;
        }
        input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            transform: translateY(-1px);
        }
        input:hover {
            border-color: #667eea;
        }
        .btn-container {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 30px;
            position: relative;
            z-index: 1;
        }
        .btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 16px 32px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 25px;
            transition: all 0.3s ease;
            font-weight: 600;
            font-size: 1rem;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }
        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #764ba2, #667eea);
            transition: left 0.3s ease;
            z-index: -1;
        }
        .btn:hover::before {
            left: 0;
        }
        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 35px rgba(102, 126, 234, 0.4);
        }
        .btn-secondary {
            background: linear-gradient(135deg, #95a5a6, #7f8c8d);
            box-shadow: 0 8px 25px rgba(149, 165, 166, 0.3);
        }
        .btn-secondary::before {
            background: linear-gradient(135deg, #7f8c8d, #95a5a6);
        }
        .btn-secondary:hover {
            box-shadow: 0 15px 35px rgba(149, 165, 166, 0.4);
        }
        .back-link {
            text-align: center;
            margin-top: 30px;
        }
        .back-link a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 12px 20px;
            border-radius: 25px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease;
        }
        .back-link a:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: translateY(-2px);
        }
        /* Footer */
        .footer {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-top: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            text-align: center;
            padding: 30px 20px;
            margin-top: 80px;
        }
        .footer-bottom {
            color: rgba(255, 255, 255, 0.8);
            font-size: 0.9rem;
        }
        /* Responsive */
        @media (max-width: 768px) {
            .header-container {
                flex-direction: column;
                gap: 15px;
            }
            .nav-links {
                gap: 15px;
                flex-wrap: wrap;
                justify-content: center;
            }
            .form-container {
                padding: 30px 20px;
            }
            .form-grid {
                grid-template-columns: 1fr;
            }
            .btn-container {
                flex-direction: column;
                align-items: center;
            }
            .btn {
                width: 100%;
                justify-content: center;
            }
        }
        /* Error handling */
        .error {
            color: #e74c3c;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <!-- Backend Error Handling (unchanged) -->
    <%
        String status = request.getParameter("status");
        String errorMessage = (String) request.getAttribute("error");
        if ("fail".equals(status) && errorMessage != null) {
    %>
        <script>
            alert("Reservation failed: <%= errorMessage.replace("\"", "\\\"") %>");
            // Clean URL
            if (window.history.replaceState) {
                window.history.replaceState(null, null, window.location.pathname);
            }
        </script>
    <%
        }
    %>
    <!-- Header -->
    <header class="header">
        <div class="header-container">
            <a href="index.jsp" class="logo">
                <i class="fas fa-hotel"></i>
                <h2>Hotel Reservation System</h2>
            </a>
            <nav class="nav-links">
                <a href="index.jsp">Home</a>
                <a href="#services">Services</a>
            </nav>
        </div>
    </header>
    <!-- Main Content -->
    <div class="container">
        <h1 class="page-title">Create New Reservation</h1>
        <div class="form-container">
            <div class="form-header">
                <i class="fas fa-calendar-plus"></i>
                <h2>Reservation Details</h2>
                <p>Fill in the information below to create a new hotel reservation</p>
            </div>
            <!-- Form (backend unchanged) -->
            <form action="AddReservationServlet" method="post">
                <div class="form-grid">
                    <div class="form-group">
                        <label for="customerName">
                            <i class="fas fa-user"></i>
                            Customer Name:
                        </label>
                        <input type="text" id="customerName" name="customerName" required>
                    </div>
                    <div class="form-group">
                        <label for="roomNumber">
                            <i class="fas fa-door-open"></i>
                            Room Number:
                        </label>
                        <input type="text" id="roomNumber" name="roomNumber" required>
                    </div>
                    <div class="form-group">
                        <label for="checkIn">
                            <i class="fas fa-calendar-check"></i>
                            Check-In Date:
                        </label>
                        <input type="date" id="checkIn" name="checkIn" required>
                    </div>
                    <div class="form-group">
                        <label for="checkOut">
                            <i class="fas fa-calendar-times"></i>
                            Check-Out Date:
                        </label>
                        <input type="date" id="checkOut" name="checkOut" required>
                    </div>
                    <div class="form-group full-width">
                        <label for="totalAmount">
                            <i class="fas fa-dollar-sign"></i>
                            Total Amount:
                        </label>
                        <input type="number" id="totalAmount" name="totalAmount" step="0.01" required>
                    </div>
                </div>
                <div class="btn-container">
                    <button type="submit" class="btn">
                        <i class="fas fa-plus-circle"></i>
                        Add Reservation
                    </button>
                </div>
            </form>
        </div>
        <div class="back-link">
            <a href="index.jsp">
                <i class="fas fa-arrow-left"></i>
                Back to Home
            </a>
        </div>
    </div>
    <!-- Footer -->
    <footer class="footer">
        <div class="footer-content">
            <div class="footer-bottom">
                <p>&copy; 2025 HotelEase. All rights reserved.</p>
            </div>
        </div>
    </footer>
    <script>
        // Set minimum date to today for check-in
        document.addEventListener('DOMContentLoaded', function() {
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('checkIn').min = today;
            document.getElementById('checkOut').min = today;        
            // Update check-out minimum when check-in changes
            document.getElementById('checkIn').addEventListener('change', function() {
                document.getElementById('checkOut').min = this.value;
            });
        });
    </script>
</body>
</html>