<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String pageNUM = request.getParameter("pageNUM");
	int no = Integer.parseInt(request.getParameter("no"));
%>

<html>
	<head>
		<script type="text/javascript" src="function.js" charset="utf-8"></script>
	</head>
	<body>
		<center>
			<form method="post" name="form" 
				  action="qna_delete_ok.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>">
				  <table>
				  	<tr height="50">
				  		<td colspan="2" align="left">
				  			<b>>> 암호를 입력하세요. <<</b>
				  		</td>
				  	</tr>
				  	<tr>
				  		<td width="80">
				  			암&nbsp;&nbsp;호
				  		</td>
				  		<td>
				  			<input type="password" name="password" maxlength="12" size="12">
				  		</td>
				  	</tr>
				  	<tr height="50" align="center">
				  		<td colspan="2">
				  			<input type="button" value="글삭제" 
				  				onclick="delete_ok()">&nbsp;&nbsp;&nbsp;
				  			<input type="reset" value="다시작성">&nbsp;
				  			<input type="button" value="글목록" 
				  			onclick="location.href='qna_list.jsp?pageNUM=<%=pageNUM%>'">
				  		</td>
				  	</tr>
				  </table>
			</form>
		</center>
	</body>
</html>