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
	<select name = "searchType">
		<option value="n" <c:out value="${cri.searchType == null?'selected':'' }"/>>---</option>
		<option value="i" <c:out value="${cri.searchType eq 'i'?'selected':'' }"/>>판매자 ID</option>
		<option value="b" <c:out value="${cri.searchType eq 'b'?'selected':'' }"/>>상품번호</option>
		<option value="p" <c:out value="${cri.searchType eq 'p'?'selected':'' }"/>>상품명</option>
		<option value="ib" <c:out value="${cri.searchType eq 'ib'?'selected':'' }"/>>판매자 ID or 상품번호</option>
		<option value="ip" <c:out value="${cri.searchType eq 'ip'?'selected':'' }"/>>판매자 ID or 상품명</option>
		<option value="bp" <c:out value="${cri.searchType eq 'bp'?'selected':'' }"/>>상품번호 or 상품명</option>
		<option value="ibp" <c:out value="${cri.searchType eq 'ibp'?'selected':'' }"/>>판매자 ID or 상품번호 or 상품명</option>
	</select>
	
	<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
	<button id='searchBtn'>Search</button>


	<table>
		<tr>
			<th>회원번호</th>
			<th>판매자 ID</th>
			<th>상품번호</th>
			<th>상품명(옵션)</th>
			<th>승인여부</th>
		</tr>
		<c:forEach var="pvo" items="${productList }">
			<c:forEach var="svo" items="${sellerList }">
		
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
	
	<ul class="pageLinks" >
			<li id="main"><a href="${pageMaker.startPageNum }">처음으로</a></li>
			<c:if test="${searchpageMaker.hasPrev }">
				<li id="page"><a href="${searchpageMaker.startPageNum - 1 }">&laquo;이전</a></li>
			</c:if>

			<c:forEach begin="${searchpageMaker.startPageNum }"
				end="${searchpageMaker.endPageNum }" var="num">
				<li id="page"><a href="${num }">${num }</a></li>
			</c:forEach>

			<c:if test="${searchpageMaker.hasNext }">
				<li id="page"><a href="${searchpageMaker.endPageNum + 1 }">다음&raquo;</a></li>
			</c:if>

		</ul>

	<%-- 현재 페이지, 페이지 당 보여줄 게시글 개수를 서버로 보내주기 위해서, 
	사용자에게는 보이지 않지만, 서버로 보낼 정보를 양식 데이터로 저장하는 form --%>
		<form id="pageForm">
			
			<input type="hidden" name="page" value="${searchpageMaker.criteria.page }" /> 
			<input type="hidden" name="perPage" value="${searchpageMaker.criteria.perPage }" />
			<input type="hidden" name="searchType" value="${searchpageMaker.criteria.searchType }"/>
			<input type="hidden" name="keyword" value="${cri.keyword }">
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
		frm.find('[name="searchType"]').val(
				$("select option:selected").val());
		// 페이징 화면으로 보내기 위한 action 정보
		frm.attr('action', 'seller_accept_product_searchlist');
		// 페이징 화면을 처리하는 Controller의 method(요청 처리 방식)
		frm.attr('method', 'get');
		// 폼 양식을 서버로 전송
		frm.submit();
	});
	
	$('#main a').click(function() {
		event.preventDefault(); // 기본 이벤트 처리 방식을 방지(막음)
		// pageForm 안에 있는 name="page"인 요소를 찾아서
		// 이동할 페이지 번호를 세팅
		var targetPage = $(this).attr('href');
		console.log('targetPage=' + targetPage);
		frm.find('[name="page"]').val(targetPage);
		// 페이징 화면으로 보내기 위한 action 정보
		frm.attr('action', 'seller_accept_product_list');
		// 페이징 화면을 처리하는 Controller의 method(요청 처리 방식)
		frm.attr('method', 'get');
		// 폼 양식을 서버로 전송
		frm.submit();
	});
	
	$('#searchBtn').on( "click", function(event) { 
		
		self.location = "seller_accept_product_searchlist" 
			+ "?page=1"
			+ "&perPage=5"
			+ "&searchType="
			+ $("select option:selected").val()
			+ "&keyword=" + encodeURI($('#keywordInput').val());
		
 
		 	
	});
	
});

</script>

</html>