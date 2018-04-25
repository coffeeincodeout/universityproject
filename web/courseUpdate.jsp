<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*"%>

<%

    String course = request.getParameter("Course Id0");
    String description = request.getParameter("Description1");
    String level = request.getParameter("level2");
    String instructor = request.getParameter("Instructor Id3");
    String semester = request.getParameter("Semester4");

    //String connectionURL = "jdbc:postgresql://localhost:5432/university";
    String connectionURL =
            "jdbc:postgresql://class-db.cs.fiu.edu:5432/spr18_dcarl023?user=spr18_dcarl023&password=5964076";

    try{
        Class.forName("org.postgresql.Driver").newInstance();
        Connection connection = DriverManager.getConnection(connectionURL);
        Statement statement = connection.createStatement();
        ResultSet rs;

        int updateTable = statement.executeUpdate(
                "UPDATE courses\n" +
                        "SET description='"+description+"', level='"+level+"', " +
                        "instructor="+instructor+", semester='"+semester+"'\n" +
                        "WHERE course_id="+course+" "
        );
        if(updateTable > 0){
            response.sendRedirect("courses.jsp");

        }

    }
    catch(Exception e){
        System.out.println(e);
        e.printStackTrace();
    }

%>


