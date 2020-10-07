<%@page import="org.apache.catalina.filters.SetCharacterEncodingFilter"%>
<%@ page import="Notice.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="notice" class="Notice.NoticeBean">
	<jsp:setProperty name="notice" property="*" />
</jsp:useBean>
<%
	notice.setDate(new Timestamp(System.currentTimeMillis()));
	NoticeDBBean db = NoticeDBBean.getInstance();

	if (db.insertNotice(notice) == 1) {
		response.sendRedirect("notice_list.jsp");
	} else {
		response.sendRedirect("notice_write.jsp");
	}
%>