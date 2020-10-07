<%@ page import="Notice.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 올리기</title>

<%
	String pageNUM = request.getParameter("pageNUM");
%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
</head>

<body>
	<script type="text/javascript" src="function.js" charset="utf-8"></script>
	<br>
	<br>
	<form method="post" name="form" enctype="multipart/form-data"
		accept-charset="UTF-8" action="notice_write_ok.jsp">
		
		<form>
			<div class="row">
				<div class="col">
					<input type="text" class="form-control" placeholder="id" id="id">
				</div>
				<div class="col">
					<input type="password" class="form-control" placeholder="password" id="password">
				</div>
			</div>
			<br> <br>
		
		<div class="form-group" align="center">
			 <input type="text"
				class="form-control" placeholder="title" id="title">
		</div>
		<div class="form-group" align="center">
			<textarea class="form-control" id="content" placeholder="content" rows="3"></textarea>
		</div>
		</form>
		<div align="center">
		
			<tr height="50" align="center">
				<td colspan="4" width="480"><br> <br> 
				
				<input
					class="btn btn-primary" type = "button" value="글쓰기"
					onclick="check_ok()">&nbsp;&nbsp; <input
					class="btn btn-primary" type = "button"  value="다시작성" onClick="location.href='notice_write.jsp'">&nbsp;&nbsp;
					<input type ="button" class="btn btn-primary" value="글목록"
					onclick="location.href='notice_list.jsp'">&nbsp;</td>
			</tr>
		</div>
	</form>
</body>
</html>