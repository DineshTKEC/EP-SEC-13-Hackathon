package com.airline.reservation.servlet;

import java.io.IOException;
import java.sql.SQLException; // Import SQLException
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.airline.reservation.dao.PassengerDAO;
import com.airline.reservation.model.Passenger;

@WebServlet("/updatePassenger")
public class UpdatePassengerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get updated passenger details from form
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // Create Passenger object with new data
        Passenger updatedPassenger = new Passenger();
        updatedPassenger.setId(id);
        updatedPassenger.setName(name);
        updatedPassenger.setEmail(email);
        updatedPassenger.setPhone(phone);

        // Update passenger in the database
        PassengerDAO passengerDAO = new PassengerDAO();
        try {
            passengerDAO.updatePassenger(updatedPassenger);
            // Redirect to passenger list after updating
            response.sendRedirect("passengerList.jsp");
        } catch (SQLException e) {
            // Handle SQL exceptions
            e.printStackTrace(); // For debugging, you can log this instead
            request.setAttribute("errorMessage", "Error updating passenger: " + e.getMessage());
            request.getRequestDispatcher("errorPage.jsp").forward(request, response); // Forward to an error page
        }
    }
}
