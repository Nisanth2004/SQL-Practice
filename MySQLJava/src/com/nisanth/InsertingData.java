package com.nisanth;

import java.sql.*;

public class InsertingData {
    public static void main(String[] args) {
        String jdbcURL = "jdbc:mysql://localhost:3306/planetarygoods";
        String username = "root";
        String password = "Sujith@1234";

        try {
            Connection connection = DriverManager.getConnection(jdbcURL, username, password);

            String insertQuery = "INSERT INTO customers " +
                    "(firstname, lastname, email) " +
                    "VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, "From");
            preparedStatement.setString(2, "Java");
            preparedStatement.setString(3, "from.java@example.com");
            preparedStatement.executeUpdate();

            ResultSet rs = preparedStatement.getGeneratedKeys();
            if (rs.next()) {
                int insertedId = rs.getInt(1);  // The ID of the inserted record
                System.out.println("Inserted record's ID: " + insertedId);
            }

            rs.close();

            preparedStatement.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
