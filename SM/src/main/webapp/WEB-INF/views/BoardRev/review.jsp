<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>review</title>
<style>

.modify {
	display: none;
}
.qnaDetail {
	border: none;
	color: blue;
}

.star_rating {font-size:0; letter-spacing:0px;}
.star_rating a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
}

.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:rgb(238, 11, 51);}

</style>

</head>
<body>
	<h1></h1>
	
	<h3>
		<a href="/shop">홈</a>
	</h3>

	<div>
		<h3>후기 게시판</h3>

		<table>
			<tr>
				<th>별점&emsp;</th>
				<th>작성자&emsp;</th>
				<th>작성일&emsp;</th>
			</tr>
			
			<c:forEach var="list" items="${listRev }" varStatus="state">
			<tr>		
			<td>
				<p class="star_rating" >
				
					 <c:forEach begin="1" end="${list.rev_score }" var="item">
					 <a class="on" name = "rev_score">★</a>
					 </c:forEach>
					 <c:forEach begin="${list.rev_score }" end="4" var="item2">
					 <a name = "rev_score">★</a>
					 </c:forEach>
					 
				</p>
			</td>
			
				<td>${list.b_id }</td>
				<td><fmt:formatDate value="${list.rev_reg }"
					pattern="yyyy년 MM월 dd일" />&emsp;&emsp;</td>
			</tr>
			
			<tr>
			<td><b>${list.rev_cont }</b></td>
			</tr>
			
			<tr class ="revReply" modData="${state.index }">
			<th style="text-decoration: underline;" onMouseover="this.style.color='blue';" onMouseout="this.style.color='black';">판매자 답글</th>
			</tr>

			<tr>
				<td class="modify" id="modify${state.index }" modData="${state.index }">
					
					<c:if test="${list.rev_reply eq 0 }">
						<div modData="${state.index }">
						<form id="frm${state.index }" method="post" >
							<input type="text" name="rev_r_cont" placeholder="답글작성" maxlength="100"/>
							
							<input type="hidden" name="rev_no" value="${list.rev_no}"/>
							<input type="hidden" name="s_id" value="sellerId1"/>
						</form>
						
						<button type="submit" class="insertReply">저장</button>
						</div>
					</c:if>
					
					<c:if test="${list.rev_reply eq 1 }">
						<c:forEach var="listr" items="${listReply}">
						<c:if test="${list.rev_no eq listr.rev_no }">
						
						<div modData="${state.index }">
						<form id = "updatefrm${state.index }" method="post">
							<input type="text" id="replyCont${state.index }" name="rev_r_cont" 
							maxlength="100" value="${listr.rev_r_cont }" 
							readonly style="border: none; color:maroon;"/>
							<input type="hidden" name="rev_r_no" id="rev_r_no" value="${listr.rev_r_no }"/>
							<input type="hidden" name="s_id" id="s_id" value="${listr.s_id }" /> 
							<input type="hidden" name="rev_no" id="rev_no" value="${listr.rev_no }" />
						</form>
						
						<button type="submit" class="updateReply">수정</button>
						<button type="submit" class="updateReply1" style="display: none;">수정완료</button>
						<button type="submit" class="deleteReply">삭제</button>
						</div>
						</c:if>
						</c:forEach>
					</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<br />
	
	<button id="btnReviewInsert">후기 작성</button>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		
	<script>
	$(document).ready(function() {
		var y = 0;
		
		$('#btnReviewInsert').click(function() {
			location = "insertReview";
		})
		
		$('.insertReply').click(function() {
			var x = $(this).parent().attr('modData');

			var frm = $('#frm'+x);
			frm.attr('action', 'insertReply');
			frm.attr('mehtod', 'post');
			frm.submit();
			
		});
		
		$('.revReply').click(function () {
			var x = $(this).attr('modData');
			$('#modify'+x).toggle();
				
/* 			if(y == 0) {
				$('#modify'+x).show();
				y = 1;
				} else {
				$('#modify'+x).hide();
				y = 0;
				}; */
		});
		
		
		$('.updateReply').click(function () {
			/* $('#replyCont').attr("readonly",false); */
			var x = $(this).parent().attr('modData');
			alert("답변 내용 수정 가능! 완료 버튼 활성화")
			$('#replyCont'+x).attr("readonly", false);
			$('.updateReply1').show();
			$(this).hide();
		});
		
		$('.updateReply1').click(function() {
			var x = $(this).parent().attr('modData');
			var frm = $('#updatefrm'+x);
			frm.attr('action', 'updateReply');
			frm.attr('mehtod', 'post');
			frm.submit();
		})
		
		$('.deleteReply').click(function() {
			var x = $(this).parent().attr('modData');
			var frm = $('#updatefrm'+x);
			frm.attr('action', 'deleteReply');
			frm.attr('mehtod', 'post');
			frm.submit();
			
		});
		
	})
	</script>


</body>
</html>