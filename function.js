function check_ok(){
	if(document.form.id.value.length==0){
		alert("아이디를 입력하세요.");
		form.id.focus();
		return false;
	}
	if(document.form.title.value.length==0){
		alert("제목을 입력하세요.");
		form.title.focus();
		return false;
	}
	
	if(document.form.content.value.length==0){
		alert("내용을 입력하세요.");
		form.content.focus();
		return false;
	}
	
	if(document.form.password.value.length==0){
		alert("비밀번호를 입력하세요.");
		form.password.focus();
		return false;
	}
	
	document.form.submit();
}

function delete_ok() {
		if(document.form.password.value.length==0){
			alert("비밀번호를 입력하세요.");
			form.password.focus();
			return false;
		}
		document.form.submit();
}