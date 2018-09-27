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
@WebServlet("/join.do")
public class JoinController extends HttpServlet{

protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	HttpSession session= req.getSession();
	Account ac= new Account();
	String id=req.getParameter("id");
	String pass=req.getParameter("pass");
	String name=req.getParameter("name");
	String gender=req.getParameter("gender");
	System.out.println(id);
	System.out.println(pass);
	System.out.println(name);
	System.out.println(gender);
	Map ma=new HashMap();
	int r=0;
	if(id!=null&&pass!=null&&name!=null&&gender!=null) {
		ma.put("id", id);
		ma.put("pass", pass);
		ma.put("name", name);
		ma.put("gender", gender);
		
		 r=ac.addaccount(ma);
	}
	
	if(r==1) {
		session.setAttribute("join", "pass");
		
		resp.sendRedirect(req.getContextPath()+"/index.do");
	}
	if(id!=null&&pass!=null&&name!=null) {
	req.setAttribute("id", id);
	req.setAttribute("pass", pass);
	req.setAttribute("name", name);
	}
	
	
	
	
	
	
		if(session.getAttribute("join")==null) {
		
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/join.jsp");
			rd.forward(req, resp);
		}else {
		}
		
		
		
				
	
		
}


@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/join.jsp");
	rd.forward(req, resp);
	}





}
