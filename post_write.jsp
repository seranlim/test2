<%@ page import="community.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    


</head>
<body>
<script type="text/javascript" src="function.js" charset="utf-8"></script>
<body>
	<center>
		<h1>글 올 리 기</h1>
		<form name="form" method="post" action="post_write_ok.jsp" enctype="multipart/">
			<table>
				<tr height="30">
					<td width="80">작성자</td>
					<td width="140"><input type="text" name="name" size="10">
					</td>
					<td width="80">이메일</td>
					<td width="200"><input type="text" name="email" size="15">
					</td>
				</tr>
				<tr height="30">
					<td width="80">글제목</td>
					<td colspan="3" width="460"><input type="text" name="title"
						size="55"></td>
				</tr>
				<tr height="30">
					<td width="80">파일 업로드</td>
					<td colspan="3" width="460"><input type="file" value ="파일" name="upload_file"
						size="55" href="#"></td>
				</tr>
				<tr>
					<td colspan="4"><textarea name="content" rows="10" cols="65"></textarea>
					</td>
				</tr>
				<tr>
					<td width="80">암&nbsp;&nbsp;호</td>
					<td width="460" colspan="3"><input type="password"
						name="password" maxlength="12" size="12"></td>
				</tr>
				<tr height="50" align="center">
					<td colspan="4" width="480"><input type="button" value="글쓰기"
						onclick="check_ok()">&nbsp; <input type="reset"
						value="다시작성"> <input type="button" value="글목록"
						onclick="location.href='post_list.jsp'">&nbsp;</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>















