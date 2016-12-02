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

#detail {
	width: 300px;
	height: 350px;
	background-color: tomato;
	position: absolute;
	top: 10%;
	left: 50%;
	display: none;
}
</style>

</head>
<body>

	<h3>
		<a href="/shop">홈</a>
	</h3>

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
		<h3>일반 회원 목록</h3>
		<select name="searchType">
			<option value="n"
				<c:out value="${cri.searchType == null?'selected':''}"/>>---</option>
			<option value="i"
				<c:out value="${cri.searchType eq 'i'?'selected':''}"/>>회원
				ID</option>
			<option value="n"
				<c:out value="${cri.searchType eq 'n'?'selected':''}"/>>회원
				명</option>
			<option value="in"
				<c:out value="${cri.searchType eq 'in'?'selected':''}"/>>회원
				ID or 회원 명</option>>
		</select> 
		<input type="text" name="keyword" id="keywordInput" value='${cri.keyword }' />
		<button id='searchBtn'>Search</button>

		<table id="table">
			<tr>
				<th>회원번호</th>
				<th>회원명</th>
				<th>회원ID</th>
				<th>가입일</th>
				<th>상세정보</th>
			</tr>
			<!-- 모든 회원에 대한 정보 보기 -->
			<c:forEach var="buyer" items="${buyerList}">
				<c:if test="${buyer.b_gender eq 1 }">
					<c:set var="user_gender" value="남자"></c:set>
				</c:if>
				<c:if test="${buyer.b_gender eq 0 }">
					<c:set var="user_gender" value="여자"></c:set>
				</c:if>
				<tr>
					<td class="bno">${buyer.b_no}</td>
					<td class="bname">${buyer.b_name}</td>
					<td class="bid">${buyer.b_id}</td>
					<td class="breg"><fmt:formatDate value="${buyer.b_reg }"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><button>상세 정보</button></td>
					<td class="phone" style="display: none;">${buyer.b_phone }</td>
					<td class="email" style="display: none;">${buyer.b_email }</td>
					<td class="birth" style="display: none;">${buyer.b_birth }</td>
					<td class="gender" style="display: none;">${user_gender }</td>
					<td class="addr" style="display: none;">${buyer.b_addr }</td>
					<td class="mile" style="display: none;">${buyer.b_mile }</td>
				</tr>
			</c:forEach>
		</table>

		<ul class="pageLinks">
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
			<input type="hidden" name="searchType"	value="${searchpageMaker.criteria.searchType}" />
		    <input type="hidden" name="keyword" value="${cri.keyword }" />
		</form>

	</div>

	<!-- a 태그 클릭시 보여지는 상세한 회원 정보 -->
	<div id="detail">

		<h4>회원 상세 정보</h4>

		<label for="bno">회원번호</label> <input type="text" name="d_bno"
			id="d_bno" readonly><br /> <label for="bname">이름</label> <input
			type="text" name="d_bname" id="d_bname" readonly><br /> <label
			for="bid">아이디</label> <input type="text" name="d_bid" id="d_bid"
			readonly><br /> <label for="bphone">연락처</label> <input
			type="text" name="d_bphone" id="d_bphone" readonly><br /> <label
			for="breg">가입일</label> <input type="text" name="d_breg" id="d_breg"
			readonly><br /> <label for="bemail">이메일</label> <input
			type="text" name="d_bemail" id="d_bemail" readonly><br /> <label
			for="bbirth">생일</label> <input type="text" name="d_bbirth"
			id="d_bbrith" readonly><br /> <label for="bgender">성별</label>
		<input type="text" name="d_bgender" id="d_bgender" readonly><br />
		<label for="baddr">주소</label> <input type="text" name="d_baddr"
			id="d_baddr" readonly><br /> <label for="bmile">마일리지</label>
		<input type="text" name="d_bmile" id="d_bmile" readonly><br />
		<button id="close">닫기</button>
	</div>

</body>
<!-- JQuery CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(
			function() {
				// a 태그 클릭시 -> 수정원츄 원래의 a태그 방식으로!
				$('#table').on('click', 'button', function() {
					$('#detail').show();

					var data = $(this).parent().parent();

					var bno = $(data).children('.bno').text();
					var name = $(data).children('.bname').text();
					var id = $(data).children('.bid').text();
					var date = $(data).children('.breg').text();
					var phone = $(data).children('.phone').text();
					var email = $(data).children('.email').text();
					var brith = $(data).children('.birth').text();
					var gender = $(data).children('.gender').text();
					var addr = $(data).children('.addr').text();
					var mile = $(data).children('.mile').text();

					$('#d_bno').val(bno);
					$('#d_bname').val(name);
					$('#d_bid').val(id);
					$('#d_breg').val(date);
					$('#d_bphone').val(phone);
					$('#d_bemail').val(email);
					$('#d_bbrith').val(brith);
					$('#d_bgender').val(gender);
					$('#d_baddr').val(addr);
					$('#d_bmile').val(mile);

				});

				// 닫기 버튼시 상세보기 창이 닫힌다.
				$('#close').click(function() {
					$('#detail').hide();
				});

				var frm = $('#pageForm');

				// 클래스 pageLinks 안의 li 태그 안의 a 태그를 찾아서 click 이벤트를 커스터마이징
				$('.pageLinks li a').click(
						function() {
							event.preventDefault(); // 기본 이벤트 처리 방식을 방지(막음)
							// pageForm 안에 있는 name="page"인 요소를 찾아서
							// 이동할 페이지 번호를 세팅
							var targetPage = $(this).attr('href');
							frm.find('[name="page"]').val(targetPage);
							frm.find('[name="searchType"]').val(
									$("select option:selected").val());
							// 페이징 화면으로 보내기 위한 action 정보
							frm.attr('action', 'searchlist');
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
					frm.attr('action', 'listview');
					// 페이징 화면을 처리하는 Controller의 method(요청 처리 방식)
					frm.attr('method', 'get');
					// 폼 양식을 서버로 전송
					frm.submit();
				});

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "searchlist"
							+ "?page=1"
							+ "&perPage=5" 
							+ "&searchType="
							+ $("select option:selected").val()
							+ "&keyword=" + encodeURI($('#keywordInput').val());

						});

			});
</script>

</html>
