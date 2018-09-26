package Test;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import models.Account;

public class test {
	public static void main(String[] args) {
		
		try {
			Gson gson =new Gson();
			Account ac;
			ac = new Account();
			String aa="81";
			List<Map> li=ac.getchoice(aa);
			String n="1";
			List<Map> ll=ac.getchoice11(aa);	
			
			String hhh=gson.toJson(ll);
			System.out.println(ll);
			for(int i=0;i<li.size();i++) {
				
				Map map = li.get(i);
				Number a= (Number)map.get("CHOICE");
				
				
			}
			String qqq=gson.toJson(li);
			System.out.println(qqq);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
	}

}
