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

.pageLinks li {
	display: inline;
}
</style>

</head>
<body>

	<h3>
		<a href="/shop">Ȩ</a>
	</h3>
	<a href="JavaScript:window.history.back()">���� ������</a>
	<a href="JavaScript:window.location.reload()">������ ���ΰ�ħ</a><br><br> 
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

		<h3>��ü �Ǹ� ����</h3>
		<table>
			<tr>
				<th>�ֹ���ȣ</th>
				<th>�ֹ���¥&emsp;</th>
				<th>��ǰ��(�ɼ�)&emsp;</th>
				<th>�ǸŰ���&emsp;</th>
				<th>�Ǹ���&emsp;</th>
				<th>������&emsp;</th>
				<th>�ֹ�����&emsp;</th>
			</tr>
			<tr>
				<td></td>
			</tr>
			<c:forEach var="list" items="${list }">
				<tr>
					<td>${list.buy_no }</td>
					<td><fmt:formatDate value="${list.buy_date }"
							pattern="yyyy�� MM�� dd��" />&emsp;&emsp;</td>
					<td>${list.p_name }&emsp;(${list.o_cont })</td>
					<td>${list.p_price }��</td>
					<td>�Ǹ���ID&emsp;</td>
					<td>${list.b_id }&emsp;</td>
					<td>��ۿϷ�</td>
				</tr>
			</c:forEach>
		</table>


		<ul class="pageLinks">
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
			frm.attr('action', 'buyf');
			// ����¡ ȭ���� ó���ϴ� Controller�� method(��û ó�� ���)
			frm.attr('method', 'get');
			// �� ����� ������ ����
			frm.submit();
		});
	});
</script>
</html>