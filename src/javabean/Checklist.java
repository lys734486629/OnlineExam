package javabean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;


import dbbean.DBBean;

public class Checklist {
	
	private String username;
	private int teacherpoint;
	private int quesid;
	private int paperid;
	private String answer,answer1;
	private String question;
	private int point;
	
	public String getUsername(){return username;}
	public void setUsername(String username){this.username=username;}
	
	public int getTeacherpoint(){return teacherpoint;}
	public void setTeacherpoint(int teacherpoint){this.teacherpoint=teacherpoint;}
	
	public int getQuesid(){return quesid;}
	public void setQuesid(int quesid){this.quesid=quesid;}
	
	public int getPaperid(){return paperid;}
	public void setPaperid(int paperid){this.paperid=paperid;}
	
	public String getAnswer(){return answer;}
	public void setAnswer(String answer){this.answer=answer;}
	
	public String getAnswer1(){return answer1;}
	public void setAnswer1(String answer1){this.answer1=answer1;}
	
	public String getQuestion(){return question;}
	public void setQuestion(String question){this.question=question;}
	
	public int getPoint(){return point;}
	public void setPoint(int point){this.point=point;}
	
	public ArrayList<Checklist> searchUsername(String paper,int questype)
	{
		ArrayList<Checklist> userlist1=new ArrayList<Checklist>();
		Connection con1=null;
		ResultSet rs1=null;
		String papername=paper;
		quesid=Integer.parseInt(papername);
		int type=questype;
		DBBean db1=new DBBean();
		String sql1=null;
		
		if(type==4)
			sql1="select DISTINCT username from simple where paperid="+quesid;
		if(type==5)
		   sql1="select DISTINCT username from discuss where paperid="+quesid;
		
		
		try{
			con1=db1.getConnection();
			rs1=db1.executeQuery(sql1);
			
			
			while(rs1.next())
			{
				Checklist user1=new Checklist();
				String s1=rs1.getString("username");
		
				user1.setUsername(s1);
	
				 userlist1.add(user1);
			}
			

		}catch(Exception e){}
		
		finally
		{
			db1.close();
		}
		
		return userlist1;
		
	}
	
	public ArrayList<Checklist> searchAll(String paper,String user,int questype)
	{
		ArrayList<Checklist> userlist2=new ArrayList<Checklist>();
		Connection con2=null;
		ResultSet rs2=null;
		String papername=paper;
		quesid=Integer.parseInt(papername);
		username=user;
	int type=questype;
	DBBean db2=new DBBean();
		String sql2=null;
		
		if(type==4)
			sql2="select simpleanswer,simpleid from simple where paperid="+quesid+" and username='"+username+"'";
		if(type==5)
			sql2="select discussanswer,discussid from discuss where paperid="+quesid+" and username='"+username+"'";
		//System.out.println(sql2);
		
		
		try{
			con2=db2.getConnection();
			rs2=db2.executeQuery(sql2);
			
			
			while(rs2.next())
			{
				Checklist user2=new Checklist();
				if(type==4)
				{
				String s1=rs2.getString("simpleanswer");
		        int s2=rs2.getInt("simpleid");
		        //System.out.println(s1+"  "+s2);
				user2.setAnswer(s1);
	            user2.setQuesid(s2);}
				if(type==5)
				{
					String s3=rs2.getString("discussanswer");
			        int s4=rs2.getInt("discussid");
					user2.setAnswer(s3);
		            user2.setQuesid(s4);
					
				}
				
				 userlist2.add(user2);
			}
			

		}catch(Exception e){}
		
		finally
		{
			db2.close();
		}
		
		return userlist2;
		
	}
	
	public ArrayList<Checklist> searchQuesid(int paper)
	{
		ArrayList<Checklist> userlist3=new ArrayList<Checklist>();
		Connection con3=null;
		ResultSet rs3=null;
		quesid=paper;
	
	
		DBBean db3=new DBBean();
		String sql3=null;
		
			sql3="select subjectquestion,subjectanswer,point from subject where subjectid="+quesid;
		//System.out.println(sql3);
		
		
		try{
			con3=db3.getConnection();
			rs3=db3.executeQuery(sql3);
			
			
			while(rs3.next())
			{
				Checklist user3=new Checklist();
				String s1=rs3.getString("subjectquestion");
				String s2=rs3.getString("subjectanswer");
		        int s3=rs3.getInt("point");
		        //System.out.println(s1+" "+s2+" "+s3);
				user3.setQuestion(s1);
				user3.setAnswer1(s2);
	            user3.setPoint(s3);
				
				 userlist3.add(user3);
			}
			

		}catch(Exception e){}
		
		finally
		{
			db3.close();
		}
		
		return userlist3;
		
	}
	
	public void insertTp(int tp,int qtype,String userna,int id)
	{
		Connection con4=null;
		ResultSet rs4=null;
		teacherpoint=tp;
	    int type=qtype;
	    username=userna;
	    quesid=id;
	
	    DBBean db4=new DBBean();
		String sql4=null;
		
			if(type==4)
				sql4="update simple set teacherpoint="+teacherpoint+" where username='"+username+"' and simpleid="+quesid; 
			else if(type==5)
				sql4="update discuss set teacherpoint="+teacherpoint+"where username='"+username+"' and simpleid="+quesid; 
		
		System.out.println(sql4);
		try{
			con4=db4.getConnection();
			db4.executeUpdate(sql4);
			
			
			
			

		}catch(Exception e){}
		
		finally
		{
			db4.close();
		}
		
	
		
	}
	
	
}
