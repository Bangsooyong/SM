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
	<h3>�ǸŹ� ��� ����</h3> 
	<select name = "searchType">
		<option value="n" <c:out value="${cri.searchType == null?'selected':'' }"/>>---</option>
		<option value="i" <c:out value="${cri.searchType eq 'i'?'selected':'' }"/>>�Ǹ��� ID</option>
		<option value="n" <c:out value="${cri.searchType eq 'n'?'selected':'' }"/>>��ǰ��ȣ</option>
		<option value="p" <c:out value="${cri.searchType eq 'p'?'selected':'' }"/>>��ǰ��</option>
		<option value="in" <c:out value="${cri.searchType eq 'in'?'selected':'' }"/>>�Ǹ��� ID or ��ǰ��ȣ</option>
		<option value="ip" <c:out value="${cri.searchType eq 'ip'?'selected':'' }"/>>�Ǹ��� ID or ��ǰ��</option>
		<option value="np" <c:out value="${cri.searchType eq 'np'?'selected':'' }"/>>��ǰ��ȣ or ��ǰ��</option>
		<option value="inp" <c:out value="${cri.searchType eq 'inp'?'selected':'' }"/>>�Ǹ��� ID or ��ǰ��ȣ or ��ǰ��</option>
	</select>
	
	<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
	<button id='searchBtn'>Search</button>


	<table>
		<tr>
			<th>ȸ����ȣ</th>
			<th>�Ǹ��� ID</th>
			<th>��ǰ��ȣ</th>
			<th>��ǰ��(�ɼ�)</th>
			<th>���ο���</th>
		</tr>

			<c:forEach var="pvo" items="${prodcutList }">
			<c:forEach var="svo" items="${sellerList }">

				<tr>
				<c:if test="${pvo.s_id == svo.s_id }">
					<td>${svo.s_no}</td>
					<td>${pvo.s_id}</td>
					<td>${pvo.p_no }</td>
					<td>${pvo.p_name}<!--�ɼ����� �߰�������� ������ �ڵ� ���� --></td>
					<td><c:if test="${pvo.p_acc == 0 }">�̽���</c:if>
						<c:if test="${pvo.p_acc == 1 }">����</c:if>
					</td>
				</c:if>
				</tr>
			</c:forEach>
			</c:forEach>
	</table>
	
	<ul class="pageLinks" >
			<c:if test="${pageMaker.hasPrev }">
				<li id="page"><a href="${pageMaker.startPageNum - 1 }">&laquo;����</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPageNum }"
				end="${pageMaker.endPageNum }" var="num">
				<li id="page"><a href="${num }">${num }</a></li>
			</c:forEach>

			<c:if test="${pageMaker.hasNext }">
				<li id="page"><a href="${pageMaker.endPageNum + 1 }">����&raquo;</a></li>
			</c:if>

		</ul>

	<%-- ���� ������, ������ �� ������ �Խñ� ������ ������ �����ֱ� ���ؼ�, 
	����ڿ��Դ� ������ ������, ������ ���� ������ ��� �����ͷ� �����ϴ� form --%>
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

	// Ŭ���� pageLinks ���� li �±� ���� a �±׸� ã�Ƽ� click �̺�Ʈ�� Ŀ���͸���¡
	$('.pageLinks li a').click(function() {
		event.preventDefault(); // �⺻ �̺�Ʈ ó�� ����� ����(����)
		// pageForm �ȿ� �ִ� name="page"�� ��Ҹ� ã�Ƽ�
		// �̵��� ������ ��ȣ�� ����
		var targetPage = $(this).attr('href');
		console.log('targetPage=' + targetPage);
		frm.find('[name="page"]').val(targetPage);
		// ����¡ ȭ������ ������ ���� action ����
		frm.attr('action', 'seller_accept_product_list');
		// ����¡ ȭ���� ó���ϴ� Controller�� method(��û ó�� ���)
		frm.attr('method', 'get');
		// �� ����� ������ ����
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