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
			out.print("�α��� ������ �����ϴ�");
		}else{
			out.print("���������� �Դϴ�." + "<br> ����� : " + uid);
			session.setAttribute("id", uid);
		}
	%>

</body>
</html>