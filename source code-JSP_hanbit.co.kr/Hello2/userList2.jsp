<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns?serverTimezone=UTC", "root", "1111");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT id, name, ts FROM user");
    
    String str = "<table align=center>";
    str += "<tr><th colspan=3>가입자 리스트</th></tr>";
    while(rs.next()) {
        str += "<tr><td colspan=3><hr></td></tr>";
        str += "<tr>";
    	str += "<td>" + rs.getString("id") + "</td>";
    	str += "<td>" + rs.getString("name") + "</td>";
    	str += "<td>&nbsp;(" + rs.getString("ts") + ")</td>";
        str += "</tr>";
    }
    str += "</table>";
    out.print(str);
    
    rs.close(); stmt.close(); conn.close();
%>