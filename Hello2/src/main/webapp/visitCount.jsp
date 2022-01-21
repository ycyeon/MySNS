<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%                                  
	String strcnt = (String)application.getAttribute("counter");
	int count = (strcnt == null) ? 0 : Integer.valueOf(strcnt);
	out.print("방문자수 : " + count);
	application.setAttribute("counter", String.valueOf(++count));
	
	String parameter = request.getParameter("value");
	out.print("<br> getParameter() : " + parameter);
	
	String attribute = (String)request.getAttribute("value");
	out.print("<br> getParameter() : " + attribute);
	
	request.setAttribute("value", parameter);
	String attr = (String) request.getAttribute("value");			
	out.print("<br> getParameter() : " + attr);
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>