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
	<h1><a href="admin_mypage">관리자페이지</a></h1>
	<div>
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
	<div>
	<h3>판매물 등록 승인</h3> 
	
	<input type="button" value="Search"> <input type="text">


	<table>
		<tr>
			<th>회원번호</th>
			<th>판매자</th>
			<th>상품번호</th>
			<th>상품명(옵션)</th>
			<th>승인여부</th>
		</tr>
		<c:forEach var="pvo" items="${prodcutList }">
			<c:forEach var="svo" items="${sellerList }">
		
			<tr>
				<td>${svo.s_no}</td>
				<td>${pvo.s_id}</td>
				<td>${pvo.p_no }</td>
				<td>${pvo.p_name}<!--옵션정보 추가해줘야함 정훈이 코드 참고 --></td>
				<td><c:if test="${pvo.p_acc == 0 }">미승인</c:if>
					<c:if test="${pvo.p_acc == 1 }">승인</c:if>
				</td>
			</tr>
			</c:forEach>
		</c:forEach>
	</table>


	</div>





</body>
</html>