<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert QnA</title>
</head>
<body>

	<form action="insertQnA" method="POST">
		<table>
			<tr>
				<th scope="row">���� ���� &emsp;</th>

				<td><label for="qna_type0"> <input type="radio"
						name="qna_type" id="qna_type0" value="0" /> ��ǰ
				</label>

				<label for="qna_type1"> <input type="radio"
						name="qna_type" id="qna_type1" value="1" /> ���
				</label>

				<label for="qna_type2"> <input type="radio"
						name="qna_type" id="qna_type2" value="2" /> ��ǰ/���
				</label>

				<label for="qna_type3"> <input type="radio"
						name="qna_type" id="qna_type3" value="3" /> ��ȯ/����
				</label>

				<label for="qna_type4"> <input type="radio"
						name="qna_type" id="qna_type4" value="4" /> ��Ÿ
				</label>
				
				</td>
			</tr>

			<tr>
				<th scope="row">���� ���� &emsp;</th>
				<td><textarea rows="10" cols="80" id = "qna_cont" name="qna_cont"></textarea></td>
			</tr>

			<tr>
				<th scope="row">�亯���� ���� &emsp;</th>
				<td><input type="text" id="qnaImail" name="b_email"
					placeholder="�̸����ּ� �Է�" />b_id�� �̿��� email�ּҸ� select�޾ƿ� �ڵ��Է±��..�����ؾ���</td>
			</tr>

		</table>
		
<!-- 		<input type="hidden" name="qna_no" value="0" /> -->
		<input type="hidden" name="b_id" value="buyer1" />
		<input type="hidden" name="p_no" value="0" />
<!-- 		<input type="hidden" name="qna_reply" value = "0" /> -->
		
		<div>
			<input type="submit" value="���">
		</div>
	</form>
</body>
</html>