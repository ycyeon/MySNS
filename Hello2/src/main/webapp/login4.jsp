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
	String res = "<h3>����� ���̵� : " + uid + "</h3>";
	/* res += "<br>�α��� �ð� : " + (new Date()).toString(); */
	res += "<br>�α��� �ð� : " + getDate();
	out.print(res);
	
%>

<%@ include file="login5.jsp" %>