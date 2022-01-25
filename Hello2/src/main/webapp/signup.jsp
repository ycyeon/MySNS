<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.UserDAO" %>
<%
	request.setCharacterEncoding("utf-8");

    String uid = request.getParameter("id");
    String upass = request.getParameter("ps");
    String upass2 = request.getParameter("ps2");
    String uname = request.getParameter("name");
    
    if (!upass.equals(upass2)){
    	out.print("<script>alert('패스워드가 다릅니다')</script>");
    	out.print("<script>location.href='signup.html';</script>");
    	/* return; */
    }else{
    
    UserDAO dao = new UserDAO();
    if (dao.exists(uid)) {
        out.print("이미 가입한 회원입니다.");
        return;
    }
    
    if (dao.insert(uid, upass, uname)) {
        out.print("회원 가입이 완료되었습니다.");
        out.print("<script>location.href='login.html';</script>");
    }
    else {
        out.print("회원 가입 중 오류가 발생하었습니다.");
    }
    }
%>
