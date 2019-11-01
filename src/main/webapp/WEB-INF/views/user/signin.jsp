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
.center {
	position: absolute;
	width: 500px;
	height: 300px;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}
</style>
</head>
<body>
	<div class="center">
		<form action="/signin" method="post">
			<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token }" />
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Enter ID"
					name="id" value="test"/>
			</div>
			<div class="form-group">
				<input type="password" class="form-control"
					placeholder="Enter Password" name="password" value="1111"/>
			</div>
			<button class="btn btn-primary btn-block" type="submit">Sign
				in</button>
		</form>
	</div>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</body>
</html>