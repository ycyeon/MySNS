<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.*" %>
<%
	String limit = request.getParameter("limit");
    out.print((new FeedDAO()).getPage(limit));
%>