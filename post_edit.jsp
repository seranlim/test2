<%@page import="Community.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	    pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("UTF-8"); %>    
	    
<%	
		String pageNUM = request.getParameter("pageNUM");
		PostDBBean db = PostDBBean.getInstance();
		int no = Integer.parseInt(request.getParameter("no"));
		PostBean post = db.getPost(no);
		String email = post.getEmail();
		String name = post.getName();
%>
	
	<html>
		<head>
			<script type="text/javascript" src="function.js" charset="utf-8"></script>
		</head>
		<body>
		<center>
			<h1>
				�� �� �� �� ��
			</h1>
			<form method="post" name="form" enctype="multipart/form-data" accept-charset="UTF-8" action="post_edit_ok.jsp?no=<%=no%>&pageNUM=<%=pageNUM%>">
				<table>
					<tr height="30">
						<td width="80">
							�ۼ���
						</td>
						<td width="140">
							<input type="text" value= "<%=name%>" size="10" readonly>
						</td>
						<td width="80">
							�̸���
						</td>
						<td width="200">
								<input type="text" value= "<%=email%>" size="15" readonly>
						</td>
					</tr>
					<tr height="30">
						<td width="80">
							������
						</td>
						<td colspan="3" width="460">
							<input type="text" name="title" size="55">
						</td>
					</tr>
				<tr height="30">
					<td width="80">���� ���ε�</td>
					<td colspan="3" width="460"><input type="file" value ="����" name="upload_file"
						size="55"></td>
				</tr>
					<tr>
						<td colspan="4">
							<textarea name="content" rows="10" cols="65"><%=post.getContent() %></textarea>
						</td>
					</tr>
					<tr>
						<td width="80">
							��&nbsp;&nbsp;ȣ
						</td>
						<td width="460" colspan="3">
							<input type="password" name="password" maxlength="12" size="12">
						</td>
					</tr>
					<tr height="50" align="center">
						<td colspan="4" width="480">
						<input type="submit" value="�ۼ���">
							<!-- <input type="button" value="�ۼ���"
								onclick="check_ok()"> -->&nbsp;
							<input type="reset" value="�ٽ��ۼ�">
							<input type="button" value="�۸��"
								onclick="location.href='post_list.jsp?pageNUM=<%=pageNUM%>'">&nbsp;
						</td>
					</tr>
				</table>
			</form>
		</center>
	</body>
	</html>
