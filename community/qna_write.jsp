<%@ page import="Community.*"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%
	String pageNUM = request.getParameter("pageNUM");
%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script type="text/javascript" src="function.js" charset="utf-8"></script>
</head>
<body>
	<center>
		<h1>�� �� �� ��</h1>
		<form name="form" method="post" action="qna_write_ok.jsp">
			<table>
				<tr height="30">
					<td width="80">�ۼ���</td>
					<td width="140"><input type="text" name="name" size="10">
					</td>
					<td width="80">�̸���</td>
					<td width="200"><input type="text" name="email" size="15">
					</td>
				</tr>
				<tr height="30">
					<td width="80">������</td>
					<td colspan="3" width="460"><input type="text" name="title"
						size="55"></td>
				</tr>
				<tr>
					<td colspan="4"><textarea name="content" rows="10" cols="65"></textarea>
					</td>
				</tr>
				<tr>
					<td width="80">��&nbsp;&nbsp;ȣ<svg width="1em" height="1em"
							viewBox="0 0 16 16" class="bi bi-lock-fill" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
  <path
								d="M2.5 9a2 2 0 0 1 2-2h7a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-7a2 2 0 0 1-2-2V9z" />
  <path fill-rule="evenodd"
								d="M4.5 4a3.5 3.5 0 1 1 7 0v3h-1V4a2.5 2.5 0 0 0-5 0v3h-1V4z" />
</svg></td>
					<td width="200"><input type="password" name="password"
						maxlength="12" size="12"></td>
					<td width="80">��&nbsp;��&nbsp;��</td>
					<td><input type="checkbox" name="secret" value="1"></td>
				</tr>
				<tr height="200" align="center"><br><br>
					<td colspan="4" width="480"><input class="btn btn-secondary"  type="button" value="�۾���"
						onclick="check_ok()">&nbsp; <input class="btn btn-secondary"  type="reset"
						value="�ٽ��ۼ�"> <input class="btn btn-secondary"  type="button" value="�۸��"
						onclick="location.href='qna_list.jsp?pageNUM=<%=pageNUM%>'">&nbsp;
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>

















