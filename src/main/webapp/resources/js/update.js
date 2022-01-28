function checkupdate(f){
	if(f.email.value==''){
		alert('이메일을 입력하세요!');
		f.email.focus();
		return;
	} else if(f.tel.value==''){
		alert('전화번호를 입력하세요!');
		f.tel.focus();
		return;
	} else if(f.location.value==''){
		alert('거주지를 입력하세요!')
		f.location.focus();
		return;
	}
	
	if(confirm('정보를 수정하시겠습니까?')){
		f.action = "/member/update";
		f.method = "post";
		f.submit();
	}
	
}