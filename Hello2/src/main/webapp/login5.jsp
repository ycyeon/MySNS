<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Date" %>
<%
	String uid5 = request.getParameter("id");
	String res5 = "<h3>사용자 아이디 : " + uid5 + "</h3>";
	res5 += "<br>로그인 시간, login5-func : " + getDate(); // error only in eclipse~ 실행 잘됨
	out.print(res5);
	
%>

