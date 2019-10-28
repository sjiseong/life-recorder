<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<style>
.triangle {
	width: 0;
	border: 5rem solid black;
	border-top-width: 0px;
	border-right-color: transparent;
	border-left-color: transparent;
}

.navbar {
	position: fixed;
	width: 20rem;
	height: 100vh;
	left: 0;
	right: 0;
	background-color: blue;
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
	padding: 0 7%;
}

.record {
	position: absolute;
	margin-bottom: 20px;
	font-size: 0;
	overflow: hidden;
	width: 43%;
	background-color: white;
}

.record-content {
	float: left;
	width: 80%;
	border: 2px solid black;
	font-size: 1.5rem;
	padding: 10px;
}

.record-line {
	float: left;
	width: 20%;
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
	border: 2px solid black;
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
}

.record-title {
	-webkit-line-clamp: 2;
	max-height: 4rem;
	font-size: 1.8rem;
	line-height: 2rem;
	font-weight: bold;
}

.record-summary {
	-webkit-line-clamp: 3;
	max-height: 6rem;
	font-size: 1.5rem;
	line-height: 2rem;
	margin-bottom: 0;
}

.timeline {
	position: fixed;
	width: 3rem;
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
	width: calc(50% - 5rem);
	font-size: 3rem;
}

.timeline-header-right {
	right: 0;
}

.timeline-header-arrow {
	z-index: 110;
	left: 50%;
	transform: translate(-50%, 0);
}

.timeline-header-element {
	margin: 0;
	line-height: 5rem;
}

@media ( min-width : 992px) {
	body {
		padding-top: 0;
		padding-left: 20rem;
	}
	.timeline {
		left: calc(50% + 10rem);
	}
	.timeline-header {
		width: calc(100% - 20rem);
	}
}

.record:hover {
	z-index: 10;
}
</style>
</head>
<body>
	<c:set var="curTime" value="<%=new java.util.Date()%>" />
	<c:set var="curTimeMillis" value="${curTime.time }" />
	<nav class="navbar">
		<h1>${user.name }</h1>
		<button type="button" onclick="javascript:signout()">로그아웃</button>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<div class="timeline"></div>
			<div class="timeline-header">
				<div class="timeline-header-left">
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
							<div class="record-content">
								<p class="record-title">${record.title }</p>
								<p class="record-summary">${record.summary }</p>
								<p>${record.write_time }</p>
							</div>
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
	<jsp:include page="user/signout.jsp"></jsp:include>
	<script>
		$timePanel = $("#time-panel");
		var scrollBottom;
		var standardTimeMillis = ${curTimeMillis};
		var start = 1;
		var end = 0;

		/* 시간대 이동 */
		function moveTo(f) {
			var arr = f.date.value.split('-');
			standardTimeMillis = new Date(arr[0], arr[1], arr[2]).getTime();
			console.log(standardTimeMillis);
		}

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
			$timePanel.text(formatDate(new Date(standardTimeMillis)));
			scrollBottom = $(document).height() - $(window).height();
		});

		//스크롤링
		$(window).scroll(function() {
			var scrollTop = $(window).scrollTop();
			var date = new Date(standardTimeMillis - scrollTop * 40000);
			$timePanel.text(formatDate(date));
			if (scrollBottom <= scrollTop) {
				getMoreRecord();
			}
		});

		function getMoreRecord() {
			start += 1;
			end += 1;
			$.ajax({
				url : 'record/getRecord',
				type : 'post',
				data : {
					userId : '${user.id}',
					standardTimeMillis : standardTimeMillis,
					start : start,
					end : end
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
				},
				success : function(data) {
					if (data) {
						$(".content").append(data);
						scrollBottom = $(document).height() - $(window).height();
					}
				}
			});
		}
	</script>
</body>
</html>