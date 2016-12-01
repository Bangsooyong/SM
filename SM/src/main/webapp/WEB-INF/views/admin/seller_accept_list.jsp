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
	<h3>�Ǹ��� ���� ����</h3> 
	<select name = "searchType">
		<option value="n" <c:out value="${cri.searchType == null?'selected':''}"/>>---</option>
		<option value="n" <c:out value="${cri.searchType eq 'n'?'selected':'' }"/>>ȸ����ȣ</option>
		<option value="i" <c:out value="${cri.searchType eq 'i'?'selected':'' }"/>>�Ǹ��� ID</option>
		<option value="e" <c:out value="${cri.searchType eq 'e'?'selected':'' }"/>>�̸���</option>
		<option value="ni" <c:out value="${cri.searchType eq 'ni'?'selected':'' }"/>>ȸ����ȣ or �Ǹ��� ID</option>
		<option value="ne" <c:out value="${cri.searchType eq 'ne'?'selected':'' }"/>>ȸ����ȣ or �̸���</option>
		<option value="ie" <c:out value="${cri.searchType eq 'ie'?'selected':'' }"/>>�Ǹ��� ID or �̸���</option>
		<option value="nie" <c:out value="${cri.searchType eq 'nie'?'selected':'' }"/>>ȸ����ȣ or �Ǹ��� ID or �̸���</option>
		
		 
	</select> 
	<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
	<button id='searchBtn'>Search</button>


	<table>
		<tr>
			<th>ȸ����ȣ</th>
			<th>�Ǹ��� ID</th>
			<th>������</th>
			<th>�̸���</th>
			<th>���� ����</th>
		</tr>
		<c:forEach var="svo" items="${sellerList }">
			<tr>
				<td>${svo.s_no}</td>
				<td>${svo.s_id}</td>
				<td><fmt:formatDate value="${svo.s_reg }"
						pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>${svo.s_email}</td>
				<td><c:if test="${svo.s_acc == 0 }">�̽���</c:if>
					<c:if test="${svo.s_acc == 1 }">����</c:if>
				</td>
			</tr>
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
			frm.attr('action', 'seller_accept_list');
			// ����¡ ȭ���� ó���ϴ� Controller�� method(��û ó�� ���)
			frm.attr('method', 'get');
			// �� ����� ������ ����
			frm.submit();
		});
		
		$('#searchBtn').on( "click", function(event) { 
			
			self.location = "seller_accept_searchlist" 
				+ "?page=1"
				+ "&perPage=5"
				+ "&searchType="
				+ $("select option:selected").val()
				+ "&keyword=" + encodeURI($('#keywordInput').val());
			
	 
			 	
		});
		
	});
</script>
</html>