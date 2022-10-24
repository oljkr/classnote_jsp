/**
 * myscript.js
 */
 
 function bbsCheck(){
	//1)작성자 2글자 이상 입력
	let wname = document.getElementById("wname").value; //작성자 가져오기
	wname=wname.trim();
	if(wname.length<2){
		alert("작성자 2글자 이상 입력해 주세요");
		document.getElementById("wname").focus();//작성자칸에 커서 생성
		return false; //onsubmit은 return 값을 가지므로 return을 넣어줌.
	}//if end
	
	//2)제목 2글자 이상 입력
	let subject = document.getElementById("subject").value; 
	subject=subject.trim();
	if(subject.length<2){
		alert("제목 2글자 이상 입력해 주세요");
		document.getElementById("subject").focus();
		return false;
	}//if end
	
	//3)내용 2글자 이상 입력
	let content = document.getElementById("content").value;
	content=content.trim();
	if(content.length<2){
		alert("내용 2글자 이상 입력해 주세요");
		document.getElementById("content").focus();
		return false;
	}//if end
	
	//4)비밀번호 4글자 이상이면서, 숫자형 기호만 입력
	let passwd = document.getElementById("passwd").value;
	passwd=passwd.trim();
	if(passwd.length<4 || isNaN(passwd)){ //isNaN은 숫자를 입력 안하면 true가 나올것임
		alert("비밀번호 4글자 이상으로 숫자만 입력해 주세요");
		document.getElementById("passwd").focus();
		return false;
	}//if end
	
	return true; //onsubmit이벤트에서 서버로 전송
}//bbsCheck() end

function pwCheck(){
	let passwd = document.getElementById("passwd").value;
	passwd=passwd.trim();
	if(passwd.length<4 || isNaN(passwd)){ //isNaN은 숫자를 입력 안하면 true가 나올것임
		alert("비밀번호 4글자 이상으로 숫자만 입력해 주세요");
		document.getElementById("passwd").focus();
		return false;
	}//if end
	
	let message="진행된 내용은 복구되지 않습니다\n계속 진행할까요?";
	if(confirm(message)){ //확인true, 취소false
		return true; //서버로 전송
	}else{
		return false;
	}//if end
	return true;
}//pwCheck() end

function searchCheck(){
	//검색어를 입력해야만 서버로 전송
	let word=document.getElementById("word").value;
	word=word.trim();
	if(word.length==0){
		alert("검색어를 입력해 주세요");
		return false;
	}//if end
	
	return true;
}//searchCheck()end

function loginCheck(){ //로그인 유효성 검사 (아이디, 비번)
	//1)아이디 5~10글자 이내인지 검사
	let id = document.getElementById("id").value;
	id=id.trim();
	if(!(5<=passwd.length && passwd.length<=10)){ //isNaN은 숫자를 입력 안하면 true가 나올것임
		alert("아이디 5~10글자 사이로 입력해 주세요");
		document.getElementById("id").focus();
		return false;
	}//if end
		
	//2)비밀번호 5~10글자 이내인지 검사
	let passwd = document.getElementById("passwd").value;
	passwd=passwd.trim();
	if(!(5<=passwd.length && passwd.length<=10)){ //isNaN은 숫자를 입력 안하면 true가 나올것임
		alert("비밀번호 5~10글자 사이로 입력해 주세요");
		document.getElementById("passwd").focus();
		return false;
	}//if end
	
	return true;
}//loginCheck() end

function idCheck(){ //아이디 중복확인
	
	//모달창
	//->부모창과 자식창이 한몸으로 구성되어 있음(자식창을 close하지 않으면 부모창을 선택할 수 없음)
	
	//새창만들기
	//->부모창과 자식창이 별개로 구성되어 있음(자식창을 close하지 않아도 부모창에서 선택 가능)
	//->모바일에 기반을 둔 fronted단에서는 사용하지 말것!!
	//window.open("파일명", "새창이름", "다양한옵션들");
	window.open("idCheckForm.jsp", "idwin", "width=400,height=350");
	
}//idCheck() end

function emailCheck(){ //이메일 중복확인
	window.open("emailCheckForm.jsp", "emailwin", "width=400,height=350");
}//emailCheck() end

function memberCheck(){ //회원가입 유효성 검사
	//1)아이디 5~10글자 인지?
	let id = document.getElementById("id").value;
	id=id.trim();
	if(!(5<=id.length && id.length<=10)){ //isNaN은 숫자를 입력 안하면 true가 나올것임
		alert("아이디 5~10글자 사이로 입력해 주세요");
		document.getElementById("id").focus();
		return false;
	}//if end
	
    //2)비밀번호 5~10글자 인지?
    let passwd = document.getElementById("passwd").value;
	passwd=passwd.trim();
	if(!(5<=passwd.length && passwd.length<=10)){ //isNaN은 숫자를 입력 안하면 true가 나올것임
		alert("비밀번호 4글자 이상으로 숫자만 입력해 주세요");
		document.getElementById("passwd").focus();
		return false;
	}//if end
	
    //3)비밀번호와 비밀번호확인이 서로 일치하는지?
    let repasswd = document.getElementById("repasswd").value;
    if(!(passwd == repasswd)){
		alert("비밀번호와 비밀번호 확인 문자열이 다릅니다.");
		document.getElementById("passwd").focus();
		return false;
	}//if end

    //4)이름 2글자 이상 인지?
    let mname = document.getElementById("mname").value; //작성자 가져오기
	mname=mname.trim();
	if(mname.length<2){
		alert("작성자 2글자 이상 입력해 주세요");
		document.getElementById("mname").focus();//작성자칸에 커서 생성
		return false; //onsubmit은 return 값을 가지므로 return을 넣어줌.
	}//if end

    //5)이메일 5글자 인지?
    let email = document.getElementById("email").value; //작성자 가져오기
	email=email.trim();
	if(email.length<5){
		alert("이메일 5글자 이상 입력해 주세요");
		document.getElementById("email").focus();//작성자칸에 커서 생성
		return false; //onsubmit은 return 값을 가지므로 return을 넣어줌.
	}//if end

    //6)직업을 선택했는지?
    let job = document.getElementsByName("job").value; //작성자 가져오기
	if(job == 0){
		alert("직업을 선택해 주세요");
		document.getElementsByName("job").focus();//작성자칸에 커서 생성
		return false; //onsubmit은 return 값을 가지므로 return을 넣어줌.
	}//if end

	return true;
}//memberCheck() end

function findIdCheck(){ //입력 유효성 검사 (이름, 이메일)
	//이름 2글자 이상 인지?
    let mname = document.getElementById("mname").value; //작성자 가져오기
	mname=mname.trim();
	if(mname.length<2){
		alert("회원이름 2글자 이상 입력해 주세요");
		document.getElementById("mname").focus();//작성자칸에 커서 생성
		return false; //onsubmit은 return 값을 가지므로 return을 넣어줌.
	}//if end

    //이메일 5글자 인지?
    let email = document.getElementById("email").value; //작성자 가져오기
	email=email.trim();
	if(email.length<5){
		alert("이메일 5글자 이상 입력해 주세요");
		document.getElementById("email").focus();//작성자칸에 커서 생성
		return false; //onsubmit은 return 값을 가지므로 return을 넣어줌.
	}//if end
	
	return true;
}//findIdCheck() end

function pdsCheck(){ //포토갤러리 유효성 검사
	//1)이름
	
	//2)제목
	
	//3)비밀번호
	
	//4)첨부파일
	//->파일의 확장명이 이미지 파일(png, jpg, gif)
	//html문서에서 확인 가능한 이미지들만 전송..(imgsrc가 먹히는 것만)
	//아래서 file의 value가 string 값임
	//파일명이 대문자일 수 있으니까 전부 소문자로 바꿔서 소문자로 물어보기
	let filename=document.getElementById("filename").value; //예)sky.png
	filename=filename.trim();
	if(filename.length==0){
		alert("첨부 파일 선택하세요~");
		return false;
	}else{
		//filename변수값에서 마지막 . 의 순서값
		let dot=filename.lastIndexOf(".");
		//확장명 : 마지막 . 이후 문자열 자르기
		let ext=filename.substr(dot+1);
		//확장명을 전부 소문자 치환
		ext=ext.toLowerCase();
		if(ext=="png" || ext=="jpg" || ext=="gif"){
			return true;
		}else{
			alert("이미지 파일만 업로드 가능합니다~");
			return false;
		}//if end
	}//if end	
	
}//pdsCheck() end

function pwCheck2(){
	let passwd = document.getElementById("passwd").value;
	passwd=passwd.trim();
	if(passwd.length<4 || isNaN(passwd)){ //isNaN은 숫자를 입력 안하면 true가 나올것임
		alert("비밀번호 4글자 이상으로 숫자만 입력해 주세요");
		document.getElementById("passwd").focus();
		return false;
	}//if end
	
	let message="첨부 파일도 삭제되니다\n계속 진행할까요?";
	if(confirm(message)){ //확인true, 취소false
		return true; //서버로 전송
	}else{
		return false;
	}//if end
	return true;
}//pwCheck2() end