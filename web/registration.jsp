<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String userName = request.getParameter("email");
    String password = request.getParameter("pass");

    //String connectionURL = "jdbc:postgresql://localhost:5432/university";
    String connectionURL =
            "jdbc:postgresql://class-db.cs.fiu.edu:5432/spr18_dcarl023?user=spr18_dcarl023&password=5964076";

    Class.forName("org.postgresql.Driver").newInstance();
    Connection connection = DriverManager.getConnection(connectionURL);
    Statement statement = connection.createStatement();
    ResultSet rs;

    int addUser = statement.executeUpdate("INSERT INTO users (email, password) values( '"+userName+"', '"+password+"' )");



    if(addUser > 0 ){
        response.sendRedirect("account.html");
    }

%>
