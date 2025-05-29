<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Reservation, com.dao.ReservationDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Update Reservation | Hotel Management System</title>
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
        .content-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            position: relative;
            overflow: hidden;
        }
        .content-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.05), rgba(118, 75, 162, 0.05));
            transition: left 0.5s ease;
        }
        .content-container:hover::before {
            left: 0;
        }
        .section-header {
            text-align: center;
            margin-bottom: 30px;
            position: relative;
            z-index: 1;
        }
        .section-header i {
            font-size: 3rem;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 15px;
        }
        .section-header h2 {
            color: #333;
            font-size: 1.8rem;
            font-weight: 600;
            margin-bottom: 8px;
        }
        .section-header p {
            color: #666;
            font-size: 0.95rem;
        }
        /* Error Message */
        .error {
            background: linear-gradient(135deg, #ff6b6b, #ee5a5a);
            color: white;
            padding: 15px 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 500;
            box-shadow: 0 4px 15px rgba(238, 90, 90, 0.3);
            position: relative;
            z-index: 1;
        }
        .error i {
            margin-right: 8px;
        }
        /* Form Styles */
        .form-container {
            position: relative;
            z-index: 1;
        }
        .form-group {
            margin-bottom: 25px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 600;
            font-size: 0.95rem;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .form-group label i {
            color: #667eea;
            width: 16px;
        }
        .form-group input {
            width: 100%;
            padding: 15px 18px;
            border: 2px solid #e1e5e9;
            border-radius: 12px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
        }
        .form-group input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            transform: translateY(-2px);
        }
        .form-group input:hover {
            border-color: #764ba2;
        }
        /* Button Styles */
        .btn-container {
            text-align: center;
            margin-top: 30px;
        }
        .btn-primary {
            display: inline-flex;
            align-items: center;
            gap: 12px;
            padding: 16px 40px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
            position: relative;
            overflow: hidden;
            z-index: 1;
            min-width: 200px;
        }
        .btn-primary::before {
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
        .btn-primary:hover::before {
            left: 0;
        }
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 35px rgba(102, 126, 234, 0.4);
        }
        .btn-primary:active {
            transform: translateY(-1px);
        }
        /* Back Link */
        .back-link {
            text-align: center;
            margin-top: 30px;
            position: relative;
            z-index: 1;
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
            .content-container {
                padding: 30px 20px;
            }
            .page-title {
                font-size: 2rem;
            }
            .btn-primary {
                width: 100%;
                padding: 16px 20px;
            }
        }
        @media (max-width: 480px) {
            .container {
                padding: 0 10px;
            }
            .content-container {
                padding: 20px 15px;
            }
            .page-title {
                font-size: 1.8rem;
            }
            .form-group input {
                padding: 12px 15px;
            }
        }
    </style>
</head>
<body>
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
        <h1 class="page-title">Update Reservation</h1>      
        <div class="content-container">
            <div class="section-header">
                <i class="fas fa-edit"></i>
                <h2>Modify Reservation Details</h2>
                <p>Update the reservation information below</p>
            </div>
            <%
            String idParam = request.getParameter("id");
            if (idParam == null) {
                response.sendRedirect("reservationdisplay.jsp");
                return;
            }
            int id = Integer.parseInt(idParam);
            ReservationDAO reservationDAO = new ReservationDAO();
            Reservation reservation = reservationDAO.selectReservation(id);
            if (reservation == null) {
                response.sendRedirect("reservationdisplay.jsp");
                return;
            }
            if (request.getAttribute("errorMessage") != null) { %>
                <div class="error">
                    <i class="fas fa-exclamation-triangle"></i>
                    <%= request.getAttribute("errorMessage") %>
                </div>
            <% } %>
            <div class="form-container">
                <form action="UpdateReservationServlet" method="post">
                    <input type="hidden" name="reservationId" value="<%= reservation.getReservationId() %>">
                    <div class="form-group">
                        <label for="customerName">
                            <i class="fas fa-user"></i>
                            Customer Name:
                        </label>
                        <input type="text" id="customerName" name="customerName" value="<%= reservation.getCustomerName() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="roomNumber">
                            <i class="fas fa-door-open"></i>
                            Room Number:
                        </label>
                        <input type="text" id="roomNumber" name="roomNumber" value="<%= reservation.getRoomNumber() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="checkIn">
                            <i class="fas fa-calendar-check"></i>
                            Check-In Date:
                        </label>
                        <input type="date" id="checkIn" name="checkIn"
                               value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(reservation.getCheckIn()) %>" required>
                    </div>
                    <div class="form-group">
                        <label for="checkOut">
                            <i class="fas fa-calendar-times"></i>
                            Check-Out Date:
                        </label>
                        <input type="date" id="checkOut" name="checkOut"
                               value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(reservation.getCheckOut()) %>" required>
                    </div>
                    <div class="form-group">
                        <label for="totalAmount">
                            <i class="fas fa-dollar-sign"></i>
                            Total Amount:
                        </label>
                        <input type="number" id="totalAmount" name="totalAmount" step="0.01"
                               value="<%= reservation.getTotalAmount() %>" required>
                    </div>
                    <div class="btn-container">
                        <button type="submit" class="btn-primary">
                            <i class="fas fa-save"></i>
                            Update Reservation
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div class="back-link">
            <a href="reservationdisplay.jsp">
                <i class="fas fa-arrow-left"></i>
                Back to Reservations
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
</body>
</html>