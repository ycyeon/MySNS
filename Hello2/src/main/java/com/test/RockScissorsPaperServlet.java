package com.test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RockScissorsPaperServlet
 */
@WebServlet("/RockScissorsPaperServlet")
public class RockScissorsPaperServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RockScissorsPaperServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		int usel = Integer.parseInt(request.getParameter("usel"));
		int num = (int)(Math.random()*3);		// 0: ����, 1: ����, 2: ��
		String [] rsp = {"����", "����", "��"};
		int uc = usel-num;
		
		
		String res = "<html><h3>";
		if(uc==2||uc==-1) {
			res += "�����ϴ�<br>";
			res += "����� : " + rsp[usel] + "<br>" + usel;
			res += "�ý��� : " + rsp[num] + "<br>" + num;
		}
		else if(uc==1||uc==-2) {
			res += "�̰���ϴ�<br>";
			res += "����� : " + rsp[usel] + "<br>" + usel;
			res += "�ý��� : " + rsp[num] + "<br>" + num;
		}
		else{
			res += "�����ϴ�<br>";
			res += "����� : " + rsp[usel] + "<br>" + usel;
			res += "�ý��� : " + rsp[num] + "<br>" + num;
		}
		res += "</h3></html>";
		response.getWriter().print(res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
