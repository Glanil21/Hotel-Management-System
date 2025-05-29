<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Reservation, java.util.List, java.util.Arrays" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Results</title>
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
            color: #e1e5e9;
            line-height: 1.6;
            overflow-x: hidden;
            min-height: 100vh;
            padding: 2rem 1rem;
        }

        /* Animated Background */
        .bg-pattern {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: 
                radial-gradient(circle at 20% 50%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(255, 119, 198, 0.3) 0%, transparent 50%),
                radial-gradient(circle at 40% 80%, rgba(120, 219, 255, 0.3) 0%, transparent 50%);
            z-index: -1;
            animation: moveBackground 20s ease-in-out infinite;
        }

        @keyframes moveBackground {
            0%, 100% { transform: translateX(0) translateY(0); }
            25% { transform: translateX(-5px) translateY(-10px); }
            50% { transform: translateX(10px) translateY(5px); }
            75% { transform: translateX(-3px) translateY(8px); }
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: rgba(26, 32, 56, 0.9);
            backdrop-filter: blur(15px);
            border-radius: 25px;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.5);
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.1);
            position: relative;
            animation: containerSlideIn 0.8s ease-out;
        }

        @keyframes containerSlideIn {
            from {
                opacity: 0;
                transform: translateY(50px) scale(0.95);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 3rem 2.5rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .header::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, rgba(255, 255, 255, 0.1), transparent);
            animation: headerShine 3s ease-in-out infinite;
        }

        @keyframes headerShine {
            0% { left: -100%; }
            50% { left: 100%; }
            100% { left: 100%; }
        }

        .content {
            padding: 3rem 2.5rem;
            background: white;
            color: #333;
        }

        h1 {
            font-size: 2.5rem;
            margin-bottom: 0.8rem;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 2px;
            position: relative;
            z-index: 2;
        }

        .report-info {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
            border-radius: 20px;
            padding: 2rem;
            margin-bottom: 2rem;
            border-left: 5px solid #667eea;
            backdrop-filter: blur(10px);
            animation: summarySlide 0.6s ease-out;
            position: relative;
            overflow: hidden;
        }

        @keyframes summarySlide {
            from {
                opacity: 0;
                transform: translateX(-30px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .report-info h2 {
            font-size: 1.8rem;
            font-weight: 700;
            color: #667eea;
            margin-bottom: 0.5rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            animation: tableSlide 0.8s ease-out;
            border: 1px solid rgba(102, 126, 234, 0.1);
        }

        @keyframes tableSlide {
            from {
                opacity: 0;
                transform: translateY(40px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        th, td {
            border: 1px solid rgba(102, 126, 234, 0.1);
            padding: 1.2rem 1rem;
            text-align: left;
            transition: all 0.3s ease;
        }

        th {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 0.9rem;
        }

        tr:nth-child(even) {
            background-color: rgba(102, 126, 234, 0.02);
        }

        tbody tr {
            transition: all 0.3s ease;
            animation: rowSlide 0.5s ease-out;
            animation-fill-mode: both;
        }

        tbody tr:nth-child(1) { animation-delay: 0.1s; }
        tbody tr:nth-child(2) { animation-delay: 0.15s; }
        tbody tr:nth-child(3) { animation-delay: 0.2s; }
        tbody tr:nth-child(4) { animation-delay: 0.25s; }
        tbody tr:nth-child(5) { animation-delay: 0.3s; }

        @keyframes rowSlide {
            from {
                opacity: 0;
                transform: translateX(-20px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        tbody tr:hover {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.05), rgba(118, 75, 162, 0.05));
            transform: translateX(5px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.1);
        }

        .revenue {
            font-size: 3rem;
            font-weight: 800;
            padding: 3rem 2rem;
            background: linear-gradient(135deg, #4CAF50, #45a049);
            color: white;
            border-radius: 20px;
            text-align: center;
            margin: 2rem 0;
            position: relative;
            overflow: hidden;
            animation: revenueSlide 0.8s ease-out;
            box-shadow: 0 15px 35px rgba(76, 175, 80, 0.3);
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }

        .revenue::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255, 255, 255, 0.1), transparent);
            animation: revenueGlow 4s ease-in-out infinite;
        }

        @keyframes revenueGlow {
            0%, 100% { transform: scale(1) rotate(0deg); opacity: 0.5; }
            50% { transform: scale(1.1) rotate(180deg); opacity: 0.8; }
        }

        @keyframes revenueSlide {
            from {
                opacity: 0;
                transform: translateY(30px) scale(0.9);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .back-link {
            display: inline-block;
            margin-top: 3rem;
            padding: 1rem 2.5rem;
            background: linear-gradient(45deg, #667eea, #764ba2);
            color: white;
            text-decoration: none;
            border-radius: 25px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
            animation: linkSlide 0.8s ease-out 0.5s;
            animation-fill-mode: both;
        }

        @keyframes linkSlide {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .back-link::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #764ba2, #667eea);
            transition: left 0.3s ease;
            z-index: -1;
        }

        .back-link:hover::before {
            left: 0;
        }

        .back-link:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 35px rgba(102, 126, 234, 0.4);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            body {
                padding: 1rem;
            }

            .container {
                margin: 0;
            }

            .content {
                padding: 2rem 1.5rem;
            }

            h1 {
                font-size: 2rem;
            }

            table {
                font-size: 0.85rem;
            }

            th, td {
                padding: 0.8rem 0.5rem;
            }

            .revenue {
                font-size: 2.2rem;
            }

            .table-container {
                overflow-x: auto;
            }

            table {
                min-width: 600px;
            }
        }

        @media (max-width: 480px) {
            h1 {
                font-size: 1.6rem;
            }

            .revenue {
                font-size: 1.8rem;
            }

            .back-link {
                padding: 0.8rem 2rem;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="bg-pattern"></div>

    <div class="container">
        <div class="header">
            <h1>Report Results</h1>
        </div>

        <div class="content">
            <!--   <div class="report-info">
                <h2><%= request.getAttribute("reportTitle") %></h2>
            </div>   --> 
            
            <% 
            String reportType = (String) request.getAttribute("reportType");
            
            if ("dateRange".equals(reportType)) { 
                List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
            %>
                <table>
                    <tr>
                        <th>Reservation ID</th>
                        <th>Customer Name</th>
                        <th>Room Number</th>
                        <th>Check-In Date</th>
                        <th>Check-Out Date</th>
                        <th>Total Amount</th>
                    </tr>
                    
                    <% if (reservations != null && !reservations.isEmpty()) { 
                        for (Reservation reservation : reservations) { 
                    %>
                        <tr>
                            <td><%= reservation.getReservationId() %></td>
                            <td><%= reservation.getCustomerName() %></td>
                            <td><%= reservation.getRoomNumber() %></td>
                            <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(reservation.getCheckIn()) %></td>
                            <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(reservation.getCheckOut()) %></td>
                            <td>$<%= String.format("%.2f", reservation.getTotalAmount()) %></td>
                        </tr>
                    <% 
                        } 
                    } else { 
                    %>
                        <tr>
                            <td colspan="6">No reservations found for the selected date range.</td>
                        </tr>
                    <% } %>
                </table>
            <% 
            } else if ("revenue".equals(reportType)) { 
                Double totalRevenue = (Double) request.getAttribute("totalRevenue");
            %>
                <div class="revenue">
                    Total Revenue: $<%= String.format("%.2f", totalRevenue != null ? totalRevenue : 0.0) %>
                </div>
            <% 
            } else if ("popularRooms".equals(reportType)) { 
            	List<String[]> popularRooms = (List<String[]>) request.getAttribute("popularRooms");
            	
            	%>
                <table>
                    <tr>
                        <th>Room Number</th>
                        <th>Number of Bookings</th>
                    </tr>
                    
                    <% if (popularRooms != null && !popularRooms.isEmpty()) { 
                        for (String[] room : popularRooms) { 
                    %>
                        <tr>
                            <td><%= room[0] %></td>
                            <td><%= room[1] %></td>
                        </tr>
                    <% 
                        } 
                    } else { 
                    %>
                        <tr>
                            <td colspan="2">No booking data available.</td>
                        </tr>
                    <% } %>
                </table>
            <% } %>
            
            <a href="reports.jsp" class="back-link">Back to Reports</a>
        </body>
        </html>