<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Reservation, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>View Reservations | Hotel Management System</title>
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
            max-width: 1400px;
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
        .add-btn {
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
            margin-bottom: 30px;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }
        .add-btn::before {
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
        .add-btn:hover::before {
            left: 0;
        }
        .add-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 35px rgba(102, 126, 234, 0.4);
        }
        /* Table Styles */
        .table-wrapper {
            position: relative;
            z-index: 1;
            overflow-x: auto;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 15px;
            overflow: hidden;
        }
        th {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 20px 15px;
            text-align: left;
            font-weight: 600;
            font-size: 0.95rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border: none;
        }
        td {
            padding: 18px 15px;
            border-bottom: 1px solid #f0f0f0;
            font-size: 0.95rem;
            vertical-align: middle;
        }
        tr:nth-child(even) {
            background: rgba(102, 126, 234, 0.02);
        }
        tr:hover {
            background: rgba(102, 126, 234, 0.05);
            transform: scale(1.001);
            transition: all 0.2s ease;
        }
        .actions {
            display: flex;
            gap: 15px;
            align-items: center;
        }
        .actions a {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 8px 16px;
            border-radius: 20px;
            text-decoration: none;
            font-weight: 500;
            font-size: 0.85rem;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        .update {
            background: linear-gradient(135deg, #4CAF50, #45a049);
            color: white;
            box-shadow: 0 4px 15px rgba(76, 175, 80, 0.3);
        }
        .update::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #45a049, #4CAF50);
            transition: left 0.3s ease;
            z-index: -1;
        }
        .update:hover::before {
            left: 0;
        }
        .update:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(76, 175, 80, 0.4);
        }
        .delete {
            background: linear-gradient(135deg, #f44336, #d32f2f);
            color: white;
            box-shadow: 0 4px 15px rgba(244, 67, 54, 0.3);
        }
        .delete::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #d32f2f, #f44336);
            transition: left 0.3s ease;
            z-index: -1;
        }
        .delete:hover::before {
            left: 0;
        }
        .delete:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(244, 67, 54, 0.4);
        }
        .no-data {
            text-align: center;
            padding: 60px 20px;
            color: #666;
            font-style: italic;
            font-size: 1.1rem;
            background: rgba(102, 126, 234, 0.05);
        }
        .no-data i {
            font-size: 3rem;
            color: #667eea;
            margin-bottom: 15px;
            display: block;
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
                gap: 8px;
            }
            .actions a {
                width: 100%;
                justify-content: center;
            }
            th, td {
                padding: 12px 8px;
                font-size: 0.85rem;
            }
            .table-wrapper {
                border-radius: 10px;
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
            th, td {
                padding: 10px 6px;
                font-size: 0.8rem;
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
        <h1 class="page-title">Current Reservations</h1>     
        <div class="content-container">
            <div class="section-header">
                <i class="fas fa-list-alt"></i>
                <h2>Reservation Management</h2>
                <p>View, update, and manage all hotel reservations</p>
            </div>
            <a href="reservationadd.jsp" class="add-btn">
                <i class="fas fa-plus-circle"></i>
                Add New Reservation
            </a>           
            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th><i class="fas fa-hashtag"></i> Reservation ID</th>
                            <th><i class="fas fa-user"></i> Customer Name</th>
                            <th><i class="fas fa-door-open"></i> Room Number</th>
                            <th><i class="fas fa-calendar-check"></i> Check-In Date</th>
                            <th><i class="fas fa-calendar-times"></i> Check-Out Date</th>
                            <th><i class="fas fa-dollar-sign"></i> Total Amount</th>
                            <th><i class="fas fa-cogs"></i> Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% 
                    List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
                    if (reservations != null && !reservations.isEmpty()) {
                        for (Reservation reservation : reservations) { 
                    %>
                        <tr>
                            <td><%= reservation.getReservationId() %></td>
                            <td><%= reservation.getCustomerName() %></td>
                            <td><%= reservation.getRoomNumber() %></td>
                            <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(reservation.getCheckIn()) %></td>
                            <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(reservation.getCheckOut()) %></td>
                            <td>$<%= String.format("%.2f", reservation.getTotalAmount()) %></td>
                            <td class="actions">
                                <a href="reservationupdate.jsp?id=<%= reservation.getReservationId() %>" class="update">
                                    <i class="fas fa-edit"></i>
                                    Update
                                </a>
                                <a href="reservationdelete.jsp?id=<%= reservation.getReservationId() %>" class="delete" onclick="return confirm('Are you sure you want to delete this reservation?');">
                                    <i class="fas fa-trash-alt"></i>
                                    Delete
                                </a>
                            </td>
                        </tr>
                    <% 
                        }
                    } else { 
                    %>
                        <tr>
                            <td colspan="7" class="no-data">
                                <i class="fas fa-inbox"></i>
                                No reservations found.
                            </td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
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
</body>
</html>