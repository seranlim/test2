<%@ page import="Notice.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String pageNUM = request.getParameter("pageNUM");
	if (pageNUM == null) {
		pageNUM = "1";
	}

	String subject = request.getParameter("subject");
	String word = request.getParameter("word");
	NoticeDBBean db = NoticeDBBean.getInstance();
	ArrayList<NoticeBean> NoticeList = db.listNotice(pageNUM, subject, word);
	String id, password,content,title;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	int no = 0;
	Timestamp date;
	out.println(pageNUM);
	out.println(subject);
	out.println(word);
%>

<html>
<head>
<title>공지사항</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
</head>
<body>

	<br><br>
	<h5 align="center"><span class="d-block p-2 bg-dark text-white">공지사항</span></h5>
	
	<table class="table table-hover">
		<thead>
			<tr align="center">
				<th scope="col">No</th>
				<th scope="col">Content</th>
			</tr>
			
			<tbody>
				<%
					for (int i = 0; i < NoticeList.size(); i++) {
						NoticeBean notice = NoticeList.get(i);

						no = notice.getNo();
						title = notice.getTitle();
						id = notice.getId();
						date = notice.getDate();
				%>
				<td scope="col" align="center"><%=no%></td>
				<td scope="col" align="center"><a
					href="notice_show.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>"><%=title%>
				</a></td>
				<%
					}
				%>
			</tbody>
		</table>
		<br><br>
		<form name="form" align="right">
			<td><a href="notice_write.jsp?pageNUM=<%=pageNUM%>">글 쓰 기</a></td>
		</form>
			
</body>
</html>