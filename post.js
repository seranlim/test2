function check_ok(){
	if(document.form.name.value.length==0){
		alert("이름을 입력하세요.");
		form.b_name.focus();
		return false;
	}
	if(document.form.title.value.length==0){
		alert("제목을 입력하세요.");
		form.b_title.focus();
		return false;
	}
	
	if(document.form.content.value.length==0){
		alert("내용을 입력하세요.");
		form.b_content.focus();
		return false;
	}
	
	if(document.form.pwd.value.length==0){
		alert("비밀번호를 입력하세요.");
		form.b_pwd.focus();
		return false;
	}
	
	document.form.submit();
}

function delete_ok() {
		if(document.form.b_pwd.value.length==0){
			alert("비밀번호를 입력하세요.");
			form.b_pwd.focus();
			return false;
		}
		document.form.submit();
}














