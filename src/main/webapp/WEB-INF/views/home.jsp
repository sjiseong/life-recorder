<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	.navbar {
		position: fixed;
		background-color: green;
	}
</style>
</head>
<body>
	<div class="navbar">
		<h1>Hello ${userName }</h1>
		<button type="button" onclick="javascript:signout()">로그아웃</button>
	</div>
	<div class="content container-fluid">
		<div class="row">
			<div class="col-xs-9 col-xs-offset-3">
				<h1>Content</h1>
				<c:forEach items="${recordList }" var="record">
				<div class="record">
					<p>${record.title }</p>
					<p>${record.content }</p>
					<p>${record.write_time }</p>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<jsp:include page="user/signout.jsp"></jsp:include>
</body>
</html>