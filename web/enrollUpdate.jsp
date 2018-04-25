<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*"%>

<%
    String student = request.getParameter("Student Id0");
    String course = request.getParameter("Course id1");
    String grade = request.getParameter("Grade2");


    //String connectionURL = "jdbc:postgresql://localhost:5432/university";
    String connectionURL =
            "jdbc:postgresql://class-db.cs.fiu.edu:5432/spr18_dcarl023?user=spr18_dcarl023&password=5964076";

    try{
        Class.forName("org.postgresql.Driver").newInstance();
        Connection connection = DriverManager.getConnection(connectionURL);
        Statement statement = connection.createStatement();
        ResultSet rs;

        int updateTable = statement.executeUpdate(
                "UPDATE enroll\n" +
                        "SET grade='"+grade+"' WHERE course_id="+course+" OR student_id="+student+" "
        );
        if(updateTable > 0){
            response.sendRedirect("enroll.jsp");

        }

    }
    catch(Exception e){
        System.out.println(e);
        e.printStackTrace();
    }

%>



