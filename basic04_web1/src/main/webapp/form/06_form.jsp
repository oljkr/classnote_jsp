<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>06_form.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>	
	<div class="container mt-3">
	  <h2>* 성적 입력 *</h2>
	  <form name="sungjukfrm" id="sungjukfrm" method="post" action="06_ok.jsp">
	    <div class="mb-3 mt-3">
	      <label for="email">이름:</label>
	      <input type="text" name="uname" id="uname" size="10" maxlength="20" placeholder="이름" required>
	    </div>
	    <div class="mb-3">
	      <label for="pwd">국어:</label>
	      <input input type="number" name="kor" id="kor" size="5" min="0" max="100">
	    </div>
	    <div class="mb-3">
	      <label for="pwd">영어:</label>
	      <input type="number" name="eng" id="eng" size="5" min="0" max="100">
	    </div>
	    <div class="mb-3">
	      <label for="pwd">수학:</label>
	      <input type="number" name="mat" id="mat" size="5" min="0" max="100">
	    </div>
	    <button type="submit" value="전송" class="btn btn-success">전송</button>
	    <button type="reset"  value="취소" class="btn btn-warning">취소</button>
	  </form>
	</div>

</body>
</html>