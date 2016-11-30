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
	
	<input type="button" value="Search"> <input type="text">


	<table>
		<tr>
			<th>ȸ����ȣ</th>
			<th>�Ǹ���</th>
			<th>��ǰ��ȣ</th>
			<th>��ǰ��(�ɼ�)</th>
			<th>���ο���</th>
		</tr>
		<c:forEach var="pvo" items="${prodcutList }">
			<c:forEach var="svo" items="${sellerList }">
		
			<tr>
				<td>${svo.s_no}</td>
				<td>${pvo.s_id}</td>
				<td>${pvo.p_no }</td>
				<td>${pvo.p_name}<!--�ɼ����� �߰�������� ������ �ڵ� ���� --></td>
				<td><c:if test="${pvo.p_acc == 0 }">�̽���</c:if>
					<c:if test="${pvo.p_acc == 1 }">����</c:if>
				</td>
			</tr>
			</c:forEach>
		</c:forEach>
	</table>


	</div>





</body>
</html>