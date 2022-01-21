<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.UserDAO" %>
<%
	request.setCharacterEncoding("utf-8");

    String uid = request.getParameter("id");
    
    UserDAO dao = new UserDAO();
    if (dao.exists(uid) == false) {
        out.print("NA");
        return;
    }
    
    if (dao.delete(uid)) {
    	/*
    	String str = "<p align=center>";
    	str += "<br>회원 탈퇴가 완료되었습니다.<br>";
    	str += "그동안 이용해주셔서 감사드립니다.</p>";
        out.print(str);
        */
        session.removeAttribute("id");
        out.print("OK");
    }
    else {
        out.print("ER");
    }
%>