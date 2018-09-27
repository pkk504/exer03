package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
/*import com.sun.glass.ui.Application;*/

import models.Account;
//@WebServlet("/issue/coment.do")
public class Comentcontroller2 extends HttpServlet{
	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// ino값을 parameter 넘겨줬을때 그 ino로 등록된 opinion들을 뽑어소
			// JSON으로 응답 보내게 이 컨트롤러의 get을 구현
		
		
		}


@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	resp.setContentType("application/json;charset=utf-8");
	HttpSession session=req.getSession();
		String no=req.getParameter("no");
		if(no!=null) {
			session.setAttribute("no", no);
		}
		
		int choice=Integer.parseInt(req.getParameter("choice").toString());
		String ment=req.getParameter("ment");
		String talker =(String)session.getAttribute("id");
		int ino=Integer.parseInt(session.getAttribute("no").toString());
		
		Date a=new Date(System.currentTimeMillis());
		SimpleDateFormat fmt1 = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		
		Map map=new HashMap<>();
		map.put("choice", choice);
		map.put("ment", ment);
		map.put("talker", talker);
		map.put("ino", ino);
		Account ac= new Account();
		int r= ac.addcoment(map);
		if(r==1) {
			
			
			map.put("date",fmt1.format(a));
			Gson gson= new Gson();
			String ss=gson.toJson(map);
			PrintWriter out= resp.getWriter();
			out.println(ss);
			/*System.out.println(ss);*/
			
		}
		
}
	
}
