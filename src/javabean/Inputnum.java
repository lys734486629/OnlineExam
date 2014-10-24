package javabean;

import dbbean.*;

import java.sql.*;

public class Inputnum {

	public int selectfirstid()
	{
		//int type=i;
		int firstid=0;
		String sql=null;
		sql="select top 1 subjectid from subject where subjectquestion is Null";
		
		Connection con=null;
		ResultSet rs=null;
		DBBean db=new DBBean();
	
		
		try{
			con=db.getConnection();
			rs=db.executeQuery(sql);
			
			if(rs.next()){
				firstid=rs.getInt("subjectid");
				System.out.println("firstid   "+firstid);
			}
			
		}catch(Exception e){}
		
		finally
		{
			db.close();
		}
		
		return firstid;
	}
	
	
	public void inputsingle(String first,String second,int third){
		String sql=null;
		String one=first;
		String two=second;
		System.out.print(one);
		
	    int point=Integer.parseInt(one);
	    
		int num=Integer.parseInt(two);
		int type=third;
		sql="insert into subject(subjecttype,point) ";
		for(int i=0;i<num-1;i++){
			sql+="select "+type+","+point+" union all ";
		}
		sql+="select "+type+","+point;
		System.out.print(sql);
		
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
	
	public void inputpaper(String one,String two,int three,String four,String five){
		
		String sql1=null;
		String a=one;
		String b=two;
		
		String d=four;
		String e=five;
		System.out.print(d);
		
	    int point=Integer.parseInt(a);
		int num=Integer.parseInt(b);
		int type=three;
		int paperid=Integer.parseInt(d);
		int model=Integer.parseInt(e);
		System.out.print(model);
		sql1="insert into subject(subjecttype,paperid,point,papermodel) ";
		for(int i=0;i<num-1;i++){
			sql1+="select "+type+","+paperid+","+point+","+model+" union all ";
		}
		sql1+="select "+type+","+d+","+point+","+model;
		System.out.print(sql1);
		
		Connection con1=null;
		DBBean db1=new DBBean();
	
		
		try{
			con1=db1.getConnection();
			db1.executeUpdate(sql1);
			
		}catch(Exception e2){}
		
		finally
		{
			db1.close();
		}
	}
}
