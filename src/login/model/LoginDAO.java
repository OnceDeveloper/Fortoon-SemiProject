package login.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import static login.model.LoginSQL.*;

import domain.Member;

class LoginDAO {
	private DataSource ds;
	LoginDAO(){
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(NamingException ne) {
			System.out.println("Apache DBCP 객체(jdbc/myoracle) 찾지 못함");
		}
	}
	/*
	ArrayList<Member> list(){
		ArrayList<Member> list = new ArrayList<Member>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = LIST;
		
		try{
			con = ds.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				int seq = rs.getInt(1);
				String name = rs.getString(2);
				String id = rs.getString(3);
				String pwd = rs.getString(4);
				String phone = rs.getString(5);//필요한가
				Date rdate = rs.getDate(6);
				Date udate = rs.getDate(7);
				list.add(new Member(seq, name, id, pwd, phone, rdate, udate));
			}
			return list;
		}catch(SQLException se){
			return null;
		}finally{
			try{
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	*/
	Member getMember(String id) {
		Member mem = null;
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = CHECK;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			//CHECK = "select * from MEMBER where M_ID=?";
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("들어갔나?");
				String mId = rs.getString("M_ID");
				String name = rs.getString("NAME");
				String birth = rs.getString("BIRTH");
				String phone = rs.getString("PHONE");
				String pwd = rs.getString("PWD");
				mem = new Member(mId,name,birth,phone,pwd);
				return mem;
			}else {
				System.out.println("rs에 값이 없음");
				return null;
			}
		}catch(SQLException se){
			System.out.println(" 실패 : "+se);
			return null;
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){
				System.out.println(se);
			}
		}
	}
	/*
	boolean userCheck(Member member) {
		String id = member.getid();
		String pwd = member.getPwd();
		System.out.println("확인1 :"+id);
		System.out.println("확인2 :"+pwd);
		
		if(id != null || pwd != null) {
			return true;
		}else {
			id = "1";
			pwd = "2";
			return false;
		}
	}
	*/
}
