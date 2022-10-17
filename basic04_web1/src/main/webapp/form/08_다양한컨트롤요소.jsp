<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>08_다양한컨트롤요소.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container mt-3">
  <h3>*다양한 컨트롤 요소들 연습*</h3>
  
  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalSignin">
    🔮회원가입🔮
  </button>
</div>

<!-- The Modal -->
<div class="modal modal-signin bg-secondary py-5" tabindex="-1" role="dialog" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>



<div class="modal modal-signin py-5" tabindex="-1" role="dialog" id="modalSignin">
  <div class="modal-dialog">
    <div class="modal-content rounded-5 shadow">
      <div class="modal-header p-5 pb-4 border-bottom-0">
        <!-- <h5 class="modal-title">Modal title</h5> -->
        <h2 class="fw-bold mb-0">Sign up for free</h2>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <div class="modal-body p-5 pt-0">
        <form method="post" action="08_ok.jsp">
          <div class="form-floating mb-3">
            <input type="text" class="form-control rounded-4" id="uid" placeholder="name@example.com" name="uid">
            <label for="uid">아이디</label>
          </div>
          <div class="form-floating mb-3">
            <input type="password" class="form-control rounded-4" id="upw" placeholder="Password" name="upw">
            <label for="upw">비번</label>
          </div>
          <div class="form-floating mb-3">
            <input type="text" class="form-control rounded-4" id="uname" placeholder="name@example.com" name="uname">
            <label for="uname">이름</label>
          </div>
          <div class="form-floating mb-3">
            <textarea class="form-control rounded-4" id="exampleFormControlTextarea1" rows="6" name="content"></textarea>
            <label for="exampleFormControlTextarea1">내용</label>
          </div>
          <hr class="my-4">
          <div class="form-floating mb-3">
            <input type="text" class="form-control rounded-4" id="floatingInput" placeholder="name@example.com" name="num">
            <label for="floatingInput">숫자1</label>
          </div>
          <div class="form-floating mb-3">
            <input type="text" class="form-control rounded-4" id="floatingInput" placeholder="name@example.com" name="num">
            <label for="floatingInput">숫자2</label>
          </div>
          <div class="form-floating mb-3">
            <input type="text" class="form-control rounded-4" id="floatingInput" placeholder="name@example.com" name="num">
            <label for="floatingInput">숫자3</label>
          </div>
          <hr class="my-4">
          <div class="form-check form-check-inline mb-1">
            <input type="radio" class="form-check-input rounded-4" name="gender" id="gender1" value="M">
            <label for="form-check-label" for="gender1">남</label>
          </div>
          <div class="form-check form-check-inline mb-1">
            <input type="radio" class="form-check-input rounded-4" name="gender" id="gender2" value="F">
            <label for="form-check-label" for="gender2">여</label>
          </div>
          <hr class="my-4">
          <div class="form-check form-check-inline">
		    <input class="form-check-input" type="checkbox" name="agree" id="inlineCheckbox1" value="Y">
		    <label class="form-check-label" for="inlineCheckbox1">약관동의</label>
		  </div>
		  <div class="form-check form-check-inline">
		    <input class="form-check-input" type="checkbox" name="sms" id="inlineCheckbox2" value="option2">
		    <label class="form-check-label" for="inlineCheckbox2">SMS</label>
		  </div>

		  <hr class="my-4">
          
          <select class="form-select rounded-4" aria-label="Default select example">
			  <option value="sk">SK</option>
			  <option value="lg">LG U+</option>
			  <option value="ktf">KTF</option>
		  </select>
		  
		  <hr class="my-4">
		  <div class="mb-3">
		    <label for="formFile" class="form-label">첨부파일</label>
		    <input class="form-control" type="file" name="attach" id="formFile">
		  </div>
		
          <button class="w-100 mb-2 btn btn-lg rounded-4 btn-warning" type="submit" value="전송">🎃전송🎃</button>
          <small class="text-muted">By clicking Sign up, you agree to the terms of use.</small>
        </form>
      </div>
    </div>
  </div>
</div>


<!-- 
	<h3>*다양한 컨트롤 요소들 연습*</h3>
	<form method="post" action="08_ok.jsp">
		아이디 : <input type="text" name="uid"> 
	    <hr>
	    비번   : <input type="password" name="upw">
	    <hr>
	    이름   : <input type="text" name="uname">
	    <hr>
	    내용   : <textarea rows="5" cols="20" name="content"></textarea>
	    <hr>
	    숫자1 : <input type="text" name="num"> <br>
	    숫자2 : <input type="text" name="num"> <br>
	    숫자3 : <input type="text" name="num"> <br>
	    <hr>
	    
	    성별 : 
	    <input type="radio" name="gender" value="M">남
	    <input type="radio" name="gender" value="F">여
	    
	    약관동의 : 
	    <input type="checkbox" name="agree" value="Y">
	    
	    SMS : <input type="checkbox" name="sms">
	    <hr>
	    
	    <hr>
	  	통신회사 : <select name="telecom">
	                 <option value="sk">SK
	                 <option value="lg">LG U+
	                 <option value="ktf">KTF
	             </select>
	    <hr>
	    
	     폼컨트롤요소이지만 본문에 출력은 안되는 요소
	    <input type="hidden" name="page" value="5">
	    <hr>
	    
	    첨부파일 :
	    <input type="file" name="attach">
	    파일을 첨부해서 서버에 전송하려면 
	    <form enctype="multipart/form-data"> 속성을 추가해야 함
	    <hr>
   
	    <input type="submit" value="전송">
	</form> -->

</body>
</html>