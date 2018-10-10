<%-- 
    Document   : insert
    Created on : 9 Oct, 2018, 8:52:43 PM
    Author     : Ritik Agarwal
--%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
String cu = "jdbc:derby://localhost:1527/ritik";
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data Insert</title>
    </head>
    <body>
        <%
                try{
                    String name = request.getParameter("name");
                    String mob = request.getParameter("Mobile Number");
                    Double a = Double.parseDouble(mob);
                    String em = request.getParameter("email");
                    
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            String sql="insert into info values(?,?,?)";
            con=DriverManager.getConnection(cu,"ritik","ritik");
            ps = con.prepareStatement(sql);
                ps.setString(1,name);
                ps.setDouble(2, a);
                ps.setString(3, em);
                ps.execute();
                con.close();
                out.print("Data is inserted into the database");
                }
               
                catch(SQLException e)
                {
                    e.printStackTrace();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
        %>
    </body>
</html>
