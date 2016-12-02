<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Shop</title>
<style type="text/css">

#div1 {
	float: left;
	margin-right: 100px;
	height: 500px;
}

#div2 {
	margin-bottom: 20px;
}

li {
	list-style-type: none;
}

caption {
	margin-bottom: 10px;
}
</style>

</head>
<body>
	
	<a href="JavaScript:window.history.back()">이전 페이지</a>
	
	<a href="JavaScript:window.location.reload()">페이지 새로고침</a><br><br> 
<!-- 	<h1>
		<a href="admin_mypage">관리자페이지</a>
	</h1> -->
	<div id="div1">
		<h3>판매관리</h3>
		<ol>
			<li><a href="buyr">전체 주문 요청 내역</a></li>
			<li><a href="buyf">전체 판매 내역</a></li>
			<li><a href="total">전체 판매 통계</a></li>
		</ol>

		<h3>회원관리</h3>
		<ol>
			<li><a href="seller_accept_list">판매자 가입 승인 요청 내역</a></li>
			<li><a href="seller_accept_product_list">판매물 등록 승인</a></li>
			<li><a href="listview">회원 목록</a></li>
		</ol>

	</div>

	<div id="div2">
		<table>
			<tr>
				<th>[새로운 주문내역]</th>
				<th>[오늘의 판매 내역]</th>
				<th>[판매자 승인 요청]</th>
				<th>[판매몰 승인 요청]</th>
			</tr>
			<tr style="font-size: 35px;">
				<td id = "newReq" onMouseover="this.style.color='pink';"
					onMouseout="this.style.color='blue';"
				style="text-align: center; color: blue;
				text-decoration: underline; ">${reqSize}건</td>
				
				<td id="buyTo" onMouseover="this.style.color='pink';" 
				onMouseout="this.style.color='blue';"			
				style="text-align: center; color: blue; 
				text-decoration: underline; ">${buyTodaySize}건</td>
				
				<td id="sel_ACC" onMouseover="this.style.color='pink';" 
				onMouseout="this.style.color='blue';"			
				style="text-align: center; color: blue; 
				text-decoration: underline; ">${accSize}건</td>
				
				<td id="p_Acc" onMouseover="this.style.color='pink';" 
				onMouseout="this.style.color='blue';"			
				style="text-align: center; color: blue; 
				text-decoration: underline; ">${pSize}건</td>
			</tr>
		</table>
	</div>

	<div id="maindiv">
		<table id="totalReq">
			<caption><b>주문 요청 내역(최근 5건)</b></caption>
			<tr>
				<th>주문번호</th>
				<th>주문날짜</th>
				<th>상품명(옵션)</th>
				<th>판매자</th>
				<th>구매자</th>
				<th>주문상태</th>
			</tr>
			<c:forEach var="list" items="${list2 }">
				<tr>
					<td>${list.buy_no }</td>
					<td><fmt:formatDate value="${list.buy_date }"
							pattern="yyyy년 MM월 dd일" />&emsp;</td>
					<td>${list.p_name }&emsp;(${list.o_cont })</td>
					<td>${list.s_id }&emsp;</td>
					<td>${list.b_id }&emsp;</td>
					<c:if test="${list.buy_status eq '0' }">
					<td>입금대기</td>
					</c:if>
					<c:if test="${list.buy_status eq '1' }">
					<td>결제확인중</td>
					</c:if>
					<c:if test="${list.buy_status eq '2' }">
					<td>결제완료</td>
					</c:if>
					<c:if test="${list.buy_status eq '3' }">
					<td>배송준비</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		
		<table id = "newTotalReq" style="display: none;">
			<caption><b>[새로운 주문 요청 내역]</b></caption>
			<tr>
				<th>주문번호</th>
				<th>주문날짜</th>
				<th>상품명(옵션)</th>
				<th>판매자</th>
				<th>구매자</th>
				<th>주문상태</th>
			</tr>
			<c:forEach var="listReq" items="${listBuyReq }">
				<tr>
					<td>${listReq.buy_no }</td>
					<td><fmt:formatDate value="${listReq.buy_date }"
							pattern="yyyy년 MM월 dd일" />&emsp;</td>
					<td>${listReq.p_name }&emsp;(${listReq.o_cont })</td>
					<td>${list.s_id }&emsp;</td>
					<td>${listReq.b_id }&emsp;</td>
					<c:if test="${listReq.buy_status eq '0' }">
					<td>입금대기</td>
					</c:if>
					<c:if test="${listReq.buy_status eq '1' }">
					<td>결제확인중</td>
					</c:if>
					<c:if test="${listReq.buy_status eq '2' }">
					<td>결제완료</td>
					</c:if>
					<c:if test="${listReq.buy_status eq '3' }">
					<td>배송준비</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>

		<br />
		<br />


		<table id="buySuc">
			<caption><b>최근 판매 완료 내역(최근 5건)</b></caption>
			<tr>
				<th>주문번호</th>
				<th>주문날짜</th>
				<th>상품명(옵션)</th>
				<th>판매자</th>
				<th>구매자</th>
				<th>주문상태</th>
			</tr>
			<c:forEach var="list" items="${listBuyVO }">
				<tr>
					<td>${list.buy_no }</td>
					<td><fmt:formatDate value="${list.buy_date }"
							pattern="yyyy년 MM월 dd일" />&emsp;</td>
					<td>${list.p_name }&emsp;(${list.o_cont })</td>
					<td>${list.s_id }&emsp;</td>
					<td>${list.b_id }&emsp;</td>
					<td>배송완료</td>
				</tr>
			</c:forEach>
		</table>
		
		<table id = "buyToday" style="display: none;">
			<caption><b>[오늘의 판매 내역]</b></caption>
			<tr>
				<th>주문번호</th>
				<th>주문날짜</th>
				<th>상품명(옵션)</th>
				<th>판매자</th>
				<th>구매자</th>
				<th>주문상태</th>
			</tr>
			<c:forEach var="listReq" items="${buyToday }">
				<tr>
					<td>${listReq.buy_no }</td>
					<td><fmt:formatDate value="${listReq.buy_date }"
							pattern="yyyy년 MM월 dd일" />&emsp;</td>
					<td>${listReq.p_name }&emsp;(${listReq.o_cont })</td>
					<td>${list.s_id }&emsp;</td>
					<td>${listReq.b_id }&emsp;</td>
					<c:if test="${listReq.buy_status eq '5' }">
					<td>배송완료</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		
		<table id = "sellerAccess" style="display: none;">
			<caption><b>[판매자 승인 요청]</b></caption>
			<tr>
				<th>회원번호</th>
				<th>판매자 ID</th>
				<th>가입일</th>
				<th>이메일</th>
				<th>가입 승인</th>
			</tr>
			<c:forEach var="svo" items="${listAcc }">
				<tr>
					<td>${svo.s_no}</td>
					<td>${svo.s_id}&emsp;</td>
					<td><fmt:formatDate value="${svo.s_reg }"
							pattern="yyyy-MM-dd HH:mm:ss" />&emsp;</td>
					<td>${svo.s_email}&emsp;</td>
					<td><c:if test="${svo.s_acc == 0 }">미승인</c:if>
						<c:if test="${svo.s_acc == 1 }">승인</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		
			<table id = "productAccess" style="display: none;">
			<caption><b>[판매물 승인 요청]</b></caption>
			<tr>
				<th>회원번호</th>
				<th>판매자</th>
				<th>상품번호</th>
				<th>상품명(옵션)</th>
				<th>승인여부</th>
			</tr>
			<c:forEach var="pvo" items="${pAcc }">
			<c:forEach var="svo" items="${sel_id }">
				<tr>
				<c:if test="${pvo.s_id == svo.s_id }">
					<td>${svo.s_no}</td>
					<td>${pvo.s_id}</td>
					<td>${pvo.p_no }</td>
					<td>${pvo.p_name}<!--옵션정보 추가해줘야함 정훈이 코드 참고 --></td>
					<td><c:if test="${pvo.p_acc == 0 }">미승인</c:if>
						<c:if test="${pvo.p_acc == 1 }">승인</c:if>
					</td>
 				</c:if>
				</tr>
			</c:forEach>
			</c:forEach>
		</table>
				
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
		
		$('#newReq').click(function () {
			$('#maindiv').children().hide();
			$('#newTotalReq').show();
		})
		
		$('#buyTo').click(function () {
/* 			$('#totalReq').hide();
			$('#buySuc').hide();
			$('#buyToday').show(); */
			$('#maindiv').children().hide();
			$('#buyToday').show();
		})
		
		$('#sel_ACC').click(function() {
			$('#maindiv').children().hide();
			$('#sellerAccess').show();	
		})

		$('#p_Acc').click(function() {
			$('#maindiv').children().hide();
			$('#productAccess').show();	
		})
		
		
	})
	</script>

</body>
</html>