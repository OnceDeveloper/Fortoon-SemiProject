package join.model;

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

import join.model.JoinSQL;
// import mvc.domain.Address;
import join.model.JoinSQL;

// import static addr.mvc.model.AddressSQL.LIST;
import static join.model.JoinSQL.*;

import domain.Member;

class JoinDAO {
	private DataSource ds;
	JoinDAO(){
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(NamingException ne) {
			System.out.println("Apache DBCP 객체(jdbc/myoracle)를 찾지 못함");
		}
	}

	
	boolean insert(Member member) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = JoinSQL.INSERT;
		try {
			System.out.println("1");
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getM_id());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getBrith());
			System.out.print("Brith: ");
			member.getBrith();
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getPwd());
			int i = pstmt.executeUpdate();
			if(i>0) return true;
			else return false;
		}catch(SQLException se) {
			return false;
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {}
		}
	}
	
	void del(String m_id){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = JoinSQL.DEL;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.executeUpdate();
		}catch(SQLException se) {
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {}
		}
	}
	
	
	boolean update(Member member){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = JoinSQL.UPDATE;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getBrith());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getPwd());
			pstmt.setString(5, member.getM_id());
			int i = pstmt.executeUpdate();
			if(i>0) return true;
			else return false;
		}catch(SQLException se) {
			return false;
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {}
		}
	}
	
	

	 public boolean idCheck(String m_id)
	    {
	        Connection con = null;
	        PreparedStatement pstm = null;
	        ResultSet rs = null;
	        boolean x= false;
	        
	        try {
	            // 쿼리
	            StringBuffer query = new StringBuffer();
	            query.append("select * from Member where m_id=?");
	                        
	        	System.out.println("2");
				con = ds.getConnection();
	            pstm = con.prepareStatement(query.toString());
	            pstm.setString(1, m_id);
	            rs = pstm.executeQuery();
	            
	            if(rs.next()) x= true; //해당 아이디 존재
	            
	            return x;
	            
	        } catch (Exception sqle) {
	            throw new RuntimeException(sqle.getMessage());
	        } finally {
	            try{
	                if ( pstm != null ){ pstm.close(); pstm=null; }
	                if ( con != null ){ con.close(); con=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        }
	    }
	 
	String findID(String name, String phone){
			Connection con = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    String sql = JoinSQL.FINDID;
		    try {
		    	con = ds.getConnection();
		    	pstmt = con.prepareStatement(sql);
		    	pstmt.setString(1, name);
		    	pstmt.setString(2, phone);
		    	rs	= pstmt.executeQuery();
		    	if(rs.next()) {
		    		String m_id = rs.getString("m_id");
		    		return m_id;
		    	}else {
		    		return null;
		    	}
		    }catch(SQLException se) {
		    	System.out.println(se);
		    	return null;
		    }finally {
		    	try {
		    		if(rs != null) rs.close();
		    		if(pstmt != null) pstmt.close();
		    		if(con != null) con.close();
		    	}catch(SQLException se) {}
		    }
		}
		
		

     String findPWD(String name, String phone){
			Connection con = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    String sql = JoinSQL.FINDPWD;
		    try {
		    	con = ds.getConnection();
		    	pstmt = con.prepareStatement(sql);
		    	pstmt.setString(1, name);
		    	pstmt.setString(2, phone);
		    	rs	= pstmt.executeQuery();
		    	if(rs.next()) {
		    		String pwd = rs.getString("pwd");
		    		return pwd;
		    	}else {
		    		return null;
		    	}
		    }catch(SQLException se) {
		    	System.out.println(se);
		    	return null;
		    }finally {
		    	try {
		    		if(rs != null) rs.close();
		    		if(pstmt != null) pstmt.close();
		    		if(con != null) con.close();
		    	}catch(SQLException se) {}
		    }
		} 
	 
	 
	 
	 public boolean idCheck4(String m_id)
	    {
	        Connection con = null;
	        PreparedStatement pstm = null;
	        String sql = JoinSQL.CHECK;
	        ResultSet rs = null;
	        boolean x= false;
	        
	        try {
	          
	        	System.out.println("idCheck2");
				con = ds.getConnection();
				pstm = con.prepareStatement(sql);
	            pstm.setString(1, m_id);
	            rs = pstm.executeQuery();
	            System.out.println("m_id idCheck2" + m_id);
	            if(rs.next()) {
	            	x= true; //해당 아이디 존재
	            }
	            
	            return x;
	            
	        } catch (Exception sqle) {
	            throw new RuntimeException(sqle.getMessage());
	        } finally {
	            try{
	                if ( pstm != null ){ pstm.close(); pstm=null; }
	                if ( con != null ){ con.close(); con=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        }
	    }
	 
	 public boolean idCheck2(String m_id)
	    {
	        Connection con = null;
	        PreparedStatement pstm = null;
	        String sql = JoinSQL.CHECK;
	        ResultSet rs = null;
	        boolean x= true;
	        
	        try {
	          
	        	System.out.println("2");
				con = ds.getConnection();
				pstm = con.prepareStatement(sql);
	            pstm.setString(1, m_id);
	            rs = pstm.executeQuery();
	            
	        	System.out.println("rs" + rs);
	            
	            if(rs.next()) {
	            	x= false; //해당 아이디 존재
	            }
	            return x;
	        } catch (SQLException sqle) {
	            System.out.println("JoinDao Err : "+sqle);
	            return false;
	        } finally {
	            try{
	                if ( pstm != null ){ pstm.close(); pstm=null; }
	                if ( con != null ){ con.close(); con=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        }
	    } 

	}
	

