package controllers;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
@WebServlet("/issue/coment.do")
public class Comentcontroller extends HttpServlet{
	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// ino값을 parameter 넘겨줘을때 그 ino로 등록된 opinion들 뽑아서
		//JSON 으로 응답보내게 이 컨트롤러의 get을 구현
		//=======================================================
		HttpSession session=req.getSession();
		Account ac =new Account();
		String ino=(String)session.getAttribute("no");
		List<Map> lll=ac.getnoopi(ino);
		List<Map> lii=ac.getchoice(ino);
		
		resp.setContentType("application/json;charset=utf-8");
		PrintWriter out= resp.getWriter();
		Map mmm=new HashMap<>();
		for(int i=0;i<lll.size();i++) {
			mmm=lll.get(i);
		
		}
		
		Gson gson =new Gson();
		String ssss=gson.toJson(lll);
	
		out.print(ssss);
		
		}


@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	resp.setContentType("application/json;charset=utf-8");
	HttpSession session=req.getSession();
		String no=req.getParameter("no");
		if(no!=null) {
			session.setAttribute("no", no);
		}
		BufferedReader br =req.getReader();
		String line=br.readLine();
		Gson gson= new Gson();
		Map map =gson.fromJson(line,Map.class);
		
	/*	int choice=Integer.parseInt(req.getParameter("choice").toString());
		String ment=req.getParameter("ment");*/
		String talker =(String)session.getAttribute("id");
		int ino=Integer.parseInt(session.getAttribute("no").toString());
		
		Date a=new Date(System.currentTimeMillis());
		SimpleDateFormat fmt1 = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		
		
		
		map.put("talker", talker);
		map.put("ino", ino);
		Account ac= new Account();
		int r= ac.addcoment(map);
		if(r==1) {
			
			
			map.put("date",fmt1.format(a));
			
			String ss=gson.toJson(map);
			PrintWriter out= resp.getWriter();
			out.println(ss);
			/*System.out.println(ss);*/
			
		}
		
}
	
}
