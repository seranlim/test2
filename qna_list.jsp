<%@ page import="community.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	QnaDBBean db =QnaDBBean.getInstance();
	ArrayList<QnaBean>QnaList = db.listqna();
	
	String name,password,title,content;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	int no=0;
	Timestamp date;
	
%>
<html>
	<head>
		<title>
		</title>
	</head>
	<body>
		<center>
			<h1>질문 QnA</h1>
		</center>
		<table width="600">
			<tr>
				<td align="right">
					<a href="qna_write.jsp" align="right" >글 쓰 기</a>
				</td>
			</tr>
		</table>
		<table width="800" border="1">
			<tr height="25">
				<td width="40" align="center">번호
				</td>
				<td width="450" align="center">글제목
				</td>
				<td width="120" align="center">작성자
				</td>
				<td width="130" align="center">작성일자
				</td>
			</tr>
			<%
				for(int i=0; i<QnaList.size(); i++){
					QnaBean qna = QnaList.get(i);
					
					no = qna.getNo();
					title = qna.getTitle();
					name = qna.getName();
					date = qna.getDate();
					
			%>
				<tr height="25" bgcolor="#f7f7f7"
					onmouseover="this.style.backgroundColor='#88888'"
					onmouseout="this.style.backgroundColor='#f7f7f7'">
					
				<td align="center">
						<%= name %>
					</td>
					<td><a href="post_show.jsp?no<%=no%>">
						<%= title %>
						</a>
					</td>
					<td align="center">
						</td>
						<td align="center">
						<%= sdf.format(date)%>
					</td>
				</tr>
			<%
				}
			%>
		</table>
	</body>
</html>