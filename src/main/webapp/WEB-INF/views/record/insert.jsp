<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<link rel="stylesheet" href="/public/summernote/summernote.css" />
<style>
.header {
	height: 100px;
}

.content {
	width: 85%;
	max-width: 950px;
	min-width: 300px;
	margin: auto;
}

.footer {
	height: 100px;
}

textarea {
	resize: none;
}

.category-panel {
	float: left;
	width: 30%;
}

.date-panel {
	float: right;
	text-align: right;
	width: 70%;
}

.category {
	max-width: 150px;
	width: 100%;
}

.input-date {
	max-width: 200px;
	width: calc(100% - 40px);
	display: inline;
}

.input-emotion {
	width: 150px;
	display: inline;
}

.emotion-panel {
	float: left;
}

#registerBtn {
	float: right;
	background-color: #337ab7 !important;
	border-color: #337ab7 !important;
}
</style>
</head>
<body>
	<div class="header">
		<div class="text-center">
			<h1>Record</h1>
		</div>
	</div>
	<div class="content">
		<form:form action="/record/insert" method="post"
			modelAttribute="record">
			<div class="form-group" style="height: 34px;">
				<div class="category-panel">
					<form:select class="category form-control" path="type">
						<form:option value="0" label="카테고리"></form:option>
						<form:option value="1" label="사건"></form:option>
						<form:option value="2" label="사유"></form:option>
					</form:select>
				</div>
				<div class="date-panel">
					<label for="datetime">일시</label> 
					&nbsp;
					<input
						class="form-control input-date" name="datetime"
						type="datetime-local" placeholder="ex) 2019-11-15T14:59" />
					<form:hidden path="write_time" />
				</div>
			</div>
			<div class="form-group">
				
			</div>
			<div class="form-group">
				<form:input class="form-control" path="title"
					placeholder="제목 (50자 이내)" />
				<form:errors path="title" class="error" />
			</div>
			<div class="form-group">
				<form:textarea class="form-control" path="summary"
					placeholder="세줄 요약 (띄어쓰기 포함 90자 이내)"></form:textarea>
				<form:errors path="summary"></form:errors>
			</div>
			<div class="form-group">
				<form:textarea class="form-control" id="content" path="content"
					placeholder="내용을 입력해 주세요" />
				<form:errors path="content" />
			</div>
			<div class="form-group text-right">
				<div class="emotion-panel">
					<label for="emotion">감정</label>
					&nbsp;
					<form:input path="emotion" class="form-control input-emotion" placeholder="가능한 한 간결하게"/>
					<form:errors path="emotion"></form:errors>
				</div>
				<button class="btn btn-primary" id="registerBtn"
					type="button" onclick="insertRecord(this.form);">등록</button>
			</div>
		</form:form>
	</div>
	<div class="footer"></div>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="/public/summernote/summernote.js"></script>
	<script src="/public/summernote/summernote-ko-KR.js"></script>
	<script>
		$("#content").summernote({
			height : 400,
			disableResizeEditor : true,
			lang : 'ko-KR'
		/* callbacks : {
			onImageUpload : sendFile,
			onMediaDelete : deleteFile
		} */
		});

		function insertRecord(f) {
			if (!f.title.value) {
				alert('제목을 작성하세요');
				f.title.focus();
				return;
			}
			if (f.title.value.length > 50) {
				alert('제목은 띄어쓰기 포함 50자 이내로 작성하세요');
				f.title.focus();
				return;
			}
			if (!f.summary.value) {
				alert('요약글을 작성하세요');
				f.summary.focus();
				return;
			}
			if (f.summary.value.length > 90) {
				alert('요약글은 띄어쓰기 포함 90자 이내로 작성하세요');
				f.summary.focus();
				return;
			}
			if (f.type.value > 2 || f.type.value < 1) {
				alert('카테고리를 선택하세요');
				f.type.focus();
				return;
			}
			if (!f.datetime.value) {
				if (confirm('일시를 입력하지 않았습니다. 현재 시각으로 작성할까요?')) {
					f.submit();
				} else {
					f.datetime.focus();
				}
				return;
			} else if (new Date(f.datetime.value) > new Date()) {
				alert('일시는 현재 이전만 선택할 수 있습니다')
				f.datetime.focus();
				return;
			}
			f.write_time.value = new Date(f.datetime.value).getTime();
			f.submit();
		}
	</script>
</body>
</html>