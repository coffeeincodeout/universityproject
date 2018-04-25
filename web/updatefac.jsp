<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*"%>

<%

    String faculty = request.getParameter("Faculty Id0");
    String name = request.getParameter("Name1");
    String date_of_birth = request.getParameter("Date of Birth2");
    String address = request.getParameter("Address3");
    String email = request.getParameter("Email4");
    String level = request.getParameter("Level5");

    //String connectionURL = "jdbc:postgresql://localhost:5432/university";
    String connectionURL =
            "jdbc:postgresql://class-db.cs.fiu.edu:5432/spr18_dcarl023?user=spr18_dcarl023&password=5964076";

    try{
        Class.forName("org.postgresql.Driver").newInstance();
        Connection connection = DriverManager.getConnection(connectionURL);
        Statement statement = connection.createStatement();
        ResultSet rs;

        int updateTable = statement.executeUpdate(
                "UPDATE faculties\n" +
                        "SET name='"+name+"', date_of_birth='"+date_of_birth+"', address='"+address+"', " +
                        "email='"+email+"', level='"+level+"'\n" +
                        "WHERE faculty_id="+faculty+" "
        );
        if(updateTable > 0){
            response.sendRedirect("faculties.jsp");

        }

    }
    catch(Exception e){
        System.out.println(e);
        e.printStackTrace();
    }

%>

