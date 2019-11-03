<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" 
 	  content="width=device-width, initial-scale=1">
<title>Insert Title here</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<style>
.header {
	height: 100px;
}

.content {
	width: 950px;
	margin: auto; 
}

.footer {
	height: 100px;
}

.memoir {
	width: 208px;
	height: 255px;
	margin: auto;
	border: 1px solid black;	
}
</style>
</head>
<body>
	<div class="header">
		<h1>Memoir List</h1>
	</div>
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<c:forEach var="memoir" items="${memoirList }">
				<div class="col-md-3">
					<a href="/memoir/view?id=${memoir.id }">
						<div class="memoir">
							<div class="memoir-thumbnail">
								<p>${memoir.content }</p>
							</div>
							<div class="memoir-title">
								<p>${memoir.title }</p>
							</div>
						</div>
					</a>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="footer"></div>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>