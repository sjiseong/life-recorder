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
<link href="https://fonts.googleapis.com/css?family=Amatic+SC&display=swap" rel="stylesheet">
<style>
.center {
	position: absolute;
	width: 90%;
	max-width: 500px;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}

.title {
	text-align: center;
	margin-top: 0;
	margin-bottom: 50px;
	font-size: 60px;
	font-family: 'Amatic SC', cursive;
}
</style>
</head>
<body>
	<div class="center">
		<form action="/signin" method="post">
			<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token }" />
			<div class="title">
				Life Recorder
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Enter ID"
					name="id" />
			</div>
			<div class="form-group">
				<input type="password" class="form-control"
					placeholder="Enter Password" name="password" />
			</div>
			<button class="btn btn-primary btn-block" type="submit">Sign
				in</button>
			<hr />
			<button class="btn btn-default btn-block" type="button" onclick="location.href='/user/join'">Sign up</button>
		</form>
	</div>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</body>
</html>