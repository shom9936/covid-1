

function checkJoin(f){
		 if(!ckID){
			alert('아이디를 사용 가능 여부를 확인해주세요');
			f.id.focus();
			return;
		}
		if(!ckPW){
			alert('비밀번호를 확인해주세요');
			f.pwd.focus();
			return;
		}
		if(!ckEmail){
			alert('이메일 본인 인증을 확인해주세요');
			f.email.focus();
			return;
		} 
		if(f.id.value==''){
			alert('아이디를 입력하세요!');
			f.id.focus();
			return;
		}
		if(f.pwd.value==''){
			alert('비밀번호를 입력하세요!');
			f.pwd.focus();
			return;
		}
		if(f.name.value==''){
			alert('이름을 입력하세요!');
			f.name.focus();
			return;
		}
		if(f.email.value==''){
			alert('이메일을 입력하세요!');
			f.email.focus();
			return;
		}
		if(f.tel.value==''){
			alert('전화번호를 입력하세요!');
			f.tel.focus();
			return;
		}
		if(f.location.value == ''){
			alert('거주지를 입력하세요!');
			f.location.focus();
			return;
		}
		f.action = "/member/join";
		f.submit();
	}

function checkPW(f){
	if(f.pwd.value == f.rePW.value){
		alert('비밀번호가 일치합니다.');
		ckPW = true;
	} else {
		alert('비밀번호가 일치하지 않습니다.');
	}
}