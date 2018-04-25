<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*"%>

<%
    String student = request.getParameter("student_id");
    String course = request.getParameter("course_id");
    String grade = request.getParameter("grade");


    //String connectionURL = "jdbc:postgresql://localhost:5432/university";
    String connectionURL =
            "jdbc:postgresql://class-db.cs.fiu.edu:5432/spr18_dcarl023?user=spr18_dcarl023&password=5964076";
    try{
    Class.forName("org.postgresql.Driver").newInstance();
    Connection connection = DriverManager.getConnection(connectionURL);
    Statement statement = connection.createStatement();
    ResultSet rs;

    int insertNew = statement.executeUpdate(
            "INSERT INTO enroll(student_id, course_id, grade)" +
                    "VALUES("+student+","+course+",'"+grade+"')"
    );

}
    catch(Exception e){

        System.out.println(e);
        e.printStackTrace();
    }

%>
