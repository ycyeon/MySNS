<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Date" %>
<%
	String uid5 = request.getParameter("id");
	String res5 = "<h3>����� ���̵� : " + uid5 + "</h3>";
	res5 += "<br>�α��� �ð�, login5-func : " + getDate(); // error only in eclipse~ ���� �ߵ�
	out.print(res5);
	
%>

