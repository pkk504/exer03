package models;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class IssueDao {
	SqlSessionFactory factory;
	public IssueDao() throws IOException{
		
		SqlSessionFactoryBuilder builder =new SqlSessionFactoryBuilder();
		InputStream is =Resources.getResourceAsStream("mybatis-config.xml");
		factory = builder.build(is);
	}
	
	
	
	
	
	
	

}
