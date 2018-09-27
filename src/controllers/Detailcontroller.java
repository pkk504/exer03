package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import models.Account;
@WebServlet("/issue/detail.do")
public class Detailcontroller extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json;charset=utf-8");
		HttpSession session=req.getSession();
		String no=req.getParameter("no");
		if(no!=null) {
			session.setAttribute("no", no);
		}
		String a="1";
		String b="0";
		int aa=0;
		int bb=0;
		Account ac=new Account();
		List<Map> li=ac.getnoopi(no);
		/*for(int i=0;i<li.size();i++) {
			Map map =new HashMap<>();
			map= li.get(i);
			if(map.get("CHOICE").toString().equals(a)) {
				aa++;
			}else if(map.get("CHOICE").toString().equals(b)){
				bb++;
			}
		}*/
		/*System.out.println(bb);*/
		req.setAttribute("yes",aa);
		req.setAttribute("nooo", bb);
		Map maa=ac.getnofrom(no);
		req.setAttribute("getnofrom", maa);
		
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/detail.jsp");
		rd.forward(req, resp);
		
			
		/*HttpSession session= req.getSession();
		int choice=Integer.parseInt(req.getParameter("choice"));
		String ment=req.getParameter("ment");
		String talker =(String)session.getAttribute("id");
		int ino=Integer.parseInt(req.getParameter("no"));
		System.out.println("gg"+choice);
		System.out.println("aa"+ment);
		System.out.println("gg"+talker);
		System.out.println("gg"+ino);
		Map map=new HashMap<>();
		map.put("choice", choice);
		map.put("ment", ment);
		map.put("talker", talker);
		map.put("ino", ino);
		Account ac= new Account();
		int r= ac.addcoment(map);*/
	/*	if(r==1) {
		List<Map>li=ac.getAllcoment();
		Map mdd=new HashMap<>();
		for(int ii=0;ii<li.size();ii++) {
			mdd=li.get(ii);
			System.out.println(mdd.get("INO"));
		}
		}*/
		
		/*if(r==1) {
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/detail.jsp");
			rd.forward(req, resp);
			
			Gson gson= new Gson();
			String ss=gson.toJson(map);
			PrintWriter out= resp.getWriter();
			out.println(ss);
			System.out.println(ss);
		}*/
	}
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	
	
	}
	
	
	
	
	
	
	
	
}
