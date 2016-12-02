<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.replier {
	font-style: italic;
}

.rtext {
	font-weight: bold;
}

.regdate {
	font-style: italic;
	color: gray;
}

#modify {
	width: 300px;
	height: 100px;
	background-color: lightgray;
	position: absolute;
	top: 30%;
	left: 30%;
	display: none;
}
</style>

</head>
<body>

	<h1>문의글 상세 보기</h1>
	<form action="update">
		글번호<br /> <input type="text" id="h_no" name="h_no"
			value="${vo.h_no }" readonly /><br /> 제목<br /> <input
			type="text" value="${vo.h_title }" readonly /><br /> 본문<br />
		<textarea rows="5" cols="40" readonly>${vo.h_content }</textarea>
		<br /> 작성자 아이디<br /> <input type="text" value="${vo.h_userid }"
			readonly /><br /> 작성 시간<br />
		<fmt:formatDate value="${vo.h_reg }"
			pattern="yyyy-MM-dd HH:mm:ss" var="regdate" />
		<input type="text" value="${regdate }" readonly /><br /> 
		
		<input type="submit" value="수정" /> 
		<input type="button" id="btnList" value="메인으로 돌아가기" />

		<!-- page 정보를 update 요청에 포함시키기 위해서 -->
		<input type="hidden" name="page" value="${page }" />

	</form>
	<br />
	
		<h2>관리자 답변</h2>
		
	<div>
		<!-- <input type="text" name="rtext" id="rtext" placeholder="답글 입력.." required /> -->
		<textarea rows="5" cols="40" placeholder="답글 입력.." name="rtext" id="rtext" ></textarea>
		<!-- <input type="text" name="replier" id="replier" placeholder="아이디 입력.." required /> -->
		<button type="button" id="btnCreate">저장</button>
	</div>



	<div>
		<ul id="replies"></ul>
	</div>

	<div id="modify">
		<input type="text" name="rno" id="rno_mod" readonly /><br /> <input
			type="text" name="rtext" id="rtext_mod" /><br />
		<button id="btn_del">삭제</button>
		<button id="btn_Update">수정완료</button>
		<button id="btn_Cancel">취소</button>
	</div>

	<!-- jQuery CDN -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			var bno = $('#bno').val();
			console.log("bnoasdasd: " + bno);

			getAllReplies();

			//모든 댓글을 읽어와서 세팅해주는 함수 정의
			function getAllReplies() {
				var url = "/ex02/replies/all/" + bno;
				console.log("bno 번호: " + bno);
								
				$.getJSON(url,function(result) {//getJSON URL주소로 get방식으로 요청을하고 성공시 전달받은 값을 매개변수로받음
					console.log("댓글 개수: " + result.length);
					var list = "";
					
					$(result).each(function() {
						var date = new Date(this.regdate);
						var dateString = date.toLocaleDateString();
						console.log("bn1o: "+ this.rno);
						//html코드를 만들어 list를 만들어줌
						list += '<li class="reply_list" data-rno="'+this.rno +'">'
						+ ' '+ this.rno + ' ' + '<span class="replier">' + this.replier
						+ '</span>'+ '  '+ '<span class="rtext">'+ this.rtext
						+ '</span>'+ '  '+ '<span class="regdate">'+ dateString
						+ '<br/>'});
						//replies 아이디속성을가진 ul태그에 위에서 만든 html 코드를 세팅해줌
						$('#replies').html(list);
					});
				};

						$('#btnCreate').click(function() {
							
							var rtext = $('#rtext').val();
							var replier = $('#replier').val();
							$.ajax({
								type : 'post',
								url : '/ex02/replies',
								headers : {
									'Content-Type' : 'application/json',
									'X-HTTP-Method-Override' : 'POST'
								},
								data : JSON.stringify({
									bno : bno,
									rtext : rtext,
									replier : replier
								}),
								success : function(result) {
									if (result == 1) {
										alert('댓글 작성 완료');
										getAllReplies();
									}
								}
							})

						});

							$('#btnList').click(function() {
								//location = 'list';
								location = 'list-page?page=${page}';
							});

						});//end document ready()
	</script>
</body>
</html>