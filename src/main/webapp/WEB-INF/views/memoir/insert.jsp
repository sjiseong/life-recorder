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

.footer {
	height: 100px;
}

textarea {
	resize: none;
}
</style>
</head>
<body>
	<div class="header">
		<div class="text-center">
			<h1>Memoir</h1>
		</div>
	</div>
	<div class="content">
		<div class="container-fluid" style="width: 80%">
			<div class="row">
				<form:form action="/memoir/insert" method="post"
					modelAttribute="memoir">
					<div class="form-group">
						<form:input class="form-control" path="title"
							placeholder="제목 (50자 이내)" />
						<form:errors path="title" class="error" />
					</div>
					<div class="form-group">
						<form:textarea class="form-control" id="content" path="content"
							placeholder="내용을 입력해 주세요" />
						<form:errors path="content" />
					</div>
					<div class="form-group text-right">
						<button class="btn btn-primary"
							style="background-color: #337ab7 !important; border-color: #337ab7 !important;"
							type="button" onclick="insertMemoir(this.form);">등록</button>
					</div>
				</form:form>
			</div>
		</div>
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

		function insertMemoir(f) {
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
			if (!f.content.value) {
				alert('내용을 작성하세요');
				$(".note-editable").focus();
				return;
			}
			f.submit();
		}
	</script>
</body>
</html>