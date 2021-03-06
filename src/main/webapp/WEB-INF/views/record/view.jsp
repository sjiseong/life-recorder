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
.footer {
	height: 100px;
}
.content {
	width: 85%;
	max-width: 950px;
	min-width: 300px;
	margin: auto;
}
.record-summary {
	font-size: 1.5rem;
}
.record-content {
	width: 100%;
	resize: none;
}
</style>
</head>
<body>
	<div class="header">
		<h1 class="text-center">Record</h1>
	</div>
	<div class="content">
		<p class="text-right">작성자 : ${record.writer } &nbsp;&nbsp;&nbsp; 일시 : ${record.write_time }</p>
		<p class="text-right" style="vertical-align: middle"><i class="far fa-laugh" style="font-size: 1.5rem"></i>&nbsp;&nbsp;${record.emotion }</p>
		<h1>${record.title }</h1>
		<hr />
		<p class="record-summary">${record.summary }</p>
		<hr />
		<p class="record-content">${record.content }</p>
	</div>
	<div class="footer"></div>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>