<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="community.*"%>
<%
	PostDBBean db = PostDBBean.getInstance();
int no = Integer.parseInt(request.getParameter("no"));
PostBean post = db.getPost(no, false);
%>
<html>
<head>
<title></title>
<script language="JavaScript" src="post.js" charset="utf-8"></script>
</head>
<body>
	<center>
		<h1>글 수 정 하 기</h1>
		<form name="form" method="post" action="post_edit_ok.jsp?b_id=<%=no%>">
			<table>
				<tr height="30">
					<td width="80">작성자</td>
					<td width="140"><input type="text" name="name" size="10"
						value="<%=post.getName()%>"></td>

					<td width="80">이메일</td>
					<td width="240"><input type="text" name="email" size="24"
						value="<%=post.getEmail()%>"></td>
				</tr>

				<tr height="30">
					<td width="80">글제목</td>
					<td colspan="3"><input type="text" name="title" size="55"
						value="<%=post.getTitle()%>"></td>
					<td colspan="3">파일업로드<input type="text" name="upload_file"
						size="55" value="<%=post.getUpload_file()%>">
					</td>
				</tr>

				<tr>
					<td colspan="4"><textarea name="content" rows="10" cols="65">
								<%=post.getContent()%>
							</textarea></td>
				</tr>

				<tr>
					<td width="80">암&nbsp;&nbsp;호</td>
					<td colspan="3"><input type="password" name="password" size="12">
					</td>
				</tr>

				<tr height="50" align="center">
					<td colspan="4"><input type="button" value="글수정"
						onclick="check_ok()">&nbsp;&nbsp;&nbsp; <input
						type="reset" value="다시작성">&nbsp; <input type="button"
						value="글목록" onclick="location.href='post_list.jsp'"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>
