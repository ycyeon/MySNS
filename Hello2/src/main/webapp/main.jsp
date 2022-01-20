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
		String uid = (String) session.getAttribute("id");
		if(uid==null){
			out.print("로그인 정보가 없습니다");
		}else{
			out.print("메인페이지 입니다." + "<br> 사용자 : " + uid);
			session.setAttribute("id", uid);
		}
	%>

</body>
</html>