<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*"%>

<%
    String faculty = request.getParameter("faculty_id");
    String name = request.getParameter("name");
    String date_of_birth = request.getParameter("date_of_birth");
    String address = request.getParameter("address");
    String email = request.getParameter("email");
    String level = request.getParameter("level");


    //String connectionURL = "jdbc:postgresql://localhost:5432/university";
    String connectionURL =
            "jdbc:postgresql://class-db.cs.fiu.edu:5432/spr18_dcarl023?user=spr18_dcarl023&password=5964076";

    try{
        Class.forName("org.postgresql.Driver").newInstance();
        Connection connection = DriverManager.getConnection(connectionURL);
        Statement statement = connection.createStatement();
        ResultSet rs;

        int insertNew = statement.executeUpdate(
                "INSERT INTO faculties(faculty_id,name,date_of_birth,address,email,level)" +
                        "VALUES("+faculty+",'"+name+"','"+date_of_birth+"','"+address+"','"+email+"','"+level+"')"
        );

    }
    catch(Exception e){
        System.out.println(e);
        e.printStackTrace();
    }

%>
