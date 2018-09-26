package controllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Account;
@WebServlet("/issue/new.do")
public class AddIssueController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/new.jsp");
		rd.forward(req, resp);
		
		
	}
	
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session= req.getSession();
		String cate=req.getParameter("cate");
		String content=req.getParameter("content");
		String agree=req.getParameter("agree");
		String disagree=req.getParameter("disagree");
		String writer=(String)session.getAttribute("id");
		Map map =new HashMap<>();
		map.put("cate", cate);
		map.put("content", content);
		map.put("agree", agree);
		map.put("disagree",disagree);
		map.put("writer", writer);
		Account ac = new Account();
		int r=ac.addissu(map);
		/*System.out.println(r);
		System.out.println(cate);
		System.out.println(content);
		System.out.println(agree);
		System.out.println(disagree);
		System.out.println(writer);*/
		
		if(r==1) {
			resp.sendRedirect(req.getContextPath()+"/issue/trend.do");
		}else {
			req.setAttribute("err", "on");
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/new.jsp");
			rd.forward(req, resp);
		}
		
		
		
	}
	
	
	
	
	
	
	
	
}
