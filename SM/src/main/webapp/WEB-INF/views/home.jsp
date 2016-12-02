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
	<a href="#">구매자 회원가입</a> <!-- #부분에서 RequestMapping해서 사용 -->
	<a href="#">판매자 회원가입</a><br/><br/>
	<a href="#">구매자 로그인</a>
	<a href="#">판매자 로그인</a><br/><br/>
	<a href="#">구매자 마이페이지</a>
	<a href="#">판매자 마이페이지</a>
	<a href="admin/admin_mypage">관리지 마이페이지</a><br/><br/>
	<a href="admin/seller_admin_main">판매자 샵</a><br/><br/>
	<a href="#">장바구니</a><br/><br/>
	<a href="help/mainlist">고객센터</a><br/><br/>
	<a href="board/qna">상품QNA</a>
	<a href="BoardRev/review">상품후기</a><br/><br/>
	<a href="detailqr">Q&A and Review</a><br/><br/> 
	
	<div id="container">
    <ul class="tabs">
        <li class="active" rel="tab1">Q&A</li>
        <li rel="tab2">상품후기</li>
        <li rel="tab3">제품정보</li>
    </ul>
    <div class="tab_container">
        <div id="tab1" class="tab_content">
            <ul>
                <li><a href="#">이것은 두 번째 탭의</a>
                </li>
                <li><a href="#">이것은 두 번째 탭의</a>
                </li>
                <li><a href="#">이것은 두 번째 탭의</a>
                </li>
            </ul>
        </div>
        
        <!-- #tab1 -->
        <div id="tab2" class="tab_content">상품후기 입니다.</div>
        <!-- #tab2 -->
        <div id="tab3" class="tab_content">제품 정보 입니다.</div>
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