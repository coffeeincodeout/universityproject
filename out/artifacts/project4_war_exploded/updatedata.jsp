<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*"%>

<%
    //int student =  Integer.parseInt(request.getParameter("student id0"));
    String student = request.getParameter("Student Id0");
    String name = request.getParameter("Name1");
    String date_of_birth = request.getParameter("Date of Birth2");
    String address = request.getParameter("Address3");
    String email = request.getParameter("Email4");
    String level = request.getParameter("Level5");

    String connectionURL = "jdbc:postgresql://localhost:5432/university";

    try{
        Class.forName("org.postgresql.Driver").newInstance();
        Connection connection = DriverManager.getConnection(connectionURL);
        Statement statement = connection.createStatement();
        ResultSet rs;

        int updateTable = statement.executeUpdate(
                "UPDATE students\n" +
                        "SET name='"+name+"', date_of_birth='"+date_of_birth+"', address='"+address+"', " +
                        "email='"+email+"', level='"+level+"'\n" +
                        "WHERE student_id="+student+" "
        );
        if(updateTable > 0){
            response.sendRedirect("students.jsp");

        }

    }
    catch(Exception e){
        System.out.println(e);
        e.printStackTrace();
    }

%>
