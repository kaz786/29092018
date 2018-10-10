<%-- 
    Document   : save
    Created on : 8 Oct, 2018, 5:25:18 PM
    Author     : Ritik Agarwal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<!DOCTYPE html>
<%!
String cu = "jdbc:derby://localhost:1527/ritik";
Connection con = null;
Statement st = null;
ResultSet rs = null;
%>

<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fetched Result From Database</title>
    </head>
                <center>

    <body>
        <table border="2">
            <h1>DISPLAYING DATA </h1>
            <tr><td >Name</td>
            <td>Number</td>
            <td>Email</td></tr>
            <%
                try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            String sql="select * from info";
            con=DriverManager.getConnection(cu,"ritik","ritik");
            st=con.createStatement();
            rs=st.executeQuery(sql);
            while(rs.next())
            {%>
            <tr><td><%=rs.getString("name")%></td>
            <td><%=rs.getDouble("number")%></td>
            <td><%=rs.getString("email")%></td>
            </tr>
            <%}%><%
rs.close();
st.close();
con.close();}
catch(SQLException s)
{
s.printStackTrace();
}
catch(Exception e)
{
e.printStackTrace();
}
%>
            
        </table>
    </body></center>
</html>
