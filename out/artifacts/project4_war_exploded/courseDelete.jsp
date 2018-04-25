<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%
    String id = request.getParameter("id");

    String connectionURL = "jdbc:postgresql://localhost:5432/university";

    try{
        Class.forName("org.postgresql.Driver").newInstance();
        Connection connection = DriverManager.getConnection(connectionURL);
        Statement statement = connection.createStatement();
        ResultSet rs;

        int deleteEnrollr = statement.executeUpdate("DELETE FROM courses WHERE courses.course_id="+id);


    }
    catch(Exception e){

        System.out.println(e);
    }

%>
