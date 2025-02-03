package com.nisanth;

import java.sql.*;

public class PreparedExample {
    public static void main(String[] args) {
        String jdbcURL = "jdbc:mysql://localhost:3306/planetarygoods";
        String username = "root";
        String password = "Sujith@1234";

        try {
            Connection connection = DriverManager.getConnection(jdbcURL, username, password);

            String selectQuery = "SELECT * FROM customers WHERE firstname = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(selectQuery);
            preparedStatement.setString(1, "John");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String firstName = resultSet.getString("firstname");
                String lastName = resultSet.getString("lastname");

                System.out.println(firstName + " " + lastName);
            }

            resultSet.close();
            preparedStatement.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
