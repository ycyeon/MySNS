<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%
    String uid = (String) session.getAttribute("id");
    if (uid == null) {
        response.sendRedirect("login.html");
        return;
    }
    
    session.setAttribute("id", uid);
    
    ArrayList<FeedObj> feeds = (new FeedDAO()).getList();
    
    String str = "";
    str += "<a href='feedAdd.html'><button>글쓰기</button></a> ";
    str += "<a href='logout.jsp'><button>로그아웃</button></a><br>";
    str += "<table border=1>";
    for (FeedObj feed : feeds) {
        String img = feed.getImages(), imgstr = "";
        if (img != null) {
            imgstr = "<img src='images/" + img + "' width=100>";
        }
        str += "<tr>";
        str += "<td>" + feed.getId() + "</td>";
        str += "<td>" + feed.getContent() + "</td>";
        str += "<td>" + feed.getTs() + "</td>";
        str += "<td>" + imgstr + "</td>";
        str += "</tr>";
    }
    str += "</table>";
    out.print(str);
%>