package file.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.*;
import javax.sql.DataSource;

import domain.Creation;
import domain.Files;

import static file.model.FileSQL.*;

class FileDAO {
	private DataSource ds;
	FileDAO(){
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(NamingException ne) {
			System.out.println("Apache DBCP 객체(jdbc/myoracle) 찾지 못함");
		}
		//Connection con = ds.getConnection();
	}
	
	
	Creation list(int cr_num) {//content 부분
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		//LIST = "select * from CREATION where CR_NUM =? and EPI=?";
		String sql = LIST;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cr_num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				//int cr_num = rs.getInt("CR_NUM");
				int epi = rs.getInt("EPI");
				String division = rs.getString("DIVISION");
				int age_grade = rs.getInt("AGE_GRADE");
				String genreN = rs.getString("GENRE");
				String title = rs.getString("TITLE");
				System.out.println("TITLEEE" +title);
				String plot = rs.getString("PLOT");
				Date rdate = rs.getDate("RDATE");
				int lcount = rs.getInt("LCOUNT");
				String m_id = rs.getString("M_ID");
				return new Creation(cr_num, epi, division, age_grade, genreN, title, plot, rdate, lcount, m_id);	
			}else {
				return null;
			}	
		}catch(SQLException se){
			System.out.println("작품 로딩 실패 : "+se);
			return null;
		}finally{
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	
	void del(int seq) {
		String sql = DEL;
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
		}catch(SQLException se){
			System.out.println(" 삭제 실패 : "+se);
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){
				System.out.println(se);
			}
		}
	}
	boolean insertC(Creation creation) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = INSERTC;

		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1,creation.getCr_num());
			pstmt.setInt(2,creation.getEpi());
			pstmt.setString(3,creation.getDivision());
			pstmt.setString(4,creation.getGenre());
			pstmt.setString(5,creation.getTitle());
			pstmt.setString(6,creation.getPlot());
			pstmt.setString(7,creation.getM_id());

			//static final String INSERTC = "insert into CREATION values(?, ?, ?, 0, ?, ?, ?, SYSDATE, 0, ?)";
			//new Creation(cr_num, epi, division, age_grade, genre, title, plot, rdate, lcount, m_id);
			int i = pstmt.executeUpdate();
			if(i>0) return true;
			else return false;
			//res.sendRedirect("list.do");
		}catch(SQLException se){
			System.out.println("삽입 실패 : "+se);
			return false;
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	
	boolean insertF(Files files) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = INSERTF;

		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1,files.getDivision());
			pstmt.setString(2,files.getFname());
			pstmt.setString(3,files.getOfname());
			pstmt.setLong(4,files.getFsize());
			pstmt.setString(5,files.getPath());
			pstmt.setInt(6,files.getCr_num());
			pstmt.setInt(7,files.getEpi());
			
			//static final String INSERTF = "insert into FILES values(F_NUM_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?)";
			//new Files(f_num, division, fname, ofname, fsize, path, cr_num, epi)

			int i = pstmt.executeUpdate();
			if(i>0) return true;
			else return false;
			//res.sendRedirect("list.do");
		}catch(SQLException se){
			System.out.println("삽입 실패 : "+se);
			return false; 
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	
	int getCheckCount(){
		Connection con = null;
		ResultSet rs = null;
		Statement stmt = null;
		//LIST = "select * from CREATION where CR_NUM =? and EPI=?";
		String sql = CHECK_COUNT;
		int toonNum = 0;
		try{
			con = ds.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				toonNum = rs.getInt(1);
				System.out.println("toonNum"+toonNum);
				return toonNum;
			}else {
				return -1;
			}
			}catch(SQLException se){
				System.out.println("체크넘 return 실패 : "+se);
				return -1;
			}finally{
				try{
					if(stmt != null) stmt.close();
					if(con != null) con.close();
				}catch(SQLException se){
					System.out.println(se);
				}
			}
		}
	int getMaxCount(){
		Connection con = null;
		ResultSet rs = null;
		Statement stmt = null;
		//LIST = "select * from CREATION where CR_NUM =? and EPI=?";
		String sql = CHECK_MAX_COUNT;
		int maxNum = 0;
		try{
			con = ds.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				maxNum = rs.getInt(1);
				System.out.println("maxNum"+maxNum);
				return maxNum;
			}else {
				return -1;
			}
			}catch(SQLException se){
				System.out.println("max return 실패 : "+se);
				return -1;
			}finally{
				try{
					if(stmt != null) stmt.close();
					if(con != null) con.close();
				}catch(SQLException se){
					System.out.println(se);
				}
			}
		}
	
	Files getThumb(int cr_num) {//content 부분
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		//LIST = "select * from CREATION where CR_NUM =? and EPI=?";
		String sql = THUMB_IMG;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cr_num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				int f_num = rs.getInt("F_NUM");
				String division = rs.getString("DIVISION");
				String fname = rs.getString("FNAME");
				String ofname = rs.getString("OFNAME");
				long fsize = rs.getLong("FSIZE");
				String path = rs.getString("PATH");
				//int cr_num = rs.getInt("CR_NUM");
				int epi = rs.getInt("EPI");
				return new Files(f_num, division, fname, ofname, fsize, path, cr_num, epi);
			}else {
				return null;
			}	
		}catch(SQLException se){
			System.out.println("썸네일 리스트 실패 : "+se);
			return null;
		}finally{
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	
	Files getCreation(int cr_num) {//content 부분
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		//LIST = "select * from CREATION where CR_NUM =? and EPI=?";
		String sql = CREATION_IMG;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cr_num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				int f_num = rs.getInt("F_NUM");
				String division = rs.getString("DIVISION");
				String fname = rs.getString("FNAME");
				String ofname = rs.getString("OFNAME");
				long fsize = rs.getLong("FSIZE");
				String path = rs.getString("PATH");
				//int cr_num = rs.getInt("CR_NUM");
				int epi = rs.getInt("EPI");
				return new Files(f_num, division, fname, ofname, fsize, path, cr_num, epi);
			}else {
				return null;
			}	
		}catch(SQLException se){
			System.out.println("작품 리스트 실패 : "+se);
			return null;
		}finally{
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}

}
