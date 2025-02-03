package com.nisanth;

import java.sql.*;

public class GroupAndJoin {

    public static void main(String[] args) {
        String jdbcURL = "jdbc:mysql://localhost:3306/planetarygoods";
        String username = "root";
        String password = "Sujith@1234";

        try {
            Connection connection = DriverManager.getConnection(jdbcURL, username, password);

            String query = "SELECT c.firstname, c.lastname, SUM(o.totalpaid) as total_amount " +
                    "FROM customers c " +
                    "JOIN orders o ON c.customerid = o.customerid " +
                    "GROUP BY c.customerid, c.firstname, c.lastname";

            Statement statement = connection.createStatement();

            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                String firstName = resultSet.getString("firstname");
                String lastName = resultSet.getString("lastname");
                double totalAmount = resultSet.getDouble("total_amount");

                System.out.println(firstName + " " + lastName + " spent: $" + totalAmount);
            }

            resultSet.close();
            statement.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

