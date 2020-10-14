<%@ page import="Community.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pageNUM = request.getParameter("pageNUM");
	int no = Integer.parseInt(request.getParameter("no"));
	PostDBBean db = PostDBBean.getInstance();
	PostBean post = db.getPost(no);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	ArrayList<PostCmt> PostCmtList = db.listPostCmt(no);

	String name = "";
	String email = "";
	String title = "";
	String content = "";
	String upload_file = "";
	Timestamp date = null;

	if (post != null) {
		no = post.getNo();
		name = post.getName();
		title = post.getTitle();
		content = post.getContent();
		upload_file = post.getUpload_file();
		date = post.getDate();
	}
	out.print(upload_file);
%>
<html>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">

<body>
	<center>
		<h1>글 내 용 보 기</h1>
		<table border="2" width="800" align="center">
			<tr height="30" align="center">
				<td width="100">글번호</td>
				<td width="200"><%=no%></td>
				<td width="100">작성일</td>
				<td width="200"><%=date%></td>
			</tr>
			<tr height="30" align="center">
				<td width="100">글제목</td>
				<td width="200"><%=title%></td>
				<td width="100">작성자</td>
				<td width="200"><svg width="1em" height="1em"
						viewBox="0 0 16 16" class="bi bi-person" fill="currentColor"
						xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
							d="M10 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
</svg><%=name%></td>

			</tr>


			<tr height="30" align="center">
				<td width="100">글내용</td>
				<td width="200" colspan="3"><br> <img
					src="../post_img/<%=upload_file%>" border="300px" width="300px"
					height="300px"><br> <br> <textarea rows="10"
						cols="60" readonly><%=content%></textarea><br> <br></td>

			</tr>
			<tr height="30">
				<td colspan="4" align="right"><a href="#"
					class="badge badge-pill badge-dark" role="button"
					aria-pressed="true"
					onclick="location.href='post_edit.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>'">글수정</a>

					<a href="#" class="badge badge-pill badge-dark" role="button"
					aria-pressed="true"
					onclick="location.href='post_delete.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>'">글삭제</a>


					<a href="#" class="badge badge-pill badge-dark" role="button"
					aria-pressed="true"
					onclick="location.href='post_list.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>'">글목록</a>
				</td>
			</tr>
		</table>
	</center>

	<br>



	<!--답 변 달 기  -->

	<footer>
		<center>
			<table class="table table-hover" align="center">
				<tbody>
					<%
						for (int i = 0; i < PostCmtList.size(); i++) {
							PostCmt postcmt = PostCmtList.get(i);

							int cno = postcmt.getCno();
							String cname = postcmt.getName();
							String cpassword = postcmt.getPassword();
							String ccomment = postcmt.getComment();
							Timestamp cdate = postcmt.getDate();
					%>
					<tr height="25" bgcolor="#f7f7f7"
						onmouseover="this.style.backgroundColor='#88888'"
						onmouseout="this.style.backgroundColor='#f7f7f7'">


						<td col="scope"><%=cname%> </a></td>
						<td col="scope"><%=ccomment%> </a></td>
						<td col="scope"><%=sdf.format(cdate)%></td>
						<td><a href="#" class="badge badge-pill badge-dark"
							role="button" aria-pressed="true"
							onclick="location.href='post_comment_delete.jsp?no=<%=no%>&password=<%=cpassword%>&pageNUM=<%=pageNUM%>&cno=<%=cno%>'">댓글삭제</a>

						</td>
					</tr>
					<%
						}
					%>
				</tbody>
				</thead>
			</table>
			<form name="form" method="post" 
				action="post_comment_ok.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>">
				<table border="2" width="800" align="center">


					<tr height="30" align="center">
						<td width="100">작성자</td>
						<td width="200"><input type="text" name="name" size="10">
						</td>
						<td width="100">비밀번호</td>
						<td width="200"><input type="password" name="password"
							size="10"></td>
					</tr>
					<tr height="30" align="center" colspan="4">
						<td width="100" align="center">답글내용</td>
						<td colspan="3"><textarea name="comment" rows="4" cols="65"></textarea>
						</td>
					</tr>
				</table>
				<td><button type="submit" value="댓글달기" class="badge badge-pill badge-dark">댓글달기</button></td>
			</form>
		</center>
	</footer>
</html>