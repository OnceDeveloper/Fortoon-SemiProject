package creation.model;

import java.sql.Connection;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.*;
import javax.sql.DataSource;

import creation.vo.ListResult;
import domain.Creation;
import domain.CreationA;
import domain.CreationT;

import static creation.model.CreationSQL.*;

class CreationDAO {
	private DataSource ds;
	CreationDAO(){
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(NamingException ne) {
			System.out.println("Apache DBCP 객체(jdbc/myoracle) 찾지 못함");
		}
		//Connection con = ds.getConnection();
	}
	
	ArrayList<CreationT> getListResult(String division, String genre, int page, int pageSize){
		ArrayList<CreationT> list = new ArrayList<CreationT>();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = null;
		if(genre==null){
			sql = PAGING_D;
		}else {
			sql = PAGING_G;
		}
		int cp = page;
		int ps = pageSize;
		int startRow = (cp-1)*ps;
		int endRow = cp*ps;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			//"select * from (select ROWNUM rnum, aa.* from (select * from CREATION where DIVISION=? and GENRE=? order by LCOUNT desc) aa)where rnum>? and rnum<=?";
			if(genre==null){
			pstmt.setString(1, division);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			}else {
				pstmt.setString(1, division);
				pstmt.setString(2, genre);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
			}
			rs = pstmt.executeQuery();
			while(rs.next()){
				int cr_num = rs.getInt("CR_NUM");
				//int epi = rs.getInt("EPI");
				//String division = rs.getString("DIVISION");
				//int age_grade = rs.getInt("AGE_GRADE");
				String title = rs.getString("TITLE");
				String genreN = rs.getString("GENRE");
				//String plot = rs.getString("PLOT");
				Date rdate = rs.getDate("RDATE");
				int lcount = rs.getInt("LCOUNT");
				String fname = rs.getString("FNAME");
				//String m_id = rs.getString("M_ID");
				list.add(new CreationT(cr_num, title, genreN, division, lcount, rdate, fname));
				//list.add(new Creation(cr_num, -1, division, -1, genreN, title, null, null, lcount, null));	
			}
			
			return list;
		}catch(SQLException se){
			System.out.println("리스트(paging) 로딩 실패 : "+se);
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
		
	long getTotalCount(String division, String genre){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = null;
		if(genre==null) {
			sql=TOTAL_D;
		}else {
			sql=TOTAL_G;
		}
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			if(genre==null) {
				pstmt.setString(1, division);
			}else {
				pstmt.setString(1, division);
				pstmt.setString(2, genre);
			}
			rs = pstmt.executeQuery();
			if(rs.next()){
				long count = rs.getLong(1);
				return count;
			}else {
				return -1;
			}	
		}catch(SQLException se){
			return -1;
		}finally{
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	
	CreationA list(int cr_num) {//content 부분
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
				String genre = rs.getString("GENRE");
				String title = rs.getString("TITLE");
				String plot = rs.getString("PLOT");
				Date rdate = rs.getDate("RDATE");
				int lcount = rs.getInt("LCOUNT");
				String m_id = rs.getString("M_ID");
				String fname = rs.getString("FNAME");
				String file_div = rs.getString("FILE_DIV");
				return new CreationA(cr_num, epi, division, genre, title, plot, rdate, lcount, m_id, fname, file_div);	
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
	
	CreationA listC(int cr_num) {//content 부분
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		//LIST = "select * from CREATION where CR_NUM =? and EPI=?";
		String sql = LISTC;
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
				String genre = rs.getString("GENRE");
				String title = rs.getString("TITLE");
				String plot = rs.getString("PLOT");
				Date rdate = rs.getDate("RDATE");
				int lcount = rs.getInt("LCOUNT");
				String m_id = rs.getString("M_ID");
				String fname = rs.getString("FNAME");
				String file_div = rs.getString("FILE_DIV");
				return new CreationA(cr_num, epi, division, genre, title, plot, rdate, lcount, m_id, fname, file_div);	
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
	/*
	boolean update(Creation dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql=UPDATE;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,dto.getWriter());

			pstmt.setString(2,dto.getEmail());
			pstmt.setString(3,dto.getSubject());
			pstmt.setString(4,dto.getContent());
			pstmt.setInt(5,dto.getSeq());

			int i = pstmt.executeUpdate();
			if(i>0) return true;
			else return false;
			
		}catch(SQLException se){
			System.out.println("갱신 실패 : "+se);
			return false;
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}*/

	public long getToonTotalCount(int cr_num) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = TOTAL_TOON;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, cr_num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				long count = rs.getLong(1);
				return count;
			}else {
				System.out.println("toon_total 로딩 실패");
				return -1;
			}	
		}catch(SQLException se){
			System.out.println("toon_total 로딩 실패"+se);
			return -1;
		}finally{
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}

	public ArrayList<CreationA> getToonListResult(int cr_num, int cp, int ps) {
		ArrayList<CreationA> list = new ArrayList<CreationA>();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = PAGING_TOON;
		int startRow = (cp-1)*ps;//0//4
		int endRow = cp*ps;//4//8
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			//"select * from (select ROWNUM rnum, aa.* from (select * from CREATION where DIVISION=? and GENRE=? order by LCOUNT desc) aa)where rnum>? and rnum<=?";
			
			pstmt.setInt(1, cr_num);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rs = pstmt.executeQuery();
			System.out.println("cr_num:"+cr_num);
			System.out.println("startRow:"+startRow);
			System.out.println("endRow:"+endRow);
			while(rs.next()){
				//int cr_num = rs.getInt("CR_NUM");
				int epi = rs.getInt("EPI");
				String division = rs.getString("DIVISION");
				int age_grade = rs.getInt("AGE_GRADE");
				String genreN = rs.getString("GENRE");
				String title = rs.getString("TITLE");
				String plot = rs.getString("PLOT");
				Date rdate = rs.getDate("RDATE");
				int lcount = rs.getInt("LCOUNT");
				String m_id = rs.getString("M_ID");
				String fname = rs.getString("FNAME");
				String file_div = rs.getString("FILE_DIV");
				list.add(new CreationA(cr_num, epi, division, genreN, title, plot, rdate, lcount, m_id, fname, file_div));
			}
			System.out.println("list ssddad"+list.size());
			return list;
		}catch(SQLException se){
			System.out.println("TOON 리스트(paging) 로딩 실패 : "+se);
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
}
