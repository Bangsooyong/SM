<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>HelpDesk</title>

<style>
table, th, td {
    border-bottom: 1px solid gray;
    border-collapse: collapse;
}
th {
    background-color: lightpink;
    border-left: 1px solid white;
}
</style>

</head>
<body>
<h2>고객센터 게시판</h2>

<table>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성 시간</th>
    </tr>
    
    <tr>
    	<td></td>
    </tr>
    
<%--     <c:forEach var="vo" items="${boardList }">
    <tr>
        <td>${vo.bno }</td>
        <td><a href="detail?bno=${vo.bno }">${vo.title }</a></td>
        <td>${vo.userid }</td>
        <td>
	        <fmt:formatDate value="${vo.regdate }" 
	            pattern="yyyy-MM-dd HH:mm:ss"/>
        </td>
    </tr>
    </c:forEach> --%>
</table>


<nav>
    <ul>
        <li style="list-style-type: none;"><a href="register">글쓰기</a></li>
    </ul>
</nav>

<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(document).ready(function() {
	if ('${insert_result}' == 'success') {
		alert('새 글이 정상적으로 등록됐습니다.');
	} else if ('${insert_result}' == 'fail') {
		alert('새 글 등록 실패!');
	}
	
	if ('${update_result}' == 'success') {
        alert('${bno}번 글이 수정됐습니다.');
    } else if ('${insert_result}' == 'fail') {
        alert('${bno}번 글 수정 실패!');
    }
	
	if ('${delete_result}' == 'success') {
        alert('${bno}번 글이 삭제됐습니다.');
    } else if ('${insert_result}' == 'fail') {
        alert('${bno}번 글 삭제 실패!');
    }
	
});
</script>

</body>
</html>