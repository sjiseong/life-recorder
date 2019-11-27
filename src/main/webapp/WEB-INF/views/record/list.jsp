<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert Title here</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<style>
.no-transition {
  -webkit-transition: height 0.01s;
  -moz-transition: height 0.01s;
  -ms-transition: height 0.01s;
  -o-transition: height 0.01s;
  transition: height 0.01s;
}

.triangle {
	width: 0;
	border: 5rem solid black;
	border-top-width: 0px !important;
	border-right-color: transparent;
	border-left-color: transparent;
}

.navbar {
	position: fixed;
	width: 10rem;
	height: 100vh !important;
	left: 0;
	right: 0;
	background-color: #f1f1f1;
	z-index: 1000;
}

#show-toggle {
	float: left !important;
	margin: 2px 0;
	z-index: 200;
}

#hide-toggle {
	margin-right: 35px;
}

.mynav-header {
	margin : 20px 0;
}

.mynav-brand {
	font-family: 'Amatic SC', cursive;
	color: black;
	font-size: 30px;
	text-align: center;
	font-weight: 600;
	width: 100%;
}

.mynav-hr {
	border: 1px gray solid;
	width: 90%;
	margin: 10px auto;
}

.nav-username {
	font-size: 1.5rem; 
	padding: 8px 10px; 
	font-weight: 600;
	text-align: center;
	vertical-align: middle;
}

.nav-username span {
	margin-top: 5px;
}

.mynav-nav {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 100%;
}

.nav-link {
	display: block;
	color: #000;
	padding: 8px 10px;
	text-decoration: none !important;
	font-size: 1.5rem;
}

.nav-link:hover {
	background-color: #555;
	color: white;
}

.nav-link span, .nav-username span{
	display: block;
}

.navbar-collapse {
	padding: 0;
}

/* 페이지 귀속 */
* {
	box-sizing: border-box !important;
}

.content {
	background-color: white;
	font-size: 0;
	position: relative;
	width: 100%;
	float: left;
	padding: 0 3%;
	margin-top: 50px;
}

.record {
	position: absolute;
	margin-bottom: 20px;
	font-size: 0;
	overflow: hidden;
	width: 47%;
	background-color: white;
}

.record a {
	color: black;
	text-decoration: none;
}

.record-block {
	height: 2160px; /* 3600 * 24 / 40000 */
}

.record-content {
	float: left;
	width: 90%;
	border: 3px solid black;
	font-size: 1.5rem;
	padding: 10px;
}

.record-content:hover {
	background-color: #f1f1f1;
}

.record-line {
	float: left;
	width: 10%;
	position: absolute;
	height: 100%;
	right: 0;
}

.record-idea {
	left: 50%;
}

.record-idea .record-content {
	float: right;
}

.record-idea .record-line {
	left: 0;
}

.record-hr {
	position: relative;
	border: 1.5px solid black;
	margin: 0;
	top: 50%;
	/* transform:translate(-0,50%); */
}

.record-content>[class^=record-] {
	overflow: hidden;
	text-overflow: ellipsis;
	word-break: break-all;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	padding: 0;
}

.record-title {
	-webkit-line-clamp: 2;
	max-height: 4rem;
	font-size: 1.8rem;
	line-height: 2rem;
	font-weight: bold;
}

.record-summary {
	width: 100%;
	max-height:6rem;
	font-size: 1.5rem;
	line-height: 2rem;
	white-space: pre-line;
	margin-bottom: 0;
}

.record-write-time {
	margin-top: 10px;
	margin-bottom: 0;
	display: none !important;
}

.timeline {
	position: fixed;
	width: 1rem;
	height: 100vh;
	left: 50%;
	transform: translate(-50%, 0);
	background-color: black;
	z-index: 100;
}

.timeline-header {
	font-size: 0;
	position: fixed;
	width: 100%;
	z-index: 120;
	background-color: white;
	height: 5rem;
}

[class^=timeline-header-] {
	float: left;
	display: inline-block;
	position: absolute;
	height: 100%;
}

.timeline-header-left, .timeline-header-right {
	font-size: 20px;
}

.timeline-header-left {
	width: 100%;
}

.timeline-header-right {
	right: 0;
	width: 0;
}

.timeline-header-arrow {
	z-index: 110;
	left: 50%;
	transform: translate(-50%, 0);
	border-width: 0;
}

.timeline-header-element {
	margin: 0;
	line-height: 5rem;
}

#time-panel {
	width: 100%;
	text-align: center;
	transform: translate(-37.5px, 0);
}

@media (min-width: 640px) {
	.content {
		padding : 0 7%;
	}
	.record {
		width: 43%;
	}
	.record-content {
		width: 80%;
	}
	.record-line {
		width: 20%;
	}
	.timeline {
		width: 2rem;
	}
	.timeline-header-left, .timeline-header-right {
		width: calc(50% - 5rem);
	}
	.timeline-header-arrow {
		border-width: 5rem;
	}
	.record-write-time {
		display: block !important;
	}
	#time-panel {
		transform: translate(-27.5px, 0)
	}
}

@media (min-width: 768px) {
	#time-panel {
		transform: none;
	}
}

@media (min-width : 768px) and (max-width : 1024px) {
	body {
		padding-top: 0;
		padding-left: 10rem;
	}
	.timeline {
		left: calc(50% + 5rem);
	}
	.timeline-header {
		width: calc(100% - 10rem);
	}
}

@media (min-width : 1024px) {
	body {
		padding-top: 0;
		padding-left: 20rem;
	}
	.timeline {
		width: 2.5rem;
		left: calc(50% + 10rem);
	}
	.timeline-header {
		width: calc(100% - 20rem);
	}
	#time-panel {
		font-size: 30px;
	}
	.navbar {
		width: 20rem;
	}
	.nav-link, .nav-username {
		padding: 8px 20px;
		font-size: 2rem;
	}
	.nav-link span, .nav-username span{
		display: inline;
	}
	.nav-username {
		text-align: left !important;
	}
	.mynav-brand {
		font-size: 40px;
	}
}

.record:hover {
	z-index: 10;
}
</style>
<c:set var="curTime" value="<%=new java.util.Date()%>" />
<c:set var="curTimeMillis" value="${curTime.time }" />
<sec:authentication var="userId" property="principal.username" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/sidebar.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="test" style="position: fixed; font-size: 15px; z-index: 20000; background-color: white">
			
		</div>
		<div class="row">
			<div class="timeline"></div>
			<div class="timeline-header">
				<div class="timeline-header-left">
					<button type="button" id="show-toggle" class="navbar-toggle" data-toggle="collapse" data-target="#myNav" style="border:none;">
						<i class="fas fa-bars"></i>
					</button>
					<p class="timeline-header-element" id="time-panel"></p>
				</div>
				<div class="timeline-header-arrow triangle"></div>
				<div class="timeline-header-right">
					<form>
						<div class="form-group input-group">
							<input class="form-control timeline-header-element" type="date"
								name="date" />
							<div class="input-group-btn">
								<button class="btn " type="button" onclick="moveTo(this.form)">클릭</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="content">
				<div class="record-block">
					<c:forEach items="${recordList }" var="record">
						<fmt:parseDate var="writeTime" value="${record.write_time }"
							pattern="yyyy-MM-dd HH:mm:sss"></fmt:parseDate>
						<fmt:parseNumber var="distance"
							value="${(curTimeMillis - writeTime.time) / 40000}"
 							integerOnly="true"></fmt:parseNumber>
						<div
							class="record <c:if test="${ record.type == 2}">record-idea</c:if>"
							style="top:${distance}px;">
							<a href="/record/view?id=${record.id }">
								<div class="record-content">
									<p class="record-title">${record.title }</p>
									<p class="record-summary">${record.summary }</p>
									<p class="record-write-time">${record.write_time }</p>
								</div>
							</a>
							<div class="record-line">
								<hr class="record-hr" />
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<jsp:include page="/WEB-INF/views/user/signout.jsp"></jsp:include>
	<script>
		$timePanel = $("#time-panel");
		var scrollBottom;
		var scrollTop;
		var standardTimeMillis = ${curTimeMillis};
		var start = 1;
		var end = 0;
		var $content = $(".content");
		var mobileBarHeight = 0;

		/* 시간대 이동 */
		function moveTo(f) {
			var arr = f.date.value.split('-');
			standardTimeMillis = new Date(arr[0], arr[1], arr[2]).getTime();
			console.log(standardTimeMillis);
		}

		//자바 스크립트 Date를 Time Panel에 노출되는 시간으로 포맷
		function formatDate(date) {
			var arr = new Array(date.getFullYear(), date.getMonth() + 1, date
					.getDate(), date.getHours(), date.getMinutes(), date
					.getSeconds());
			var ap = 'AM';
			if (arr[3] > 12 || arr[3] == 0) {
				ap = 'PM';
				arr[3] %= 12;
			}
			arr.forEach(function(item, index, array) {
				if (item < 10) {
					array[index] = '0' + item;
				}
			});
			return arr[0] + ' ' + arr[1] + ' ' + arr[2] + ' ' + ap + ' '
					+ arr[3] + ':' + arr[4] + ':' + arr[5];
		}

		$(document).ready(function() {
			/* nav 노출 */
			checkWidth();
			
			/* 스크롤, 시간 패널 */
			$timePanel.text(formatDate(new Date(standardTimeMillis)));
			scrollBottom = $(document).height() - $(window).height();
			scrollTop = $(window).scrollTop();
			checkScroll(scrollTop);
			
			/* 모바일 여부 확인 */
			var filter = "win16|win32|win64|mac|macintel";
			if (filter.indexOf(navigator.platform.toLowerCase()) < 0) {
				//MOBILE         
				mobileBarHeight = 60;
			}
		});

		$(window).resize(checkWidth);
		
		//nav 노출
		function checkWidth() {
			var width = $(window).innerWidth();
			if ( width < 768) {
				$('.navbar').removeClass('in');
			} else {
				$('.navbar').addClass('in');
			}
		}
		
		//스크롤링
		$(document.body).on('touchmove', onScroll); // for mobile
		$(window).on('scroll', onScroll); 
		
		// callback
		function onScroll(){ 
			scrollTop = $(window).scrollTop();
			scrollBottom = $(document).height() - $(window).innerHeight() - mobileBarHeight - 100; // 100px 전에 노출  
			var date = new Date(standardTimeMillis - scrollTop * 40000);
			$timePanel.text(formatDate(date));
			checkScroll(scrollTop);
		}
		
		function checkScroll(scrollTop) {
			if (scrollBottom <= scrollTop) {
				getMoreRecord();
			}
		}

		//레코드 블록 추가
		function getMoreRecord() {
			start += 1;
			end += 1;
			$.ajax({
				url : 'record/getRecord',
				type : 'post',
				data : {
					userId : '${userId}',
					standardTimeMillis : standardTimeMillis,
					start : start,
					end : end
				},
				dataType:"json",
				beforeSend : function(xhr) {
					xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
				},
				success : function(data) {
					if (data) { 
						var $block = $('<div class="record-block"></div>');
						data.forEach(function(item) {
							var $record = $('<div class="record"></div>');
							var distance = (standardTimeMillis - (new Date(item.write_time).getTime())) / 40000;
							$record.css('top', distance+'px');
							if(item.type == 2) {
								$record.addClass('record-idea');
							}
							$record.append(
								`<a href="/record/view?id=` + item.id + `"> 
									<div class="record-content">
										<p class="record-title">` + item.title + `</p>
										<p class="record-summary">` + item.summary + `</p>
										<p class="record-write-time">` + item.write_time + `</p>
									</div>
								</a>
								<div class="record-line">
									<hr class="record-hr" />
								</div>`
							);
							$block.append($record);
						});
						$content.append($block);
						scrollBottom = $(document).height() - $(window).height();
					}
				}
			});
		}
	</script>
</body>
</html>
