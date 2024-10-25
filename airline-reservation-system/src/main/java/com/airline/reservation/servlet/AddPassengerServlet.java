package com.airline.reservation.servlet;

import com.airline.reservation.dao.PassengerDAO;
import com.airline.reservation.model.Passenger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/addPassenger")
public class AddPassengerServlet extends HttpServlet {
    private PassengerDAO passengerDAO;

    public void init() {
        passengerDAO = new PassengerDAO();
    }

    // Handle GET requests
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward the request to the JSP page
        request.getRequestDispatcher("addPassenger.jsp").forward(request, response);
    }

    // Handle POST requests
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        Passenger passenger = new Passenger();
        passenger.setName(name);
        passenger.setEmail(email);
        passenger.setPhone(phone);

        try {
            passengerDAO.insertPassenger(passenger);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("passengerList.jsp");
    }
}
