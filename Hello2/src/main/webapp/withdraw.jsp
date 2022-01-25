<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="util.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");

    String uid = request.getParameter("id");
    
    String sql = "DELETE FROM user WHERE id=?";
    
    /* Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns?serverTimezone=UTC", "root", "1111"); */
    Connection conn = ConnectionPool.get();
    PreparedStatement stmt = conn.prepareStatement(sql);
    
    stmt.setString(1, uid);
    
    UserDAO dao = new UserDAO();
    if (dao.delete(uid)){
    	out.print("회원 탈퇴가 완료되었습니다.");
        return;
    }
    else {
        out.print("회원 탈퇴 중 오류가 발생하었습니다.");
    }
%>