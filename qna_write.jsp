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
   <script type="text/javascript" src="function.js" charset="utf-8"></script>
</head>
<body>
   <center>
      <h1>
         �� �� �� ��
      </h1>
      <form name="form" method="post" action="qna_write_ok.jsp">
         <table>
            <tr height="30">
               <td width="80">
                  �ۼ���
               </td>
               <td width="140">
                  <input type="text" name="name" size="10">
               </td>
               <td width="80">
                  �̸���
               </td>
               <td width="200">
                  <input type="text" name="email" size="15">
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
            <tr>
               <td colspan="4">
                  <textarea name="content" rows="10" cols="65"></textarea>
               </td>
            </tr>
            <tr>
               <td width="80">
                  	��&nbsp;&nbsp;ȣ
               </td>
               <td width="200">
                  <input type="password" name="password" maxlength="12" size="12">
               </td>
               <td width="80">
                  	��&nbsp;��&nbsp;��
               </td>
               <td>
               		<input type="checkbox" name="secret" value="1">
               </td>
               
            </tr>
            <tr height="50" align="center">
               <td colspan="4" width="480">
                  <input type="button" value="�۾���"
                     onclick="check_ok()">&nbsp;
                  <input type="reset" value="�ٽ��ۼ�">
                  <input type="button" value="�۸��"
                     onclick="location.href='qna_list.jsp?pageNUM=<%=pageNUM%>'">&nbsp;
               </td>
            </tr>
         </table>
      </form>
   </center>
</body>
</html>

















