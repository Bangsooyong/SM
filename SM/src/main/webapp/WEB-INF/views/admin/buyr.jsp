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
.pageLinks li {
	display: inline;
}
</style>

</head>
<body>

	<h3><a href="/shop">홈</a></h3>
	<a href="JavaScript:window.history.back()">이전 페이지</a>
	<a href="JavaScript:window.location.reload()">페이지 새로고침</a><br><br> 
	
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

		<h3>전체 주문 요청 내역</h3>
		<select name = "searchType">
			<option value="n" <c:out value="${cri.searchType == null?'selected':'' }"/>>---</option>
			<option value="s" <c:out value="${cri.searchType eq 's'?'selected':'' }"/>>판매자 ID</option>
			<option value="b" <c:out value="${cri.searchType eq 'b'?'selected':'' }"/>>구매자 ID</option>
			<option value="t" <c:out value="${cri.searchType eq 't'?'selected':'' }"/>>주문상태</option>
			<option value="sb" <c:out value="${cri.searchType eq 'sb'?'selected':'' }"/>>판매자 ID or 구매자 ID</option>
			<option value="st" <c:out value="${cri.searchType eq 'st'?'selected':'' }"/>>판매자 ID or 주문상태</option>
			<option value="bt" <c:out value="${cri.searchType eq 'bt'?'selected':'' }"/>>구매자 ID or 주문상태</option>
			<option value="sbt" <c:out value="${cri.searchType eq 'sbt'?'selected':'' }"/>>판매자 ID or 구매자 ID or 주문상태</option>
		</select>
	
		<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
		<button id='searchBtn'>Search</button>
			
		<table>
			<tr>
				<th>주문번호</th>
				<th>주문날짜&emsp;</th>
				<th>상품명(옵션)&emsp;</th>
				<th>판매가격&emsp;</th>
				<th>판매자 ID&emsp;</th>
				<th>구매자 ID&emsp;</th>
				<th>주문상태&emsp;</th>
			</tr>
			<tr><td></td></tr>
			<c:forEach var="list" items="${list }">
				<tr>
					
					<td>${list.buy_no }</td>
					<td><fmt:formatDate value="${list.buy_date }"
							pattern="yyyy년 MM월 dd일" />&emsp;&emsp;</td>
					<td>${list.p_name }&emsp;(${list.o_cont })</td>
					<td>${list.p_price }원</td>
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

		<ul class="pageLinks" >
			<c:if test="${pageMaker.hasPrev }">
				<li id="page"><a href="${pageMaker.startPageNum - 1 }">&laquo;이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPageNum }"
				end="${pageMaker.endPageNum }" var="num">
				<li id="page"><a href="${num }">${num }</a></li>
			</c:forEach>

			<c:if test="${pageMaker.hasNext }">
				<li id="page"><a href="${pageMaker.endPageNum + 1 }">다음&raquo;</a></li>
			</c:if>

		</ul>

	<%-- 현재 페이지, 페이지 당 보여줄 게시글 개수를 서버로 보내주기 위해서, 
	사용자에게는 보이지 않지만, 서버로 보낼 정보를 양식 데이터로 저장하는 form --%>
		<form id="pageForm">
			
			<input type="hidden" name="page" value="${pageMaker.criteria.page }" /> 
			<input type="hidden" name="perPage" value="${pageMaker.criteria.perPage }" />
		</form>

	</div>

</body>

<!-- JQuery CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(document).ready(function() {
	
	var frm = $('#pageForm');

	// 클래스 pageLinks 안의 li 태그 안의 a 태그를 찾아서 click 이벤트를 커스터마이징
	$('.pageLinks li a').click(function() {
		event.preventDefault(); // 기본 이벤트 처리 방식을 방지(막음)
		// pageForm 안에 있는 name="page"인 요소를 찾아서
		// 이동할 페이지 번호를 세팅
		var targetPage = $(this).attr('href');
		console.log('targetPage=' + targetPage);
		frm.find('[name="page"]').val(targetPage);
		// 페이징 화면으로 보내기 위한 action 정보
		frm.attr('action', 'buyr');
		// 페이징 화면을 처리하는 Controller의 method(요청 처리 방식)
		frm.attr('method', 'get');
		// 폼 양식을 서버로 전송
		frm.submit();
	});
	
	$('#searchBtn').on( "click", function(event) { 
		
		self.location = "buyr_searchlist" 
			+ "?page=1"
			+ "&perPage=5"
			+ "&searchType="
			+ $("select option:selected").val()
			+ "&keyword=" + encodeURI($('#keywordInput').val());
 	
	});
	
	$('#id1').click(function() {
		//parent.document.location.reload();
		//location.reload();
		//reload(true);
		window.location.reload();
	})
	
});

</script>
</html>