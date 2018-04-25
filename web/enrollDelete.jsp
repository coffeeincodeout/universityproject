<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%
    String id = request.getParameter("id");

    //String connectionURL = "jdbc:postgresql://localhost:5432/university";
    String connectionURL =
            "jdbc:postgresql://class-db.cs.fiu.edu:5432/spr18_dcarl023?user=spr18_dcarl023&password=5964076";

    try{
        Class.forName("org.postgresql.Driver").newInstance();
        Connection connection = DriverManager.getConnection(connectionURL);
        Statement statement = connection.createStatement();
        ResultSet rs;

        int deleteEnrollr = statement.executeUpdate("DELETE FROM enroll WHERE enroll.student_id="+id
                +"enroll.course_id="+id);


    }
    catch(Exception e){

        System.out.println(e);
    }

%>
