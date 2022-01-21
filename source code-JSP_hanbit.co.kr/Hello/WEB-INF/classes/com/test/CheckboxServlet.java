package com.test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CheckboxServlet")
public class CheckboxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckboxServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String[] usel = request.getParameterValues("fruit");
	    String res = "<html>";
	    if (usel == null) {
	    	res += "<h3>No fruit selected</h3>";
	    }
	    else {
		    for (int i=0; i<usel.length; i++) {
		    	res += "<h3>Selected fruit: " + usel[i] + "</h3>";
		    }
	    }
	    res += "</html>";
	    response.getWriter().print(res);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
