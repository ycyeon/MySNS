<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Date" %>
<%@ page import="dao.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<% 
	Date now = new Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	String date = df.format(now);
	
	/* if(date.endsWith("20")){
		response.sendRedirect("underCheck.jsp");
		return;
	}
	
	else{
		String uid = request.getParameter("id");
		String res = "<h3>사용자 아이디 : " + uid + "</h3>";
		res += "<br>로그인 시간 : " + now.toString();
		out.print(res);
		
		session.setAttribute("id", uid);
		response.sendRedirect("main.jsp");
	} */
	String uid = request.getParameter("id");
	String upass = request.getParameter("ps");
	UserDAO dao = new UserDAO();
	if(dao.login(uid, upass)!=0){
		String res = "<html>";
		res = "<h3>사용자 아이디 : " + uid + "</h3>";
		res += "<br>로그인 시간 : " + now.toString();
		res += "</html>";
		out.print(res);
		
		session.setAttribute("id", uid);
		response.sendRedirect("main.jsp");
	}
	
%>

