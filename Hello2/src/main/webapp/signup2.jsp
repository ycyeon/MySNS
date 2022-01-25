<%@page import="dao.UserDAO"%>
<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="util.ConnectionPool" %>
<%
	request.setCharacterEncoding("utf-8");

    String uid = request.getParameter("id");
    String upass = request.getParameter("ps");
    String uname = request.getParameter("name");
    
    String sql = "INSERT INTO user(id, password, name) VALUES";
    sql += "('" + uid + "', '" + upass + "', '" + uname + "')";
    
    //Class.forName("com.mysql.jdbc.Driver");
    //Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns?serverTimezone=UTC", "root", "1111");
    Connection conn = ConnectionPool.get();
    Statement stmt = conn.createStatement();
    
    int count = stmt.executeUpdate(sql);
    UserDAO dao = new UserDAO();
    if (dao.exists(uid)){
    	out.print("이미 가입한 회원입니다");
    	return;
    }
    if (count == 1) {
        out.print("회원 가입이 완료되었습니다.");
    }
    else {
        out.print("오류가 발생하었습니다.");
    }
    
%>
