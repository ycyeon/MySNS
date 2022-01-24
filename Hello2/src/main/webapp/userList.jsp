<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>\
<%
    Class.forName("com.mysql.jdbc.Driver");

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns?serverTimezone=UTC", "root", "1111");

    Statement stmt = conn.createStatement();
    
    ResultSet rs = stmt.executeQuery("SELECT id, name, ts FROM user");
    
    String str="";
    while(rs.next()) {
    	str += rs.getString("id") + ", " + rs.getString("name") + ", " + rs.getString("ts") + "<br>";
    }
    out.print(str);
    
    rs.close(); stmt.close(); conn.close();
%>