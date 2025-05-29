# Hotel Management System

**Subject Name**: Advanced Java  
**Subject Code**: BCS613D  
**Name**: Glanil Tauro  
**USN**: 4AL22CS047  
**Sem/Section**: VI/A  

---

A comprehensive Hotel Management System web application developed using JSP, Servlets, and MySQL following the MVC architecture.

## 🚀 Features

* **Complete CRUD Operations**: Add, Update, Delete, and Display hotel reservations
* **Advanced Search**: Search reservations by customer name or room number
* **Comprehensive Reports**: Generate various reports including:

  * Reservations within a date range
  * Most frequently booked rooms
  * Total revenue over a specified period
* **Input Validation**: Client-side and server-side validation
* **Professional UI**: Responsive design using Bootstrap
* **MVC Architecture**: Clean separation of concerns
* **Database Integration**: MySQL with JDBC connectivity

## 📋 Prerequisites

Ensure the following software is installed:

* Java Development Kit (JDK) 8 or higher
* Apache Tomcat 9.0 or higher
* MySQL Server 5.7 or XAMPP
* MySQL JDBC Driver (mysql-connector-java)
* IDE: Eclipse (J2EE), IntelliJ IDEA, or any compatible IDE
* Modern Web Browser: Chrome, Firefox, Edge

## 🔧 Project Structure

```
HotelWebApp/
├── src/
│   ├── com/
│   ├── dao/
│   │   └── ReservationDAO.java
│   ├── model/
│   │   └── Reservation.java
│   └── servlet/
│       ├── AddReservationServlet.java
│       ├── UpdateReservationServlet.java
│       ├── DeleteReservationServlet.java
│       ├── DisplayReservationsServlet.java
│       ├── ReportServlet.java
│       └── ReportCriteriaServlet.java
├── WebContent/
│   ├── index.jsp
│   ├── reservationadd.jsp
│   ├── reservationupdate.jsp
│   ├── reservationdelete.jsp
│   ├── reservationdisplay.jsp
│   ├── reports.jsp
│   ├── report_form.jsp
│   └── report_result.jsp
├── WEB-INF/
│   └── web.xml
└── README.md
```

## 📄 Database Setup

### 1. Create Database

```sql
CREATE DATABASE IF NOT EXISTS hotel_management;
USE hotel_management;
```

### 2. Create Table

```sql
CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    RoomNumber VARCHAR(10),
    CheckIn DATE,
    CheckOut DATE,
    TotalAmount DECIMAL(10,2)
);
```

### 3. Insert Sample Data

```sql
INSERT INTO Reservations VALUES
(2001, 'John Doe', 'A101', '2025-05-01', '2025-05-05', 5000.00),
(2002, 'Jane Smith', 'B202', '2025-05-03', '2025-05-06', 4200.00),
(2003, 'Arjun Rao', 'A101', '2025-05-07', '2025-05-10', 6000.00);
```

## ⚙️ Installation & Setup

### Step 1: Clone or Download the Project

Organize the files according to the project structure mentioned above.

### Step 2: Configure Database

1. Start MySQL Server
2. Execute the above SQL scripts
3. Update database credentials in `ReservationDAO.java`:

```java
connection = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/hotel_management",
    "your_username",
    "your_password");
```

### Step 3: Add MySQL JDBC Driver

1. Download MySQL Connector/J
2. Add the `.jar` file to `WEB-INF/lib`
3. Include in build path if using an IDE

### Step 4: Deploy to Tomcat

1. Create a Dynamic Web Project in IDE
2. Copy all project files
3. Deploy to Tomcat Server
4. Start Tomcat

### Step 5: Launch the Application

Visit:

```
http://localhost:8080/HotelWebApp/
```

## 📊 Application Modules

### Adding a Reservation

* Navigate to `Add Reservation`
* Fill in:

  * Reservation ID (unique)
  * Customer Name
  * Room Number
  * Check-In and Check-Out Dates
  * Total Amount
* Click `Book Reservation`

### Updating a Reservation

* Go to `Update Reservation`
* Search by Reservation ID
* Edit details and save

### Deleting a Reservation

* Go to `Delete Reservation`
* Search and confirm deletion

### Viewing Reservations

* View all or search by customer/room/date

### Reports

* Select report criteria:

  * Date range for reservations
  * Most booked rooms
  * Revenue generated over period
* View and optionally print the report

## 🔧 Technical Highlights

### Validation

* **Client-side**: JavaScript + Bootstrap
* **Server-side**: Servlet checks
* **Database**: Constraints on fields

### Error Handling

* Try-catch with user-friendly messages
* Invalid inputs handled gracefully

### Security

* SQL Injection prevention via Prepared Statements
* Input sanitization

### Design

* Responsive with Bootstrap
* Print-optimized report layouts

## 🚪 Testing Scenarios

### Add Reservation

* Add valid, invalid, and duplicate entries

### Update Reservation

* Modify existing and test for non-existent IDs

### Delete Reservation

* Remove records and handle missing IDs

### Display Reservation

* List all, filter by criteria

### Reports

* Test all types with varying inputs

## 🎓 Learning Outcomes

* Real-world application of JSP, Servlets, and JDBC
* Hands-on MVC pattern and DB integration
* Frontend + backend development
* Secure and efficient web programming
* Professional software design and deployment
