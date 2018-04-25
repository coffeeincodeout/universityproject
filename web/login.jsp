<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*,java.util.*"%>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    //String connectionURL = "jdbc:postgresql://localhost:5432/university";
    String connectionURL =
            "jdbc:postgresql://class-db.cs.fiu.edu:5432/spr18_dcarl023?user=spr18_dcarl023&password=5964076";
    Class.forName("org.postgresql.Driver").newInstance();
    Connection connection = DriverManager.getConnection(connectionURL);
    Statement statement = connection.createStatement();
    ResultSet rs = statement.executeQuery(
            "SELECT  * FROM users WHERE email='"+email+"' AND password='"+password+"' ");


    try{
        while(rs.next()){
            if(rs.getString("password").equals(password) && rs.getString("email").equals(email)) {
                response.sendRedirect("account.html");

            }

            else{
                response.sendRedirect("login.html");
            }

        }



    }
    catch(Exception e){

        out.println(e);
        e.printStackTrace();

    }
%>