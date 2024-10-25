package com.airline.reservation.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.airline.reservation.dao.PassengerDAO;

@WebServlet("/deletePassenger")
public class DeletePassengerServlet extends HttpServlet
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the passenger ID from the request
        int id = Integer.parseInt(request.getParameter("id"));

        // Create an instance of PassengerDAO
        PassengerDAO passengerDAO = new PassengerDAO();

        try {
            // Call the method to delete the passenger
            passengerDAO.deletePassenger(id);
            // Redirect back to the passenger list
            response.sendRedirect("passengerList.jsp");
        } catch (SQLException e) {
            e.printStackTrace(); // For debugging
            request.setAttribute("errorMessage", "Error deleting passenger: " + e.getMessage());
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
    }

}
