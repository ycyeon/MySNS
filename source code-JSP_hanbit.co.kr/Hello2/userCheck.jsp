<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="util.*" %>
<%
	request.setCharacterEncoding("utf-8");

    String uid = request.getParameter("id");
    String sql = "SELECT id FROM user WHERE id = ?";

    Connection conn = ConnectionPool.get();
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, uid);

    ResultSet rs = stmt.executeQuery();
    if (rs.next()) {
        out.print("회원이 존재합니다.");
    }
    else {
        out.print("회원이 존재하지 않습니다.");
    }
    rs.close(); stmt.close(); conn.close();
%>