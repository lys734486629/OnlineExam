package javabean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import dbbean.DBBean;

public class SubjectVO 

{
	private String subid;
	private String question;
	private String subtype;
	private String subanswer;
	private String sublevel;
	private String paperid;
	private String point;
	private String papermodel;
	private String autograde;
	
	public String getSubId()
	{return subid;}
	public void setSubId(String subid)
	{this.subid=subid;}
	
	public String getQuestion()
	{return question;}
	public void setQuestion(String question)
	{this.question=question;}
	
	public String getSubType()
	{return subtype;}
	public void setSubType(String subtype)
	{this.subtype=subtype;}
	
	public String getSubAnswer()
	{return subanswer;}
	public void setSubAnswer(String subanswer)
	{this.subanswer=subanswer;}
	
	public String getSubLevel()
	{return sublevel;}
	public void setSubLevel(String sublevel)
	{this.sublevel=sublevel;}
	
	public String getPaperId()
	{return paperid;}
	public void setPaperId(String paperid)
	{this.paperid=paperid;}
	
	public String getPoint()
	{return point;}
	public void setPoint(String point)
	{this.point=point;}
	
	public String getPaperModel()
	{return papermodel;}
	public void setPaperModel(String papermodel)
	{this.papermodel=papermodel;}
	
	public String getAutoGrade()
	{return autograde;}
	public void setAutoGrade(String auto_grade)
	{this.autograde=auto_grade;}
	
	public ArrayList<SubjectVO> exambuild(String mode)
	{
		ArrayList<SubjectVO> queslist=new ArrayList<SubjectVO>();
		String exammode=mode;
		Connection con=null;
		ResultSet rs=null;
		
		DBBean db=new DBBean();
		String sql=null;
		//Random r=new Random();
		//int paperid=r.nextInt(1)+1;
		int paperid=1;
		//sql="select * from subject where paperid="+paperid;
		sql="select * from subject";
		try{
			con=db.getConnection();
			rs=db.executeQuery(sql);
			
			if(rs!=null){
			while(rs.next())
			{
				SubjectVO ques=new SubjectVO();
				String s1=rs.getString("subjectquestion");
				String s2=rs.getString("number");
				String s3=rs.getString("college");
				String s4=rs.getString("major");
				String s5=rs.getString("birth");
				String s6=rs.getString("nativeplace");
				
				System.out.println("fuck you");
				
				ques.setQuestion(s1);
				//user.setNumber(s2);
				//user.setCollege(s3);
				//user.setMajor(s4);
				//user.setBirth(s5);
				//user.setNativeplace(s6);

				 queslist.add(ques);
			}}
			

		}catch(Exception e){}
		
		finally
		{
			db.close();
		}
		
		return queslist;
	}
}
