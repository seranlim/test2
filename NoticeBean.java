package Notice;

import java.sql.Timestamp;

public class NoticeBean {
	private int no;
	private String id;
	private String password;
	private String title;
	private String content;
	private Timestamp date;

	public static int pagesize = 10;
	public static int pagecount = 1;
	public static int pageNUM = 1;


public static String pageNumber(int limit) {
	   String str="";
	   int temp=(pageNUM-1) % limit;
	   int startPage = pageNUM - temp;
	   
	   if((startPage-limit)>0) {
		   str = "<a href='notice_list.jsp?pageNUM="+(startPage-1)+"'>[ÀÌÀü]</a>&nbsp;&nbsp;";
	   }
	   for(int i = startPage; i<(startPage+limit);i++) {
		   if(i==pageNUM) {
			   str += +i;
		   }else {
			   str += "<a href='notice_list.jsp?pageNUM="+i+"'>["+i+"]</a>&nbsp;&nbsp;";
		   }
		   if(i >= pagecount) break;
	   }
	   if((startPage+limit) <= pagecount) {
		   str += "<a href='notice_list.jsp?pageNUM="+(startPage+limit)+"'>[´ÙÀ½]</a>";
		   
	   }
	   
	   return str;
}


public int getNo() {
	return no;
}


public void setNo(int no) {
	this.no = no;
}


public String getId() {
	return id;
}


public void setId(String id) {
	this.id = id;
}


public String getPassword() {
	return password;
}


public void setPassword(String password) {
	this.password = password;
}


public String getTitle() {
	return title;
}


public void setTitle(String title) {
	this.title = title;
}


public String getContent() {
	return content;
}


public void setContent(String content) {
	this.content = content;
}


public Timestamp getDate() {
	return date;
}


public void setDate(Timestamp date) {
	this.date = date;
}

}
