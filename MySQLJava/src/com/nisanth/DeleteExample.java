package com.nisanth;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteExample {
    public static void main(String[] args) {
        String jdbcURL = "jdbc:mysql://localhost:3306/planetarygoods";
        String username = "root";
        String password = "MyNewPass@123";

        try {
            Connection connection = DriverManager
                    .getConnection(jdbcURL, username, password);

            String deleteQuery = "DELETE FROM customers_java WHERE " +
                    "firstname = ? AND lastname = ?";

            PreparedStatement preparedStatement = connection
                    .prepareStatement(deleteQuery);
            preparedStatement.setString(1, "John");
            preparedStatement.setString(2, "Doe");
            preparedStatement.executeUpdate();

            preparedStatement.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
