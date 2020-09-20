package community;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;



public class QnaDBBean {
	private static QnaDBBean instance=new QnaDBBean();
	   
	   public static QnaDBBean getInstance() {
	      return instance;
	   }
	   
	   public Connection getConnection() throws Exception{
		 	Connection con = null;
		String url = "jdbc:mysql://localhost:3306/allintonight";
		String user = "allintonight";
		String pwd = "team1team1";
		

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, password);

		         
		         } catch (Exception e) { 
		            e.printStackTrace();
		         }
		      return con;
		   }

	   
	   public int insertQna(QnaBean qna) {
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      String sql="";
	      int number;
	      
	      try {
	         con=getConnection();
	         
	         sql="select max(no) from qna";
	         pstmt = con.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            number = rs.getInt(1)+1;
	         }else {
	            number = 1;
	         }
	         
	         sql="insert into qna(no, name, password, title, content, date) values(?, ?, ?, ?, ?,?)";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, qna.getNo());
	         pstmt.setString(2, HanConv.toKor(qna.getName()));
	         pstmt.setString(3, qna.getPassword());
	         pstmt.setString(4, HanConv.toKor(qna.getTitle()));
	         pstmt.setString(5, HanConv.toKor(qna.getContent()));
	         pstmt.setTimestamp(6, qna.getDate());
	         
	         pstmt.executeUpdate();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         try {
	            if(rs != null) rs.close();
	            if(pstmt != null) pstmt.close();
	            if(con != null) con.close();
	         } catch (Exception e2) {
	            e2.printStackTrace();
	         }
	      }
	      
	      return 1;
	   }
	   
	   public ArrayList<QnaBean> listqna(){
	      Connection con=null;
	      Statement stmt=null;
	      ResultSet rs=null;
	      
	      ArrayList<QnaBean> qnaList=new ArrayList<QnaBean>();
	      
	      try {
	         con=getConnection();
	         stmt = con.createStatement();
             String sql="select * from qna order by no";
	        
	         rs = stmt.executeQuery(sql);
	         
	         while(rs.next()) {
	        	 QnaBean qna=new QnaBean();
	        	 qna.setNo(rs.getInt(1));
	        	 qna.setName(rs.getString(2));
	        	 qna.setPassword(rs.getString(3));
	        	 qna.setTitle(rs.getString(4));
	        	 qna.setContent(rs.getString(5));
	        	                    
	          
	            
	            qnaList.add(qna);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         try {
	            if(rs != null) rs.close();
	            if(stmt != null) stmt.close();
	            if(con != null) con.close();
	         } catch (Exception e2) {
	            e2.printStackTrace();
	         }
	      }
	      
	      return qnaList;
	   }
	   
	   public QnaBean getqna(int no) {
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      String sql="";
	      QnaBean qna=null;
	      
	      try {
	         con=getConnection();
	         sql="update qna set no=no+1 where no=?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, no);
	         pstmt.executeUpdate();
	         pstmt.close();
	         
	         sql="select * from qna where no=?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, no);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	               qna .setNo(rs.getInt(1));
	               qna .setName(rs.getString(2));
	               qna .setTitle(rs.getString(3));
	               qna .setContent(rs.getString(4));
	               
	              
		         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         try {
	            if(rs != null) rs.close();
	            if(pstmt != null) pstmt.close();
	            if(con != null) con.close();
	         } catch (Exception e2) {
	            e2.printStackTrace();
	         }
	      }
	      
	      return qna;
	   }
	   
	   public int deleteqna(int no, String password) {
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      
	      String sql="";
	      String pwd="";
	      int re=-1;
	      
	      try {
	         con=getConnection();
	         sql="select password from qna where no=?";
	         pstmt=con.prepareStatement(sql);
	         pstmt.setInt(1, no);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            pwd = rs.getString(1);
	            
	            if(!pwd.equals(password)) {
	               re=0;
	            }else {
	               sql="delete qna where no=?";
	               pstmt=con.prepareStatement(sql);
	               pstmt.setInt(1, no);
	               pstmt.executeUpdate();
	               re=1;
	            }
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         try {
	            if(rs != null) rs.close();
	            if(pstmt != null) pstmt.close();
	            if(con != null) con.close();
	         } catch (Exception e2) {
	            e2.printStackTrace();
	         }
	      }
	      return re;
	   }
	   public int editqna(QnaBean qna) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="";
			String pwd="";
			int re=-1;
					
			try {
				con=getConnection();
				sql="select password from qna where no=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, qna.getNo());
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					pwd=rs.getString(1);
			 
				if(!pwd.equals(qna.getPassword())) {
					re = 0;
				}else {
					sql="update qna set Title = ?, Content = ? where no=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, HanConv.toKor(qna.getTitle()));
					pstmt.setString(2, HanConv.toKor(qna.getContent()));
					pstmt.setInt(3, qna.getNo());
					pstmt.executeUpdate();
					re = 1;
				}
			
				
			}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			return re;
		}
	}


