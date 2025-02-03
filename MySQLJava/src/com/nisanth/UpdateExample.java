package com.nisanth;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateExample {
    public static void main(String[] args) {
        String jdbcURL = "jdbc:mysql://localhost:3306/planetarygoods";
        String username = "root";
        String password = "Sujith@1234";

        try {
            Connection connection = DriverManager
                    .getConnection(jdbcURL, username, password);

            String updateQuery = "UPDATE customers SET email = ? " +
                    "WHERE firstname = ? AND lastname = ?";
            PreparedStatement preparedStatement = connection
                    .prepareStatement(updateQuery);
            preparedStatement.setString(1, "john.java_email@example.com");
            preparedStatement.setString(2, "John");
            preparedStatement.setString(3, "Doe");
            preparedStatement.executeUpdate();


            preparedStatement.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
