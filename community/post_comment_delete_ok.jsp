<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Community.*" %>
<%	
	String pageNUM = request.getParameter("pageNUM");
	int no = Integer.parseInt(request.getParameter("no"));
	int cno = Integer.parseInt(request.getParameter("cno"));
	String password = request.getParameter("password");
	
	PostDBBean db = PostDBBean.getInstance();
	int re = db.deletePostCmt(cno, password);
	
	if(re == 1){
		response.sendRedirect("post_show.jsp?pageNUM="+pageNUM+"&no="+no);
	}else if(re == 0){
%>
		<script>
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>
<%
	}else if(re == -1){
%>
		<script>
			alert("삭제에 실패하였습니다.");
			history.go(-1);
		</script>
<%
	}
%>