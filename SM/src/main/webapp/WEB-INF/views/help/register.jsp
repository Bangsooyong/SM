<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>글쓰기</title>
</head>
<body>

	<h1>새 글 작성</h1>
<form method="post">

제목<br/>
<input type="text" name="title" required /><br/>
본문<br/>
<textarea rows="5" cols="40" name="content" required></textarea><br/>

작성자 아이디<br/>
<input type="text" name="userid" readonly value="아이디자동적용" /><br/>

<input type="submit" value="작성 완료">

</form>
	
</body>
</html>