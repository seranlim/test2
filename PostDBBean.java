package community;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import myUtil.HanConv;

public class PostDBBean {
	private static PostDBBean instance = new PostDBBean();

	public static PostDBBean getInstance() {
		return instance;
	}

	public Connection getConnection() throws Exception {
		Connection con = null;
		String url = "jdbc:mysql://localhost:3306/mysql?serverTimezone=UTC";
		String user = "root";
		String pwd = "1234";
		

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pwd);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public int insertPost(PostBean post) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int number;

		try {
			con = getConnection();

			sql = "select max(no) from post_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}

			sql = "insert into post_board(no,name,email,title"
					+ ",content,password,date,upload_file) values(?, ?,?, ?, ?, ?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, HanConv.toKor(post.getName()));
			pstmt.setString(3, post.getEmail());
			pstmt.setString(4, HanConv.toKor(post.getTitle()));
			pstmt.setString(5, HanConv.toKor(post.getContent()));
			pstmt.setString(6, HanConv.toKor(post.getPassword()));
			pstmt.setTimestamp(7, post.getDate());
			pstmt.setString(8, post.getUpload_file());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return 1;
	}

	public ArrayList<PostBean> listpost() {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		ArrayList<PostBean> postList = new ArrayList<PostBean>();

		try {
			con = getConnection();
			stmt = con.createStatement();
			String sql = "select a.*, to_char(date, 'YYYY-MM-DD hh24:mi') date from post_board a order by no";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				PostBean post = new PostBean();
				post.setNo(rs.getInt(1));
				post.setName(rs.getString(2));
				post.setEmail(rs.getString(3));
				post.setTitle(rs.getString(4));
				post.setContent(rs.getString(5));
				post.setPassword(rs.getString(6));
				post.setDate(rs.getTimestamp(7));
				post.setUpload_file(rs.getString(8));

				postList.add(post);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return postList;
	}

	public PostBean getPost(int no,boolean noadd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		PostBean post = null;

		try {
			con = getConnection();
			
			if (noadd == true) {
			sql = "update post_board set no=no+1 where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			pstmt.close();
			
			}
			sql = "select * from post_board where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				post = new PostBean();
				post.setNo(rs.getInt(1));
				post.setName(rs.getString(2));
				post.setEmail(rs.getString(3));
				post.setTitle(rs.getString(4));
				post.setContent(rs.getString(5));
				post.setPassword(rs.getString(6));
				post.setDate(rs.getTimestamp(7));
				post.setUpload_file(rs.getString(8));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return post;
	}

	public int deletePost(int no, String password) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";
		String pwd = "";
		int re = -1;

		try {
			con = getConnection();
			sql = "select password from post_board where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				pwd = rs.getString(1);

				if (!pwd.equals(password)) {
					re = 0;
				} else {
					sql = "delete post_board where no=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, no);
					pstmt.executeUpdate();
					re = 1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}

	public int editPost(PostBean post) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";
		String pwd = "";

		int re = -1;

		try {
			con = getConnection();
			sql = "select password from post_board where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, post.getNo());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				pwd = rs.getString(1);
				if (!pwd.contentEquals(post.getPassword())) {
					re = 0;
				} else {
					sql = "update post_board set name=?, email=?, title=?" + ",content=? where no=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, HanConv.toKor(post.getName()));
					pstmt.setString(2, post.getEmail());
					pstmt.setString(3, HanConv.toKor(post.getTitle()));
					pstmt.setString(4, HanConv.toKor(post.getContent()));
					pstmt.setInt(5,post.getNo());
					pstmt.executeUpdate();

					re = 1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
}