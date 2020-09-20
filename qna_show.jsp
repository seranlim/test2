<%@ page import="community.*"%>
<%@page import="java.sql.Timestamp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
    
    QnaDBBean db=QnaDBBean.getInstance();
    QnaBean qna = db.getQna(no,true);
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	
	String name="";
	String email="";
	String title="";
	String content="";
	Timestamp date=null;
	
	if(qna != null){
		no = qna.getNo();
		name = qna.getName();
		title = qna.getTitle();
		content = qna.getContent();
		date = post.getDate();
	}
%>
<html>
	<body>
		<center>
			<h1>
				글 내 용 보 기
			</h1>
			<table border="1" width="600">
				<tr height="30" align="center">
					<td width="100">
						글번호
					</td>
					<td width="200">
						<%=no%>
					</td>
									</tr>
				<tr height="30" align="center">
					<td width="100">
						작성자
					</td>
					<td width="200">
						<%= name %>
					</td>
					<td width="100">
						작성일
					</td>
					<td width="200">
						<%= sdf.format(date)%>
					</td>
				</tr>
				<tr height="30" align="center">
					<td width="100">
						글제목
					</td>
					<td width="200">
						<%= title %>
					</td>
				</tr>
				<tr height="30" align="center">
					<td width="100">
						글내용
					</td>
					<td width="200">
						<pre><%=content%></pre>
					</td>
				</tr>
				<tr height="30">
					<td colspan="4" align="right">
						<input type="button" value="글수정"
						onclick="location.href='qna_edit.jsp?no=<%=no%>'">
						<input type="button" value="글삭제"
						onclick="location.href='qna_delete.jsp?no=<%=no%>'">
						<input type="button" value="글목록"
						onclick="location.href='qna_list.jsp'">
					</td>
				</tr>
			</table>
		</center>
	</body>
</html>
