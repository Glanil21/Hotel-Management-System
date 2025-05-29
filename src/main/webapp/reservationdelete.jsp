<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Reservation, com.dao.ReservationDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Delete Reservation | Hotel Management System</title>
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
            color: #f44336;
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
        .warning-message {
            background: linear-gradient(135deg, #fff3cd, #ffeaa7);
            border: 1px solid #ffc107;
            color: #856404;
            padding: 20px;
            border-radius: 15px;
            margin-bottom: 30px;
            text-align: center;
            font-weight: 500;
            box-shadow: 0 5px 15px rgba(255, 193, 7, 0.2);
            position: relative;
            z-index: 1;
        }
        .warning-message i {
            font-size: 1.5rem;
            margin-right: 10px;
            color: #f57c00;
        }
        .reservation-details {
            background: rgba(255, 255, 255, 0.8);
            border: 1px solid rgba(102, 126, 234, 0.2);
            padding: 30px;
            margin: 30px 0;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            position: relative;
            z-index: 1;
        }
        .reservation-details h3 {
            color: #333;
            font-size: 1.4rem;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 600;
        }
        .details-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 15px;
        }
        .detail-item {
            display: flex;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid rgba(102, 126, 234, 0.1);
        }
        .detail-item:last-child {
            border-bottom: none;
        }
        .detail-item i {
            font-size: 1.2rem;
            color: #667eea;
            margin-right: 12px;
            width: 20px;
            text-align: center;
        }
        .detail-item strong {
            color: #333;
            margin-right: 8px;
            min-width: 120px;
        }
        .detail-item span {
            color: #555;
            font-weight: 500;
        }
        .actions {
            display: flex;
            gap: 20px;
            justify-content: center;
            margin-top: 40px;
            position: relative;
            z-index: 1;
        }
        .actions form {
            display: inline-block;
        }
        button {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 16px 32px;
            border: none;
            cursor: pointer;
            font-weight: 600;
            border-radius: 25px;
            font-size: 1rem;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        button.delete-btn {
            background: linear-gradient(135deg, #f44336, #d32f2f);
            color: white;
            box-shadow: 0 8px 25px rgba(244, 67, 54, 0.3);
        }
        button.delete-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #d32f2f, #b71c1c);
            transition: left 0.3s ease;
            z-index: -1;
        }
        button.delete-btn:hover::before {
            left: 0;
        }
        button.delete-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 35px rgba(244, 67, 54, 0.4);
        }
        a.cancel-btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            background: linear-gradient(135deg, #90a4ae, #78909c);
            color: white;
            padding: 16px 32px;
            text-decoration: none;
            border-radius: 25px;
            font-weight: 600;
            font-size: 1rem;
            transition: all 0.3s ease;
            box-shadow: 0 8px 25px rgba(144, 164, 174, 0.3);
            position: relative;
            overflow: hidden;
        }
        a.cancel-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #78909c, #607d8b);
            transition: left 0.3s ease;
            z-index: -1;
        }
        a.cancel-btn:hover::before {
            left: 0;
        }
        a.cancel-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 35px rgba(144, 164, 174, 0.4);
        }
        .error {
            background: linear-gradient(135deg, #ffebee, #ffcdd2);
            border: 1px solid #f44336;
            color: #c62828;
            padding: 20px;
            border-radius: 15px;
            margin-bottom: 30px;
            text-align: center;
            font-weight: 600;
            box-shadow: 0 5px 15px rgba(244, 67, 54, 0.2);
            position: relative;
            z-index: 1;
        }
        .error i {
            font-size: 1.5rem;
            margin-right: 10px;
        }
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
            .actions {
                flex-direction: column;
                align-items: center;
                gap: 15px;
            }
            .details-grid {
                grid-template-columns: 1fr;
            }
            .detail-item {
                flex-direction: column;
                align-items: flex-start;
                gap: 5px;
            }
            .detail-item strong {
                min-width: auto;
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
            .reservation-details {
                padding: 20px;
            }
            button, a.cancel-btn {
                padding: 14px 24px;
                font-size: 0.9rem;
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
                <a href="reservationdisplay.jsp">View Reservations</a>
                <a href="#services">Services</a>
            </nav>
        </div>
    </header>
    <!-- Main Content -->
    <div class="container">
        <h1 class="page-title">Delete Reservation</h1>
        
        <div class="content-container">
            <div class="section-header">
                <i class="fas fa-trash-alt"></i>
                <h2>Confirm Deletion</h2>
                <p>Review the reservation details before confirming deletion</p>
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
            <div class="warning-message">
                <i class="fas fa-exclamation-triangle"></i>
                Are you sure you want to delete this reservation? This action cannot be undone.
            </div>
            <div class="reservation-details">
                <h3><i class="fas fa-info-circle"></i> Reservation Details</h3>
                <div class="details-grid">
                    <div class="detail-item">
                        <i class="fas fa-hashtag"></i>
                        <strong>Reservation ID:</strong>
                        <span><%= reservation.getReservationId() %></span>
                    </div>
                    <div class="detail-item">
                        <i class="fas fa-user"></i>
                        <strong>Customer Name:</strong>
                        <span><%= reservation.getCustomerName() %></span>
                    </div>
                    <div class="detail-item">
                        <i class="fas fa-door-open"></i>
                        <strong>Room Number:</strong>
                        <span><%= reservation.getRoomNumber() %></span>
                    </div>
                    <div class="detail-item">
                        <i class="fas fa-calendar-check"></i>
                        <strong>Check-In Date:</strong>
                        <span><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(reservation.getCheckIn()) %></span>
                    </div>
                    <div class="detail-item">
                        <i class="fas fa-calendar-times"></i>
                        <strong>Check-Out Date:</strong>
                        <span><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(reservation.getCheckOut()) %></span>
                    </div>
                    <div class="detail-item">
                        <i class="fas fa-dollar-sign"></i>
                        <strong>Total Amount:</strong>
                        <span>$<%= String.format("%.2f", reservation.getTotalAmount()) %></span>
                    </div>
                </div>
            </div>
            <div class="actions">
                <form action="DeleteReservationServlet" method="post">
                    <input type="hidden" name="reservationId" value="<%= reservation.getReservationId() %>">
                    <button type="submit" class="delete-btn">
                        <i class="fas fa-trash-alt"></i>
                        Confirm Delete
                    </button>
                </form>
                <a href="reservationdisplay.jsp" class="cancel-btn">
                    <i class="fas fa-times"></i>
                    Cancel
                </a>
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