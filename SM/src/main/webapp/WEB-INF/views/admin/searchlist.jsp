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
		<a href="/shop">Ȩ</a>
	</h3>

	<h1><a href="admin_mypage">������������</a></h1>
	<div>
		<h3>�ǸŰ���</h3>
		<ol>
			<li><a href="buyr">��ü �ֹ� ��û ����</a></li>
			<li><a href="buyf">��ü �Ǹ� ����</a></li>
			<li><a href="total">��ü �Ǹ� ���</a></li>
		</ol>

		<h3>ȸ������</h3>
		<ol>
			<li><a href="seller_accept_list">�Ǹ��� ���� ���� ��û ����</a></li>
			<li><a href="seller_accept_product_list">�ǸŹ� ��� ����</a></li>
			<li><a href="listview">ȸ�� ���</a></li>
		</ol>

	</div>
	<div>
		<h3>�Ϲ� ȸ�� ���</h3>
		<select name="searchType">
			<option value="n"
				<c:out value="${cri.searchType == null?'selected':''}"/>>---</option>
			<option value="i"
				<c:out value="${cri.searchType eq 'i'?'selected':''}"/>>ȸ��
				ID</option>
			<option value="n"
				<c:out value="${cri.searchType eq 'n'?'selected':''}"/>>ȸ��
				��</option>
			<option value="in"
				<c:out value="${cri.searchType eq 'in'?'selected':''}"/>>ȸ��
				ID or ȸ�� ��</option>>
		</select> 
		<input type="text" name="keyword" id="keywordInput" value='${cri.keyword }' />
		<button id='searchBtn'>Search</button>

		<table id="table">
			<tr>
				<th>ȸ����ȣ</th>
				<th>ȸ����</th>
				<th>ȸ��ID</th>
				<th>������</th>
				<th>������</th>
			</tr>
			<!-- ��� ȸ���� ���� ���� ���� -->
			<c:forEach var="buyer" items="${buyerList}">
				<c:if test="${buyer.b_gender eq 1 }">
					<c:set var="user_gender" value="����"></c:set>
				</c:if>
				<c:if test="${buyer.b_gender eq 0 }">
					<c:set var="user_gender" value="����"></c:set>
				</c:if>
				<tr>
					<td class="bno">${buyer.b_no}</td>
					<td class="bname">${buyer.b_name}</td>
					<td class="bid">${buyer.b_id}</td>
					<td class="breg"><fmt:formatDate value="${buyer.b_reg }"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><button>�� ����</button></td>
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
				<li id="main"><a href="${pageMaker.startPageNum }">ó������</a></li>
			<c:if test="${searchpageMaker.hasPrev }">
				<li id="page"><a href="${searchpageMaker.startPageNum - 1 }">&laquo;����</a></li>
			</c:if>

			<c:forEach begin="${searchpageMaker.startPageNum }"
				end="${searchpageMaker.endPageNum }" var="num">
				<li id="page"><a href="${num }">${num }</a></li>
			</c:forEach>

			<c:if test="${searchpageMaker.hasNext }">
				<li id="page"><a href="${searchpageMaker.endPageNum + 1 }">����&raquo;</a></li>
			</c:if>

		</ul>

		<%-- ���� ������, ������ �� ������ �Խñ� ������ ������ �����ֱ� ���ؼ�,
����ڿ��Դ� ������ ������, ������ ���� ������ ��� �����ͷ� �����ϴ� form --%>
		<form id="pageForm">

			<input type="hidden" name="page" value="${searchpageMaker.criteria.page }" /> 
			<input type="hidden" name="perPage" value="${searchpageMaker.criteria.perPage }" /> 
			<input type="hidden" name="searchType"	value="${searchpageMaker.criteria.searchType}" />
		    <input type="hidden" name="keyword" value="${cri.keyword }" />
		</form>

	</div>

	<!-- a �±� Ŭ���� �������� ���� ȸ�� ���� -->
	<div id="detail">

		<h4>ȸ�� �� ����</h4>

		<label for="bno">ȸ����ȣ</label> <input type="text" name="d_bno"
			id="d_bno" readonly><br /> <label for="bname">�̸�</label> <input
			type="text" name="d_bname" id="d_bname" readonly><br /> <label
			for="bid">���̵�</label> <input type="text" name="d_bid" id="d_bid"
			readonly><br /> <label for="bphone">����ó</label> <input
			type="text" name="d_bphone" id="d_bphone" readonly><br /> <label
			for="breg">������</label> <input type="text" name="d_breg" id="d_breg"
			readonly><br /> <label for="bemail">�̸���</label> <input
			type="text" name="d_bemail" id="d_bemail" readonly><br /> <label
			for="bbirth">����</label> <input type="text" name="d_bbirth"
			id="d_bbrith" readonly><br /> <label for="bgender">����</label>
		<input type="text" name="d_bgender" id="d_bgender" readonly><br />
		<label for="baddr">�ּ�</label> <input type="text" name="d_baddr"
			id="d_baddr" readonly><br /> <label for="bmile">���ϸ���</label>
		<input type="text" name="d_bmile" id="d_bmile" readonly><br />
		<button id="close">�ݱ�</button>
	</div>

</body>
<!-- JQuery CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(
			function() {
				// a �±� Ŭ���� -> �������� ������ a�±� �������!
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

				// �ݱ� ��ư�� �󼼺��� â�� ������.
				$('#close').click(function() {
					$('#detail').hide();
				});

				var frm = $('#pageForm');

				// Ŭ���� pageLinks ���� li �±� ���� a �±׸� ã�Ƽ� click �̺�Ʈ�� Ŀ���͸���¡
				$('.pageLinks li a').click(
						function() {
							event.preventDefault(); // �⺻ �̺�Ʈ ó�� ����� ����(����)
							// pageForm �ȿ� �ִ� name="page"�� ��Ҹ� ã�Ƽ�
							// �̵��� ������ ��ȣ�� ����
							var targetPage = $(this).attr('href');
							frm.find('[name="page"]').val(targetPage);
							frm.find('[name="searchType"]').val(
									$("select option:selected").val());
							// ����¡ ȭ������ ������ ���� action ����
							frm.attr('action', 'searchlist');
							// ����¡ ȭ���� ó���ϴ� Controller�� method(��û ó�� ���)
							frm.attr('method', 'get');
							// �� ����� ������ ����
							frm.submit();
						});

				$('#main a').click(function() {
					event.preventDefault(); // �⺻ �̺�Ʈ ó�� ����� ����(����)
					// pageForm �ȿ� �ִ� name="page"�� ��Ҹ� ã�Ƽ�
					// �̵��� ������ ��ȣ�� ����
					var targetPage = $(this).attr('href');
					console.log('targetPage=' + targetPage);
					frm.find('[name="page"]').val(targetPage);
					// ����¡ ȭ������ ������ ���� action ����
					frm.attr('action', 'listview');
					// ����¡ ȭ���� ó���ϴ� Controller�� method(��û ó�� ���)
					frm.attr('method', 'get');
					// �� ����� ������ ����
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
