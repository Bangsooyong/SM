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

#div1 {
	float: left;
	margin-right: 100px;
	height: 500px;
}

#div2 {
	margin-bottom: 20px;
}

li {
	list-style-type: none;
}

caption {
	margin-bottom: 10px;
}
</style>

</head>
<body>
	
	<a href="JavaScript:window.history.back()">���� ������</a>
	
	<a href="JavaScript:window.location.reload()">������ ���ΰ�ħ</a><br><br> 
<!-- 	<h1>
		<a href="admin_mypage">������������</a>
	</h1> -->
	<div id="div1">
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

	<div id="div2">
		<table>
			<tr>
				<th>[���ο� �ֹ�����]</th>
				<th>[������ �Ǹ� ����]</th>
				<th>[�Ǹ��� ���� ��û]</th>
				<th>[�ǸŸ� ���� ��û]</th>
			</tr>
			<tr style="font-size: 35px;">
				<td id = "newReq" onMouseover="this.style.color='pink';"
					onMouseout="this.style.color='blue';"
				style="text-align: center; color: blue;
				text-decoration: underline; ">${reqSize}��</td>
				
				<td id="buyTo" onMouseover="this.style.color='pink';" 
				onMouseout="this.style.color='blue';"			
				style="text-align: center; color: blue; 
				text-decoration: underline; ">${buyTodaySize}��</td>
				
				<td id="sel_ACC" onMouseover="this.style.color='pink';" 
				onMouseout="this.style.color='blue';"			
				style="text-align: center; color: blue; 
				text-decoration: underline; ">${accSize}��</td>
				
				<td id="p_Acc" onMouseover="this.style.color='pink';" 
				onMouseout="this.style.color='blue';"			
				style="text-align: center; color: blue; 
				text-decoration: underline; ">${pSize}��</td>
			</tr>
		</table>
	</div>

	<div id="maindiv">
		<table id="totalReq">
			<caption><b>�ֹ� ��û ����(�ֱ� 5��)</b></caption>
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
					<td>${list.s_id }&emsp;</td>
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
		
		<table id = "newTotalReq" style="display: none;">
			<caption><b>[���ο� �ֹ� ��û ����]</b></caption>
			<tr>
				<th>�ֹ���ȣ</th>
				<th>�ֹ���¥</th>
				<th>��ǰ��(�ɼ�)</th>
				<th>�Ǹ���</th>
				<th>������</th>
				<th>�ֹ�����</th>
			</tr>
			<c:forEach var="listReq" items="${listBuyReq }">
				<tr>
					<td>${listReq.buy_no }</td>
					<td><fmt:formatDate value="${listReq.buy_date }"
							pattern="yyyy�� MM�� dd��" />&emsp;</td>
					<td>${listReq.p_name }&emsp;(${listReq.o_cont })</td>
					<td>${list.s_id }&emsp;</td>
					<td>${listReq.b_id }&emsp;</td>
					<c:if test="${listReq.buy_status eq '0' }">
					<td>�Աݴ��</td>
					</c:if>
					<c:if test="${listReq.buy_status eq '1' }">
					<td>����Ȯ����</td>
					</c:if>
					<c:if test="${listReq.buy_status eq '2' }">
					<td>�����Ϸ�</td>
					</c:if>
					<c:if test="${listReq.buy_status eq '3' }">
					<td>����غ�</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>

		<br />
		<br />


		<table id="buySuc">
			<caption><b>�ֱ� �Ǹ� �Ϸ� ����(�ֱ� 5��)</b></caption>
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
					<td>${list.s_id }&emsp;</td>
					<td>${list.b_id }&emsp;</td>
					<td>��ۿϷ�</td>
				</tr>
			</c:forEach>
		</table>
		
		<table id = "buyToday" style="display: none;">
			<caption><b>[������ �Ǹ� ����]</b></caption>
			<tr>
				<th>�ֹ���ȣ</th>
				<th>�ֹ���¥</th>
				<th>��ǰ��(�ɼ�)</th>
				<th>�Ǹ���</th>
				<th>������</th>
				<th>�ֹ�����</th>
			</tr>
			<c:forEach var="listReq" items="${buyToday }">
				<tr>
					<td>${listReq.buy_no }</td>
					<td><fmt:formatDate value="${listReq.buy_date }"
							pattern="yyyy�� MM�� dd��" />&emsp;</td>
					<td>${listReq.p_name }&emsp;(${listReq.o_cont })</td>
					<td>${list.s_id }&emsp;</td>
					<td>${listReq.b_id }&emsp;</td>
					<c:if test="${listReq.buy_status eq '5' }">
					<td>��ۿϷ�</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		
		<table id = "sellerAccess" style="display: none;">
			<caption><b>[�Ǹ��� ���� ��û]</b></caption>
			<tr>
				<th>ȸ����ȣ</th>
				<th>�Ǹ��� ID</th>
				<th>������</th>
				<th>�̸���</th>
				<th>���� ����</th>
			</tr>
			<c:forEach var="svo" items="${listAcc }">
				<tr>
					<td>${svo.s_no}</td>
					<td>${svo.s_id}&emsp;</td>
					<td><fmt:formatDate value="${svo.s_reg }"
							pattern="yyyy-MM-dd HH:mm:ss" />&emsp;</td>
					<td>${svo.s_email}&emsp;</td>
					<td><c:if test="${svo.s_acc == 0 }">�̽���</c:if>
						<c:if test="${svo.s_acc == 1 }">����</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		
			<table id = "productAccess" style="display: none;">
			<caption><b>[�ǸŹ� ���� ��û]</b></caption>
			<tr>
				<th>ȸ����ȣ</th>
				<th>�Ǹ���</th>
				<th>��ǰ��ȣ</th>
				<th>��ǰ��(�ɼ�)</th>
				<th>���ο���</th>
			</tr>
			<c:forEach var="pvo" items="${pAcc }">
			<c:forEach var="svo" items="${sel_id }">
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
				
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
		
		$('#newReq').click(function () {
			$('#maindiv').children().hide();
			$('#newTotalReq').show();
		})
		
		$('#buyTo').click(function () {
/* 			$('#totalReq').hide();
			$('#buySuc').hide();
			$('#buyToday').show(); */
			$('#maindiv').children().hide();
			$('#buyToday').show();
		})
		
		$('#sel_ACC').click(function() {
			$('#maindiv').children().hide();
			$('#sellerAccess').show();	
		})

		$('#p_Acc').click(function() {
			$('#maindiv').children().hide();
			$('#productAccess').show();	
		})
		
		
	})
	</script>

</body>
</html>