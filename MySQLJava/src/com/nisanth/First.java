package com.nisanth;

import java.sql.*;

public class First {

    public static void main(String[] args) throws ClassNotFoundException, SQLException {


        // Setup the Connection

        // 1. Load the MYSQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // 2. Establish the Connection
        Connection connection= DriverManager
                .getConnection("jdbc:mysql://localhost:3306/PlanetaryGoods",
                        "root",
                        "Sujith@1234");



        // 3. Create a Statement
        Statement statement=connection.createStatement();

        // 4. Execute the Query
        ResultSet resultSet=statement.executeQuery("SELECT * FROM customers");

        // 5. Process the result set
        while(resultSet.next()){
            int customerId=resultSet.getInt("customerId");
            String firstname=resultSet.getString("firstname");
            String lastname=resultSet.getString("lastname");
            // .. retirieve other fields

            System.out.println("Customer ID: "+customerId+" First Name: "+firstname+" Last Name: "+lastname);
        }

        // 6.close the resources
        statement.close();
        resultSet.close();
        connection.close();

    }
}
