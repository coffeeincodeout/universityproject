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

        int deleteEnrollr = statement.executeUpdate("DELETE FROM enroll WHERE enroll.student_id="+id);
        int deleteStudent = statement.executeUpdate("DELETE FROM students WHERE students.student_id="+id);
        out.println("User Deleted");
    }
    catch(Exception e){

        System.out.println(e);
    }

%>