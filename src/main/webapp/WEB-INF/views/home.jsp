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
	}
	
	.content>[class^=record-] {
		width: 50%;
		padding: 20px 0 20px 8%;
		float: left;
	}
	
	.content>.record-idea {
		padding: 20px 8% 20px 0;
	}
	
	.record {
		position: relative;
		margin-bottom: 20px;
		font-size: 0;
		overflow: hidden;
	}
	
	.record-content{
		float:left;
		width: 80%;
		border: 2px solid black;
		font-size: 1.5rem;
		padding: 10px;
	}
	
	.record-line {
		float:left;
		width: 20%;
		position: absolute;
		height:100%;
		right:0;
	}
	
	.record-idea .record-content {
		float: right;
	}
		
	.record-idea .record-line {
		left: 0;
	}
		
	.record-hr {
		position:relative;
		border:2px solid black;
		margin:0;
		top:50%;
		transform:translate(-0,50%);
	}
	
	.record-content>[class^=record-]{
		overflow:hidden;
		text-overflow: ellipsis;
		word-break: break-all;
		display: -webkit-box;
		-webkit-box-orient: vertical;
	}
	
	.record-title {
		-webkit-line-clamp: 2;
		max-height: 4rem;
		font-size:1.8rem;
		line-height:2rem;
		font-weight: bold;
	}
	
	.record-summary {
		-webkit-line-clamp: 3;
		max-height: 6rem;
		font-size:1.5rem;
		line-height:2rem;
		margin-bottom: 0;
	}
	
	.timeline {
		position:fixed;
		width: 3rem;
		height : 100vh;
		left : 50%;
		transform: translate(-50%, 0);
		background-color: black;
		z-index: 100;
	}
	
	.timeline-header {
		font-size: 0;
	}
		
	[class^=timeline-header-] {
		display: inline-block;
	}
	
	.timeline-header-left, .timeline-header-right {
		width: calc(50% - 5rem);
		font-size: 4rem;
	}
	
	.timeline-header-arrow {
		position: relative;
		background-color: white;
		z-index: 110;
	}
	
	@media (min-width: 992px){
		body {
	   		padding-top: 0;
	   		padding-left: 20rem;
		}
		.timeline {
			left : calc(50% + 10rem);
		}
	}
	
		
</style>
</head>
<body>
	<nav class="navbar">
		<h1>${userName }</h1>
		<button type="button" onclick="javascript:signout()">로그아웃</button>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<div class="timeline"></div>
			<div class="timeline-header">
				<div class="timeline-header-left">Current Time</div>
				<div class="timeline-header-arrow triangle"></div>
				<div class="timeline-header-right">Right</div>
			</div>
		</div>
		<div class="row">
			<c:set var="curTime" value="<%= new java.util.Date()%>"/>
			<div class="content">
				<div class="record-incident">
					<c:forEach items="${recordList1 }" var="record">
					<fmt:parseDate var="writeTime" value="${record.write_time }" pattern="yyyy-MM-dd HH:mm:sss"></fmt:parseDate>
					<fmt:parseNumber var="distance" value="${(curTime.time - writeTime.time) / 40000}" integerOnly="true"></fmt:parseNumber>
					<div class="record" style="top:${distance}px">
						<div class="record-content">
							<p class="record-title">${record.title }</p>
							<p class="record-summary">${record.summary }</p>
							<p>${record.write_time }</p>
						</div>
						<div class="record-line">
		 					<hr class="record-hr"/>
						</div>
 					</div>
					</c:forEach>
				</div>
				<div class="record-idea">
					<c:forEach items="${recordList2 }" var="record">
					<fmt:parseDate var="writeTime" value="${record.write_time }" pattern="yyyy-MM-dd HH:mm:sss"></fmt:parseDate>
					<fmt:parseNumber var="distance" value="${(curTime.time - writeTime.time) / 40000}" integerOnly="true"></fmt:parseNumber>
					<div class="record" style="top:${distance}px">
	 					<div class="record-line">
		 					<hr class="record-hr"/>
	 					</div>
						<div class="record-content">
							<p class="record-title">${record.title }</p>
							<p class="record-summary">${record.summary }</p>
							<p>${record.write_time }</p>
						</div>
 					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<jsp:include page="user/signout.jsp"></jsp:include>	
</body>
</html>