<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Date" %>
<%!
	String getDate(){
		return (new Date()).toString();	
	}

%>
<%
	String uid = request.getParameter("id");
	String res = "<h3>사용자 아이디 : " + uid + "</h3>";
	/* res += "<br>로그인 시간 : " + (new Date()).toString(); */
	res += "<br>로그인 시간 : " + getDate();
	out.print(res);
	
%>

<%@ include file="login5.jsp" %>