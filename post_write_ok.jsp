<%@ page import="community.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="post" class="community.PostBean">
	<jsp:setProperty name="post" property="*" />
</jsp:useBean>
<%
	post.setDate(new Timestamp(System.currentTimeMillis()));
    PostDBBean db = PostDBBean.getInstance();
if (db.insertPost(post) == 1) {
	response.sendRedirect("post_list.jsp");
} else {
	response.sendRedirect("post_write.jsp");
}
%>

