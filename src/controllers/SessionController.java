package controllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.*;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Account;


@WebServlet("/session.do")
public class SessionController extends HttpServlet {
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		/*if(session.getAttribute("auth")==null) {
			session.setAttribute("off","off");
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/login.jsp");
			rd.forward(req, resp);
		}else {
			
		}*/
		//=====================
	/*	if(session.getAttribute("auth")==null) {
		//session.setAttribute("off","off");
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/login.jsp");
		rd.forward(req, resp);
	}else {
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/home.jsp");
		rd.forward(req, resp);
	}*/
		
		String id=req.getParameter("ckid");
		String pass = req.getParameter("ckpass");
		Map mp=new HashMap<>();

		
		
			
			
			Account ac=new Account();
			
			Map map=ac.getidpass(id);
			
			if(map!=null) {
				String ckid=(String)map.get("ID");
				String ckpass=(String)map.get("PASS");
			if(ckid.equals(id)&&ckpass.equals(pass)) {
				session.setAttribute("auth", "pass");
				session.setAttribute("id", id);
				
			}else {
				req.setAttribute("off","off");
				session.setAttribute("auth", null);
			}
			}else {
				req.setAttribute("off","off");
				session.setAttribute("auth", null);
			}
		
			
			
				
			
			
			if(session.getAttribute("auth")!=null) {
				
				 List<Map> lii =ac.gethotissue();
				 List<Map> li=ac.getdateissue();
				 List<Map> la =ac.getMycoment((String)session.getAttribute("id")); 
				 session.setAttribute("gethotissue", lii);
				 req.setAttribute("gethotissue1", lii.size()-1);
				 session.setAttribute("getdateissue", li);
				 req.setAttribute("getdateissue1", li.size()-1);
				 session.setAttribute("getmycoment", la);
				 req.setAttribute("getmycoment1", la.size()-1);
			 
				RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/home.jsp");
				rd.forward(req, resp);
				
			}else {
				RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/login.jsp");
				rd.forward(req, resp);
			}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath()+"/login.do");
		
	}
}
	/*	String id = req.getParameter("id");
		String pass =req.getParameter("pass");
		
		if(Math.random()>0.9) {
			HttpSession session = req.getSession();
			session.setAttribute("auth", true);
			req.getRequestDispatcher(req.getContextPath()+ "/index.do");
		}else {
			req.setAttribute("err", true);	
			// MVC 패턴 구현시 view 출력시 사용해야될 데이터를 설정하는 영역
			
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/login.jsp");
			rd.forward(req, resp);
		}
	}
	
}*/








