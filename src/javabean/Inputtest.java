package javabean;

import dbbean.*;

import java.sql.*;

public class Inputtest {

	public int selectfirstid(int i)
	{
		int type=i;
		int firstid=0;
		String sql=null;
		sql="select subjectid from subject where subjectquestion is Null and subjecttype="+i;
		
		Connection con=null;
		ResultSet rs=null;
		DBBean db=new DBBean();
	
		
		try{
			con=db.getConnection();
			rs=db.executeQuery(sql);
			
			if(rs.next()){
				firstid=rs.getInt(0);
			}
			
		}catch(Exception e){}
		
		finally
		{
			db.close();
		}
		
		return firstid;
	}
	
	
	public void savetest(String ques,String ans,int id)
	{
		String question=ques;
		String answer=ans;
		String sql=null;
		int selectid=id;
		//update subject set subjectquestion='sjhf' , subjectanswer='ddffs' where subjectid=147
		sql="update subject set subjectquestion='"+question+"' , subjectanswer='"+answer+"' where subjectid="+selectid;
		
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
