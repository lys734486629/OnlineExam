package javabean;
import dbbean.*;

import java.sql.*;

public class Inputpaper {
	
	
	
	public void savetest(String ques,String ans,String sl,int id)
	{
		String question=ques;
		String answer=ans;
		String level=sl;
		String sql=null;
		int selectid=id;
		//update subject set subjectquestion='sjhf' , subjectanswer='ddffs' where subjectid=147
		sql="update subject set subjectquestion='"+question+"' , subjectanswer='"+answer+"' ,subjectlevel='"+level+"' where subjectid="+selectid;
		
		Connection con=null;
		DBBean db=new DBBean();
	
		
		try{
			con=db.getConnection();
			db.executeUpdate(sql);
			
			
			
		}catch(Exception e){}
		
		finally
		{
			db.close();
		}
		
	}
	
	public String choose(int id)
	{
		int chooseid=id;
		String question=null;
		String sql="select subjectquestion from subject where subjectid="+chooseid;
		
		Connection con=null;
		ResultSet rs=null;
		DBBean db=new DBBean();
	
		
		try{
			con=db.getConnection();
			rs=db.executeQuery(sql);
			
			if(rs.next()){
				question=rs.getString("subjectquestion");
			}
			
		}catch(Exception e){}
		
		finally
		{
			db.close();
		}
		return question;
	}
}
