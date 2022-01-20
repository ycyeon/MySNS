<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Enumeration" %>
<%
	Enumeration<String> en = request.getHeaderNames();
	while (en.hasMoreElements()){
		String name = (String) en.nextElement();
		String value = request.getHeader(name);
		out.print(name + ": " + value + "<br>");
	}
	Cookie[] cookie = request.getCookies();
	for(Cookie c:cookie){
		out.print(c.getName() + "<br>");
		out.print(c.getValue() + "<br>");
	}
%>