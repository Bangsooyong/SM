<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SHOP</title>

<style>
ul.tabs {
    margin: 0;
    padding: 0;
    float: left;
    list-style: none;
    height: 32px;
    border-bottom: 1px solid #eee;
    border-left: 1px solid #eee;
    width: 100%;
    font-family:"dotum";
    font-size:12px;
}
ul.tabs li {
    float: left;
    text-align:center;
    cursor: pointer;
    width:30%;
    height: 31px;
    line-height: 31px;
    border: 1px solid #eee;
    border-left: none;
    font-weight: bold;
    background: #fafafa;
    overflow: hidden;
    position: relative;
}
ul.tabs li.active {
    background: #FFFFFF;
    border-bottom: 1px solid black;
}
.tab_container {
    border: 1px solid #eee;
    border-top: none;
    clear: both;
    float: left;
    width: 90%;
    overflow: hidden;
    background: #FFFFFF;
}
.tab_content {
    padding: 5px;
    font-size: 12px;
    display: none;
}
.tab_container .tab_content ul {
    width:100%;
    margin:0px;
    padding:0px;
}
.tab_container .tab_content ul li {
    padding:5px;
    list-style:none
}
;
 #container {
    width: 100%;
    margin: 0 auto;
}
</style>
</head>
<body>
	<a href="#">������ ȸ������</a> <!-- #�κп��� RequestMapping�ؼ� ��� -->
	<a href="#">�Ǹ��� ȸ������</a><br/><br/>
	<a href="#">������ �α���</a>
	<a href="#">�Ǹ��� �α���</a><br/><br/>
	<a href="#">������ ����������</a>
	<a href="#">�Ǹ��� ����������</a>
	<a href="admin/admin_mypage">������ ����������</a><br/><br/>
	<a href="admin/seller_admin_main">�Ǹ��� ��</a><br/><br/>
	<a href="#">��ٱ���</a><br/><br/>
	<a href="help/mainlist">������</a><br/><br/>
	<a href="board/qna">��ǰQNA</a>
	<a href="BoardRev/review">��ǰ�ı�</a><br/><br/>
	<a href="detailqr">Q&A and Review</a><br/><br/> 
	
	<div id="container">
    <ul class="tabs">
        <li class="active" rel="tab1">Q&A</li>
        <li rel="tab2">��ǰ�ı�</li>
        <li rel="tab3">��ǰ����</li>
    </ul>
    <div class="tab_container">
        <div id="tab1" class="tab_content">
            <ul>
                <li><a href="#">�̰��� �� ��° ����</a>
                </li>
                <li><a href="#">�̰��� �� ��° ����</a>
                </li>
                <li><a href="#">�̰��� �� ��° ����</a>
                </li>
            </ul>
        </div>
        
        <!-- #tab1 -->
        <div id="tab2" class="tab_content">��ǰ�ı� �Դϴ�.</div>
        <!-- #tab2 -->
        <div id="tab3" class="tab_content">��ǰ ���� �Դϴ�.</div>
        <!-- #tab3 -->
    </div>
    <!-- .tab_container -->
</div>
<!-- #container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$(function () {

	    $(".tab_content").hide();
	    $(".tab_content:first").show();

	    $("ul.tabs li").click(function () {
	        $("ul.tabs li").removeClass("active").css("color", "#333");
	        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
	        $(this).addClass("active").css("color", "darkred");
	        $(".tab_content").hide()
	        var activeTab = $(this).attr("rel");
	        $("#" + activeTab).fadeIn()
	    });
	});	
})
</script>
	
</body>
</html>