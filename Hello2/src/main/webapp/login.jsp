<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<% 
	Date now = new Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	String date = df.format(now);
	
	if(date.endsWith("20")){
		response.sendRedirect("underCheck.jsp");
		return;
	}
	
	else{
		String uid = request.getParameter("id");
		String res = "<h3>����� ���̵� : " + uid + "</h3>";
		res += "<br>�α��� �ð� : " + now.toString();
		out.print(res);
		
		session.setAttribute("id", uid);
		response.sendRedirect("main.jsp");
	}
	
%>

