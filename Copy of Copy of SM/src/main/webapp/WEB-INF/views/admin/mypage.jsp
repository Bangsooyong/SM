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
		<a href="/shop">Ȩ</a>
	</h3>
	<h1>
		<a href="mypage">������������</a>
	</h1>
	<div>
		<h3>�ǸŰ���</h3>
		<ol>
			<li><a href="buyr">��ü �ֹ� ��û ����</a></li>
			<li><a href="buyf">��ü �Ǹ� ����</a></li>
			<li><a href="total">��ü �Ǹ� ���</a></li>
		</ol>

		<h3>ȸ������</h3>
		<ol>
			<li><a href="#">�Ǹ��� ���� ���� ��û ����</a></li>
			<li><a href="#">�ǸŹ� ��� ����</a></li>
			<li><a href="#">ȸ�� ���</a></li>
		</ol>

	</div>

	<div>
		<a>[���ο� �ֹ� ����]</a> <a>[����� �Ǹ� ����]</a> <a>[���ο� �Ǹ���]</a> <a>[���ο�
			�ǸŸ�]</a> <br /> <a href="#">������ �ֹ� ���� Ŭ��</a> <a href="#">������ �Ǹ� ���� Ŭ��</a>
		<a href="#">���ο� �Ǹ��� Ŭ��</a> <a href="#">���ο� �ǸŸ� Ŭ��</a>

		<h3>�ֱ� �ֹ� ��û ����(�ֱ� 5��)</h3>
		<table>
			<tr>
				<th>�ֹ���ȣ</th>
				<th>�ֹ���¥</th>
				<th>��ǰ��(�ɼ�)</th>
				<th>�Ǹ���</th>
				<th>������</th>
				<th>�ֹ�����</th>
			</tr>
			<c:forEach var="list" items="${list2 }">
				<tr>
					<td>${list.buy_no }</td>
					<td><fmt:formatDate value="${list.buy_date }"
							pattern="yyyy�� MM�� dd��" />&emsp;</td>
					<td>${list.p_name }&emsp;(${list.o_cont })</td>
					<td>�Ǹ��� ID&emsp;</td>
					<td>${list.b_id }&emsp;</td>
					<c:if test="${list.buy_status eq '0' }">
					<td>�Աݴ��</td>
					</c:if>
					<c:if test="${list.buy_status eq '1' }">
					<td>����Ȯ����</td>
					</c:if>
					<c:if test="${list.buy_status eq '2' }">
					<td>�����Ϸ�</td>
					</c:if>
					<c:if test="${list.buy_status eq '3' }">
					<td>����غ�</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>

		<br />
		<br />

		<h3>�ֱ� �Ǹ� �Ϸ� ����(�ֱ� 5��)</h3>
		<table>
			<tr>
				<th>�ֹ���ȣ</th>
				<th>�ֹ���¥</th>
				<th>��ǰ��(�ɼ�)</th>
				<th>�Ǹ���</th>
				<th>������</th>
				<th>�ֹ�����</th>
			</tr>
			<c:forEach var="list" items="${listBuyVO }">
				<tr>
					<td>${list.buy_no }</td>
					<td><fmt:formatDate value="${list.buy_date }"
							pattern="yyyy�� MM�� dd��" />&emsp;</td>
					<td>${list.p_name }&emsp;(${list.o_cont })</td>
					<td>�Ǹ���ID&emsp;</td>
					<td>${list.b_id }&emsp;</td>
					<td>��ۿϷ�</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>