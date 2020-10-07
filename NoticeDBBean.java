package Notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import Notice.NoticeBean;

public class NoticeDBBean {
	private static NoticeDBBean instance = new NoticeDBBean();

	public static NoticeDBBean getInstance() {
		return instance;
	}

	public Connection getConnection() throws Exception {
		Connection con = null;
		String url = "jdbc:mysql://203.245.44.74:3306/allintonight?serverTimezone=UTC";
		String user = "allintonight";
		String pwd = "team1team1";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pwd);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public int insertNotice(NoticeBean notice) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int number;

		try {
			con = getConnection();

			sql = "select max(no) from notice";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}

			sql = "insert into notice(no, id, password,title, content, date) values(?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, notice.getId());
			pstmt.setString(3, notice.getPassword());
			pstmt.setString(4, notice.getTitle());
			pstmt.setString(5, notice.getContent());
			pstmt.setTimestamp(6, notice.getDate());
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

	public ArrayList<NoticeBean> listNotice(String pageNumber, String subject, String word) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ResultSet pageset = null;

		int absolutepage = 1; 
		int dbcount = 0;
		String sql = "";

		ArrayList<NoticeBean> noticeList = new ArrayList<NoticeBean>();

		try {
			con = getConnection();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pageset = stmt.executeQuery("select count(no) from notice");

			if (pageset.next()) {
				dbcount = pageset.getInt(1);
				pageset.close();
			}
			if (dbcount % NoticeBean.pagesize == 0) {
				NoticeBean.pagecount = dbcount / (NoticeBean.pagesize);
			} else {
				NoticeBean.pagecount = dbcount / (NoticeBean.pagesize) + 1;
			}

			if (pageNumber != null) {
				NoticeBean.pageNUM = Integer.parseInt(pageNumber);
				absolutepage = (NoticeBean.pageNUM - 1) * NoticeBean.pagesize + 1;
			}

			if (subject == null) {
				sql = "select * from post order by no desc";
			} else if (subject.equals("1")) {
				sql = "select * from post where title like '%" + word + "%' or content like '%" + word + "%' desc";
			} else {
				sql = "select * from post where name like '%" + word + "%' desc";
			}

			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				rs.absolute(absolutepage);
				int count = 0;

				while (count < NoticeBean.pagesize) {
					NoticeBean notice = new NoticeBean();
					notice.setNo(rs.getInt(1));
					notice.setId(rs.getString(2));
					notice.setPassword(rs.getString(3));
					notice.setTitle(rs.getString(4));
					notice.setContent(rs.getString(5));
					notice.setDate(rs.getTimestamp(6));

					noticeList.add(notice);

					if (rs.isLast()) {
						break;
					} else {
						rs.next();
					}
					count++;
				}
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

		return noticeList;
	}

	public NoticeBean getNotice(int no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		NoticeBean notice = null;

		try {
			con = getConnection();
			sql = "select * from notice where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				notice = new NoticeBean();
				notice.setNo(rs.getInt(1));
				notice.setId(rs.getString(2));
				notice.setPassword(rs.getString(3));
				notice.setTitle(rs.getString(4));
				notice.setContent(rs.getString(5));
				notice.setDate(rs.getTimestamp(6));
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

		return notice;
	}

	public int deleteNotice(int no, String password) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";
		String pwd = "";
		int re = -1;

		try {
			con = getConnection();
			sql = "select password from notice where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				pwd = rs.getString(1);

				if (!pwd.equals(password)) {
					re = 0;
				} else {
					sql = "delete from notice where no=?";
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

	public int editNotice(NoticeBean notice) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";
		String pwd = "";
		int re = -1;

		try {
			con = getConnection();
			sql = "select password from notice where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notice.getNo());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				pwd = rs.getString(1);

				if (!pwd.equals(notice.getPassword())) {
					re = 0;
				} else {
					sql = "update notice set Password=?, Title = ?, Content = ?. where no=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, notice.getPassword());
					pstmt.setString(2, notice.getTitle());
					pstmt.setString(3, notice.getContent());
					pstmt.setInt(5, notice.getNo());
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

	public int searchNotice(String word) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int no = 0;
		String sql = "";

		try {
			con = getConnection();
			sql = "select no from notice where name=? and content=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, word);
			pstmt.setString(2, word);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				no = rs.getInt(1);

			} else {
				no = 0;

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
		return no;

	}
}

