<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");

    String uid = request.getParameter("id");
    String ucon = request.getParameter("content");
    
    String sql = "INSERT INTO user(id, content) VALUES";
    sql += "('" + uid + "', '" + ucon + "')";
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns?serverTimezone=UTC", "root", "1111");
    Statement stmt = conn.createStatement();
    
    int count = stmt.executeUpdate(sql);
    
    if (count == 1) {
        out.print("작성하신 글이 업로드되었습니다.");
    }
    else {
        out.print("작성 글의 업로드 중 오류가 발생하였습니다.");
    }
    
    stmt.close();
    conn.close();
    
%>
