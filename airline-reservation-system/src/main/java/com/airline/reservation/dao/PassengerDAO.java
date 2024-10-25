package com.airline.reservation.dao;

import com.airline.reservation.model.Passenger;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PassengerDAO {

    // Database credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3306/airline_db"; // Replace with your DB URL
    private static final String USER = "root"; // Replace with your DB username
    private static final String PASS = "Varun@11"; // Replace with your DB password

    // Method to insert a new passenger
    public void insertPassenger(Passenger passenger) throws SQLException {
        String query = "INSERT INTO passenger (name, email, phone) VALUES (?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(DB_URL, USER, PASS);
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, passenger.getName());
            preparedStatement.setString(2, passenger.getEmail());
            preparedStatement.setString(3, passenger.getPhone());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Log error
            throw new SQLException("Error inserting passenger into database.");
        }
    }

    // Method to get all passengers
    public List<Passenger> getAllPassengers() throws SQLException {
        List<Passenger> passengerList = new ArrayList<>();
        String query = "SELECT * FROM passenger"; // Ensure you are using the correct table name

        try (Connection connection = DriverManager.getConnection(DB_URL, USER, PASS);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                Passenger passenger = new Passenger();
                passenger.setId(resultSet.getInt("id")); // Ensure your table has an 'id' column
                passenger.setName(resultSet.getString("name"));
                passenger.setEmail(resultSet.getString("email"));
                passenger.setPhone(resultSet.getString("phone"));
                passengerList.add(passenger);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log error
            throw new SQLException("Error retrieving passenger list from database.");
        }
        return passengerList;
    }

    // Method to update a passenger's information
    public void updatePassenger(Passenger passenger) throws SQLException {
        String query = "UPDATE passenger SET name = ?, email = ?, phone = ? WHERE id = ?";

        try (Connection connection = DriverManager.getConnection(DB_URL, USER, PASS);
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, passenger.getName());
            preparedStatement.setString(2, passenger.getEmail());
            preparedStatement.setString(3, passenger.getPhone());
            preparedStatement.setInt(4, passenger.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Log error
            throw new SQLException("Error updating passenger information in database.");
        }
    }

    // Method to delete a passenger by ID
    public void deletePassenger(int id) throws SQLException {
        String query = "DELETE FROM passenger WHERE id = ?";

        try (Connection connection = DriverManager.getConnection(DB_URL, USER, PASS);
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Log error
            throw new SQLException("Error deleting passenger from database.");
        }
    }

    // Method to find a passenger by ID
    public Passenger getPassengerById(int id) throws SQLException {
        Passenger passenger = null;
        String query = "SELECT * FROM passenger WHERE id = ?";

        try (Connection connection = DriverManager.getConnection(DB_URL, USER, PASS);
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                passenger = new Passenger();
                passenger.setId(resultSet.getInt("id"));
                passenger.setName(resultSet.getString("name"));
                passenger.setEmail(resultSet.getString("email"));
                passenger.setPhone(resultSet.getString("phone"));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log error
            throw new SQLException("Error retrieving passenger by ID from database.");
        }
        return passenger;
    }
}
