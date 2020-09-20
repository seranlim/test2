<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="community.*" %>

<jsp:useBean id="post" class="community.PostBean">
	<jsp:setProperty property="*" name="post"/>
</jsp:useBean>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	post.setNo(no);
	
	PostDBBean db = PostDBBean.getInstance();
	int re = db.editPost(post);

	
	if(re == 1){
		response.sendRedirect("post_list.jsp");
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
			alert("수정에 실패하였습니다.");
			history.go(-1);
		</script>
<%
	}
%>
    