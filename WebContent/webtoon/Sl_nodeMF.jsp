<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>title</title>
<!-- Bootstrap cdn 설정 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<!-- carousel를 구성할 영역 설절 -->
<div style="width: 600px;margin: 600px;">
<!-- carousel를 사용하기 위해서는 class에 carousel와 slide 설정한다. -->
<!-- carousel는 특이하게 id를 설정해야 한다.-->
<div id="carousel-example-generic" class="carousel slide" >
<!-- carousel의 지시자 -->
<!-- 지시자라고는 하는데 ol태그의 class에 carousel-indicators를 넣는다. -->
<ol class="carousel-indicators">
<!-- li는 이미지 개수만큼 추가하고 data-target은 carousel id를 가르킨다. -->
<!-- data-slide-to는 순서대로 0부터 올라가고 0은 active를 설정한다. -->
<!-- 딱히 이 부분은 옵션별로 설정하게 없다. -->
<!-- 
<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
<li data-target="#carousel-example-generic" data-slide-to="1"></li>
<li data-target="#carousel-example-generic" data-slide-to="2"></li>
<li data-target="#carousel-example-generic" data-slide-to="3"></li>
<li data-target="#carousel-example-generic" data-slide-to="4"></li>
 -->
</ol>
<!-- 실제 이미지 아이템 -->
<!-- class는 carousel-inner로 설정하고 role은 listbox에서 설정한다. -->
<div class="carousel-inner">
<!-- 이미지의 개수만큼 item을 만든다. 중요한 포인트는 carousel-indicators의 li 태그 개수와 item의 개수는 일치해야 한다. -->
<div class="item active">
<!-- 아미지 설정- -->
<img src="https://tistory2.daumcdn.net/tistory/1041549/skin/images/nowonbuntistory.png" style="width:100%">

<!-- 캡션 설정 (생략 가능) -->
<!-- 글자 색은 검은색 -->
<div class="carousel-caption" style="color:black;">
</div>

</div>
<div class="item">
<img style="width:100%">
<div class="carousel-caption" style="color:black;">
2 페이지
</div>
</div>
<div class="item">
<img style="width:100%">
<div class="carousel-caption" style="color:black;">
3 페이지
</div>
</div>
<div class="item">
<img style="width:100%">
<div class="carousel-caption" style="color:black;">
4 페이지
</div>
</div>
<div class="item">
<img style="width:100%">
<div class="carousel-caption" style="color:black;">
5 페이지
</div>
</div>
</div>
<!-- 왼쪽 화살표 버튼 -->
<!-- href는 carousel의 id를 가르킨다. -->
<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
<!-- 왼쪽 화살표 -->
<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
</a>
<!-- 오른쪽 화살표 버튼 -->
<!-- href는 carousel의 id를 가르킨다. -->
<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
<!-- 오른쪽 화살표 -->
<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
</a>
</div>
</div>
<script>
$(function(){
// 이미지 설정
$("img").attr("src","data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAMSURBVBhXY/j//z8ABf4C/qc1gYQAAAAASUVORK5CYII=");
// 이미지 슬라이드 설정
$('#carousel-example-generic').carousel({
// 순환 설정
interval: false,
// 순환을 정지시킨다.
}).carousel('pause');
});
// 이미지 슬라이드 순환을 개시
$("#carousel_cycle").on("click", function() {
$('#carousel-example-generic').carousel('cycle');
});
// 이미지 슬라이드 순환을 정지
$("#carousel_pause").on("click", function() {
$('#carousel-example-generic').carousel('pause');
});
// 이미지 슬라이드 이동
$("#carousel_move").on("click", function() {
var num = Number($("#carousel_number").val()) - 1;
$('#carousel-example-generic').carousel(num);
});
// 이미지 슬라이드 전 페이지 이동
$("#carousel_prev").on("click", function() {
$('#carousel-example-generic').carousel('prev');
});
// 이미지 슬라이드 다음 페이지 이동
$("#carousel_next").on("click", function() {
$('#carousel-example-generic').carousel('next');
});
$('#carousel-example-generic').on('slide.bs.carousel', function () {
// 슬라이드 인스턴스 메서드가 호출되면 호출된다.
});
$('#carousel-example-generic').on('slid.bs.carousel', function () {
// 회전식 슬라이드가 완료되면 호출된다.
});
</script>
</body>
</html>



