package models;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Account {
/*	SqlSessionFactory factory;
	public JsonAccount() {
		// SqlSessionFactoryBuilder 객체를 통해서 만들어내는거임
		try {
			SqlSessionFactoryBuilder builder =  new SqlSessionFactoryBuilder();
			factory = builder.build(Resources.getResourceAsStream("mybatis-config.xml"));
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	*/
	
	
	
	
	SqlSessionFactory factory;
	
	
	
	public Account() throws IOException{
		
		SqlSessionFactoryBuilder builder =new SqlSessionFactoryBuilder();
		InputStream is =Resources.getResourceAsStream("mybatis-config.xml");
		factory = builder.build(is);
	}
	
	public Map getidpass(String a) {//id랑 pass 로그인처리용
		SqlSession sql=factory.openSession();
		
		try {
			Map p =sql.selectOne("account.getidpass",a);
			return p;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			sql.close();
		}
	}
	
	
	public Map getidname(String a) { //id랑 name 회원가입할때 처리용
		SqlSession sql=factory.openSession();
		
		try {
			Map p =sql.selectOne("account.getidname",a);
			return p;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			sql.close();
		}
	}
	
	public Map getname(String a) { //id랑 name 회원가입할때 처리용
		SqlSession sql=factory.openSession();
		
		try {
			Map p =sql.selectOne("account.getname",a);
			return p;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			sql.close();
		}
	}
	
	
	public int addaccount(Map map) {
		SqlSession sql=factory.openSession();
		try {
			int r=sql.insert("account.addaccount",map);
			if(r==1)
				sql.commit();
			return r;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			sql.close();
		}

}
	
	public int addissu(Map map) {
		SqlSession sql=factory.openSession();
		try {
			int r=sql.insert("account.addissu",map);
			if(r==1)
				sql.commit();
			return r;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			sql.close();
		}

}
	
	
	
	
	public List<Map> getall() { //id랑 name 회원가입할때 처리용
		SqlSession sql=factory.openSession();
		
		try {
			List<Map> p =sql.selectOne("account.getall");
			return p;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			sql.close();
		}
	}
	
	public List<Map> getAllissue() { //id랑 name 회원가입할때 처리용
		SqlSession sql=factory.openSession();
		
		try {
			List<Map> p =sql.selectList("account.getAllissue");
			return p;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			sql.close();
		}
	}
	
	public Map getnofrom(String a) {//id랑 pass 로그인처리용
		SqlSession sql=factory.openSession();
		
		try {
			Map p =sql.selectOne("account.getnofrom",a);
			return p;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			sql.close();
		}
	}
	
	public int addcoment(Map map) {
		SqlSession sql=factory.openSession();
		try {
			int r=sql.insert("account.addcoment",map);
			if(r==1)
				sql.commit();
			return r;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			sql.close();
		}

}
	
	public List<Map> getAllcoment() { //coment 불러오기용
		SqlSession sql=factory.openSession();
		
		try {
			List<Map> p =sql.selectList("account.getAllcoment");
			return p;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			sql.close();
		}
	}
	
	public List<Map> getnoopi(String ino) {//댓글뽑기
		SqlSession sql=factory.openSession();
		
		try {
			List<Map> p =sql.selectList("account.getnoopi",ino);
			return p;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			sql.close();
		}
	}
	
	public List<Map> getdateissue() { //id랑 name 회원가입할때 처리용
		SqlSession sql=factory.openSession();
		
		try {
			List<Map> p =sql.selectList("account.getdateissue");
			return p;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			sql.close();
		}
	}
	public List<Map> gethotissue() { //id랑 name 회원가입할때 처리용
		SqlSession sql=factory.openSession();
		
		try {
			List<Map> p =sql.selectList("account.gethotissue");
			return p;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			sql.close();
		}
	}
	
	public List<Map> getMycoment(String param) { //id랑 name 회원가입할때 처리용
		SqlSession sql=factory.openSession();
		
		try {
			List<Map> p =sql.selectList("account.getMycoment",param);
			return p;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			sql.close();
		}
	}
	
	
	
	public List<Map> getchoice(String param) { //id랑 name 회원가입할때 처리용
		SqlSession sql=factory.openSession();
		
		try {
			List<Map> p =sql.selectList("account.getchoice",param);
			return p;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			sql.close();
		}
	}
	
	
	public List<Map> getchoice11(String param) { //id랑 name 회원가입할때 처리용
		SqlSession sql=factory.openSession();
		
		try {
			List<Map> p =sql.selectList("account.getchoice11",param);
			return p;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			sql.close();
		}
	}
	
	
	public List<Map> getissuemoum() { //id랑 name 회원가입할때 처리용
		SqlSession sql=factory.openSession();
		
		try {
			List<Map> p =sql.selectList("account.getissuemoum");
			return p;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			sql.close();
		}
	}
	
	
	
	
}
