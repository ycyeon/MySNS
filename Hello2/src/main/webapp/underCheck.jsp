<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	String res = "<h3>매월 20일은 시스템 점검입니다.</h3>";
	res += "<br>21일부터 사용해 주세요.";
	out.print(res);
%>

</body>
</html>