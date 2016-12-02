<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>qna</title>
<style>

.modify {
	display: none;
}
.qnaDetail {
	border: none;
	
}

</style>

</head>
<body>
	<h1></h1>

	<h3>
		<a href="/shop">홈</a>
	</h3>

	<div>
		<h3>QnA게시판</h3>

		<table>
			<tr>
				<th>문의유형&emsp;</th>
				<th>답변여부&emsp;</th>
				<th>문의/답변&emsp;</th>
				<th>작성자&emsp;</th>
				<th>작성일&emsp;</th>
			</tr>
			<tr>
				<td></td>
			</tr>
			<c:forEach var="list" items="${listQnA }" varStatus="state">
				<tr>
					<c:if test="${list.qna_type eq 0 }">
						<td>상품</td>
					</c:if>
					<c:if test="${list.qna_type eq 1 }">
						<td>배송</td>
					</c:if>
					<c:if test="${list.qna_type eq 2 }">
						<td>반품/취소</td>
					</c:if>
					<c:if test="${list.qna_type eq 3 }">
						<td>교환/변경</td>
					</c:if>
					<c:if test="${list.qna_type eq 4 }">
						<td>기타</td>
					</c:if>
					<c:if test="${list.qna_reply eq 0 }">
						<td>답변 대기&emsp;</td>
					</c:if>
					<c:if test="${list.qna_reply eq 1 }">
						<td>답변 완료&emsp;</td>
					</c:if>
					

					<td class="replies" repData="${state.index }">
					
					&emsp;&emsp;&emsp;<b>구매자 문의</b><br/>

					<input type="text" class ="qnaDetail" value= "${list.qna_cont }" modData="${state.index }" 
 						onMouseover="this.style.color='blue';" onMouseout="this.style.color='black';" 
						style="text-decoration:underline" readonly/>
					
					<br/>
					
					<c:if test="${list.qna_reply eq 0 }">
					
						<div class="modify${state.index }" modData="${state.index }" style="display: none;">
						
						<form id = "frm${state.index }" method="post">
						&emsp;&emsp;&emsp;<b>판매자 답변</b><br/>
							<textarea cols="25" rows="3" name="qna_r_cont" id="replyCont"
								placeholder="답변내용입력" required></textarea>
							
							<input type="hidden" name="s_id" id="s_id" value="sellerId" /> 
							<input type="hidden" name="qna_no" id="qna_no" value="${list.qna_no }" />
							</form>						
						<button type="submit" id="insertReply">저장</button>
							
						</div>

					</c:if>
					
					<c:if test="${list.qna_reply eq 1 }">
					<c:forEach var="listr" items="${listQnAR }" >
					<c:if test="${list.qna_no eq listr.qna_no }">
					
						<div class="modify${state.index }" modData="${state.index }" style="display: none;">
						
						<form id = "updatefrm${state.index }" method="post">
						&emsp;&emsp;&emsp;<b>판매자 답변</b><br/>
						
							<textarea cols="25" rows="3" id = "replyCont${state.index }" name = "qna_r_cont" readonly>${listr.qna_r_cont }</textarea>
							<input type="hidden" name="qna_r_no" id="qna_r_no" value="${listr.qna_r_no }"/>
							<input type="hidden" name="s_id" id="s_id" value="${listr.s_id }" /> 
							<input type="hidden" name="qna_no" id="qna_no" value="${listr.qna_no }" />
						</form>
						<button type="submit" class="updateReply">수정</button>
						<button type="submit" class="updateReply1" style="display: none;">수정완료</button>
						<button type="submit" class="deleteReply">삭제</button>
						</div>
						</c:if>
						</c:forEach>
					</c:if>
					<br/>
					</td>

					<td>${list.b_id }</td>
					<td><fmt:formatDate value="${list.qna_reg }"
							pattern="yyyy년 MM월 dd일" />&emsp;&emsp;</td>
				</tr>
			</c:forEach>



		</table>

	</div>
	<br />
	<button id="btnInsert">상품 문의하기</button>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
		var x = 0; //로그인버튼으로 활성 비활성
		var y = 0; //답변 게시판 활성 비활성
		var idx = 
			$('#btnInsert').click(function() {
				location = "insertQnA";
			});
			
			$('#insertReply').click(function() {
				var x = $(this).parent().attr('modData');
				var frm = $('#frm'+x);
 				frm.attr('action', 'insertReply');
				frm.attr('mehtod', 'post');
				frm.submit();
				
			});
			
			$('.updateReply').click(function () {
				/* $('#replyCont').attr("readonly",false); */
				var x = $(this).parent().attr('modData');
				alert("답변 내용 수정 가능! 완료 버튼 활성화")
				$('#replyCont'+x).attr("readonly", false);
				$('#replyCont'+x).attr("required", true);
				$('.updateReply1').show();
				$(this).hide();
			});
			
			$('.updateReply1').click(function() {
				var z = $(this).parent().attr('modData');
				var frm = $('#updatefrm'+z);
				frm.attr('action', 'updateReply');
				frm.attr('mehtod', 'post');
				frm.submit();
			})
			
			$('.qnaDetail').click(function () {
				var x = $(this).attr('modData');
				
				$('.modify'+x).toggle();
/*  				if(y == 0) {
					$('.modify'+x).show();
					y = 1;
					
					} else {
					$('.modify'+x).hide();
					y = 0;
					}; */
					
			});
			
			$('.deleteReply').click(function() {
				var z = $(this).parent().attr('modData');
				var frm = $('#updatefrm'+z);
				frm.attr('action', 'deleteReply');
				frm.attr('mehtod', 'post');
				frm.submit();
				
			});
			
			if ('${insert_reply}' == 'success') {
				alert('답변 등록 성공');
			} else if ('${insert_reply}' == 'fail') {
				alert('답변 등록  실패!');
			}
			
		})
	</script>


</body>
</html>