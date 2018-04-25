<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*"%>

<%
    String course = request.getParameter("course_id");
    String description = request.getParameter("description");
    String level = request.getParameter("level");
    String instructor = request.getParameter("instructor");
    String semester = request.getParameter("semester");

    //String connectionURL = "jdbc:postgresql://localhost:5432/university";
    String connectionURL =
            "jdbc:postgresql://class-db.cs.fiu.edu:5432/spr18_dcarl023?user=spr18_dcarl023&password=5964076";

    try{
        Class.forName("org.postgresql.Driver").newInstance();
        Connection connection = DriverManager.getConnection(connectionURL);
        Statement statement = connection.createStatement();
        ResultSet rs;

        int insertNew = statement.executeUpdate(
                "INSERT INTO courses(course_id,description,level,instructor,semester)" +
                        "VALUES("+course+",'"+description+"','"+level+"',"+instructor+",'"+semester+"')"
        );

    }
    catch(Exception e){
        System.out.println(e);
        e.printStackTrace();
    }

%>
