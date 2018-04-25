<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*"%>

<%
    String student = request.getParameter("student_id");
    String name = request.getParameter("name");
    String date_of_birth = request.getParameter("date_of_birth");
    String address = request.getParameter("address");
    String email = request.getParameter("email");
    String level = request.getParameter("level");


    String connectionURL = "jdbc:postgresql://localhost:5432/university";

    try{
        Class.forName("org.postgresql.Driver").newInstance();
        Connection connection = DriverManager.getConnection(connectionURL);
        Statement statement = connection.createStatement();
        ResultSet rs;

        int insertNew = statement.executeUpdate(
                "INSERT INTO students(student_id,name,date_of_birth,address,email,level)" +
                        "VALUES("+student+",'"+name+"','"+date_of_birth+"','"+address+"','"+email+"','"+level+"')"
        );

        out.println("User added");
    }
    catch(Exception e){
        System.out.println(e);
        e.printStackTrace();
    }

%>
