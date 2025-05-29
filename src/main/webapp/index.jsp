<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HotelEase | Hotel Management System</title>
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
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
        }
        .page-title {
            text-align: center;
            margin-bottom: 50px;
            color: white;
            font-size: 2.5rem;
            font-weight: 300;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }
        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-bottom: 40px;
        }
        .service-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px 30px;
            text-align: center;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            transition: all 0.4s ease;
            border: 1px solid rgba(255, 255, 255, 0.2);
            position: relative;
            overflow: hidden;
        }
        .service-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
            transition: left 0.5s ease;
        }
        .service-card:hover::before {
            left: 0;
        }
        .service-card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 25px 50px rgba(0,0,0,0.2);
        }
        .service-icon {
            font-size: 3.5rem;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 25px;
            position: relative;
            z-index: 1;
        }
        .service-card h3 {
            margin-bottom: 18px;
            color: #333;
            font-size: 1.4rem;
            font-weight: 600;
            position: relative;
            z-index: 1;
        }
        .service-card p {
            color: #666;
            margin-bottom: 30px;
            font-size: 0.95rem;
            line-height: 1.6;
            position: relative;
            z-index: 1;
        }
        .btn {
            display: inline-block;
            padding: 14px 32px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            text-decoration: none;
            border-radius: 25px;
            transition: all 0.3s ease;
            font-weight: 500;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
            position: relative;
            z-index: 1;
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
            background: linear-gradient(135deg, #667eea, #764ba2);
            box-shadow: 0 8px 25px rgba(149, 165, 166, 0.3);
        }
        .btn-secondary::before {
            background: linear-gradient(135deg, #764ba2, #667eea);
        }
        .btn-secondary:hover {
            box-shadow: 0 15px 35px rgba(149, 165, 166, 0.4);
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
        /* Toast Notification */
        .toast {
            position: fixed;
            top: 90px;
            right: 20px;
            background-color: white;
            color: #333;
            padding: 15px 20px;
            border-radius: 5px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            display: flex;
            align-items: center;
            gap: 10px;
            z-index: 1000;
            opacity: 0;
            transform: translateY(-20px);
            transition: opacity 0.3s ease, transform 0.3s ease;
            max-width: 350px;
        }
        .toast.show {
            opacity: 1;
            transform: translateY(0);
        }
        .toast.success {
            border-left: 4px solid #27ae60;
        }
        .toast.success i {
            color: #27ae60;
        }
        .toast-content {
            flex: 1;
        }
        .toast-title {
            font-weight: 600;
            margin-bottom: 3px;
        }
        .toast-message {
            font-size: 0.9rem;
            color: #666;
        }
        .toast-close {
            color: #999;
            background: none;
            border: none;
            font-size: 1.2rem;
            cursor: pointer;
            padding: 0;
            margin-left: 10px;
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
            .services-grid {
                grid-template-columns: 1fr;
            }
            .footer-info {
                grid-template-columns: 1fr;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <!-- Status Alert Scripts -->
    <%
        String status = request.getParameter("status");
        String toastMessage = "";
        String toastTitle = "";       
        if ("success".equals(status)) {
            toastTitle = "Success!";
            toastMessage = "Your reservation has been successfully created.";
        } else if ("deleted".equals(status)) {
            toastTitle = "Success!";
            toastMessage = "Your reservation has been successfully deleted.";
        } else if ("done".equals(status)) {
            toastTitle = "Success!";
            toastMessage = "Your reservation has been successfully updated.";
        }      
        if (!toastMessage.isEmpty()) {
    %>
        <div id="toast" class="toast success">
            <i class="fas fa-check-circle"></i>
            <div class="toast-content">
                <div class="toast-title"><%= toastTitle %></div>
                <div class="toast-message"><%= toastMessage %></div>
            </div>
            <button class="toast-close" onclick="closeToast()">&times;</button>
        </div>
        <script>
            function closeToast() {
                document.getElementById('toast').classList.remove('show');
                setTimeout(() => {
                    document.getElementById('toast').style.display = 'none';
                }, 300);
            }
            window.onload = function() {
                setTimeout(() => {
                    document.getElementById('toast').classList.add('show');
                }, 100);             
                setTimeout(() => {
                    closeToast();
                }, 5000);              
                if (window.history.replaceState) {
                    window.history.replaceState(null, null, window.location.pathname);
                }
            };
        </script>
    <% } %>
    <!-- Header -->
    <header class="header">
        <div class="header-container">
            <a href="index.jsp" class="logo">
                <i class="fas fa-hotel"></i>
                <h2>HotelEase</h2>
            </a>
            <nav class="nav-links">
                <a href="index.jsp">Home</a>
                <a href="#services">Services</a>
            </nav>
        </div>
    </header>
    <!-- Main Content -->
    <div class="container">
        <h1 class="page-title">Hotel Management System</h1>      
        <div id="services" class="services-grid">
            <div class="service-card">
                <div class="service-icon">
                    <i class="fas fa-plus-circle"></i>
                </div>
                <h3>New Reservation</h3>
                <p>Create a new hotel room reservation with your preferred dates and room type.</p>
                <a href="reservationadd.jsp" class="btn">Create Booking</a>
            </div>          
            <div class="service-card">
                <div class="service-icon">
                    <i class="fas fa-list"></i>
                </div>
                <h3>View Reservations</h3>
                <p>View, edit, or cancel your existing hotel reservations and booking details.</p>
                <a href="DisplayReservationsServlet" class="btn">View Bookings</a>
            </div>          
            <div class="service-card">
                <div class="service-icon">
                    <i class="fas fa-chart-bar"></i>
                </div>
                <h3>Reports</h3>
                <p>Access booking reports and statistics for better reservation management.</p>
                <a href="reports.jsp" class="btn btn-secondary">View Reports</a>
            </div>
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
</body>
</html>