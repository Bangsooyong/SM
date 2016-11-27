<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
div {
	float: left;
	margin-right: 100px;
}

li {
	list-style-type: none;
}
</style>

</head>
<body>
	<h3>
		<a href="/shop">홈</a>
	</h3>
	<h1>
		<a href="mypage">관리자페이지</a>
	</h1>
	<div>
		<h3>판매관리</h3>
		<ol>
			<li><a href="buyr">전체 주문 요청 내역</a></li>
			<li><a href="buyf">전체 판매 내역</a></li>
			<li><a href="total">전체 판매 통계</a></li>
		</ol>

		<h3>회원관리</h3>
		<ol>
			<li><a href="#">판매자 가입 승인 요청 내역</a></li>
			<li><a href="#">판매물 등록 승인</a></li>
			<li><a href="#">회원 목록</a></li>
		</ol>

	</div>

	<div>
		<a>[새로운 주문 내역]</a> <a>[새루운 판매 내역]</a> <a>[새로운 판매자]</a> <a>[새로운
			판매몰]</a> <br /> <a href="#">오늘의 주문 내역 클릭</a> <a href="#">오늘의 판매 내역 클릭</a>
		<a href="#">새로운 판매자 클릭</a> <a href="#">새로운 판매몰 클릭</a>

		<h3>최근 주문 요청 내역(최근 5건)</h3>
		<table>
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
					<td>판매자 ID&emsp;</td>
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

		<br />
		<br />

		<h3>최근 판매 완료 내역(최근 5건)</h3>
		<table>
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
					<td>판매자ID&emsp;</td>
					<td>${list.b_id }&emsp;</td>
					<td>배송완료</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>