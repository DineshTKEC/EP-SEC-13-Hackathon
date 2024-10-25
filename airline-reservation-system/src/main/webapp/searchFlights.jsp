<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
// Retrieve search parameters
String departure = request.getParameter("departure");
String destination = request.getParameter("destination");
String travelDate = request.getParameter("travelDate");
String travelClass = request.getParameter("class");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_db", "root", "password");
    
    // Query to search for available flights
    String query = "SELECT * FROM flights WHERE departure_airport = ? " +
                  "AND destination_airport = ? " +
                  "AND DATE(departure_time) = ? " +
                  "AND class = ? " +
                  "AND available_seats > 0";
                  
    PreparedStatement ps = con.prepareStatement(query);
    ps.setString(1, departure);
    ps.setString(2, destination);
    ps.setString(3, travelDate);
    ps.setString(4, travelClass);
    
    ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Flight Search Results</title>
    <!-- Bootstrap and other CSS links are inherited from the main page -->
</head>
<body>
    <div class="container">
        <h3 class="mb-4">Available Flights</h3>
        
        <%
        boolean foundFlights = false;
        while(rs.next()) {
            foundFlights = true;
            String flightNumber = rs.getString("flight_number");
            String departureTime = rs.getString("departure_time");
            String arrivalTime = rs.getString("arrival_time");
            String duration = rs.getString("duration");
            double price = rs.getDouble("price");
            int availableSeats = rs.getInt("available_seats");
        %>
        
        <div class="flight-card">
            <div class="flight-info">
                <div class="row align-items-center">
                    <div class="col-md-3">
                        <div class="flight-time">
                            <%= departureTime %>
                        </div>
                        <div class="text-muted"><%= departure %></div>
                    </div>
                    
                    <div class="col-md-2 text-center">
                        <div class="flight-duration">
                            <i class="fas fa-plane"></i>
                            <%= duration %>
                        </div>
                        <div class="text-muted">Flight <%= flightNumber %></div>
                    </div>
                    
                    <div class="col-md-3">
                        <div class="flight-time">
                            <%= arrivalTime %>
                        </div>
                        <div class="text-muted"><%= destination %></div>
                    </div>
                    
                    <div class="col-md-2">
                        <div class="flight-price">
                            $<%= String.format("%.2f", price) %>
                        </div>
                        <div class="text-muted"><%= availableSeats %> seats left</div>
                    </div>
                    
                    <div class="col-md-2">
                        <form action="bookFlight.jsp" method="post">
                            <input type="hidden" name="flightNumber" value="<%= flightNumber %>">
                            <input type="hidden" name="class" value="<%= travelClass %>">
                            <button type="submit" class="btn btn-book-flight">
                                Book Now
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <%
        }
        
        if (!foundFlights) {
        %>
        <div class="alert alert-info" role="alert">
            <i class="fas fa-info-circle me-2"></i>
            No flights available for the selected criteria. Please try different dates or destinations.
        </div>
        <%
        }
        
        // Close database resources
        rs.close();
        ps.close();
        con.close();
        
        } catch(Exception e) {
        %>
        <div class="alert alert-danger" role="alert">
            <i class="fas fa-exclamation-circle me-2"></i>
            An error occurred while searching for flights: <%= e.getMessage() %>
        </div>
        <%
        }
        %>
        
        <div class="mt-4">
            <a href="index.html" class="btn btn-secondary">
                <i class="fas fa-arrow-left me-2"></i>New Search
            </a>
        </div>
    </div>
</body>
</html>