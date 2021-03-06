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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<link rel="shortcut icon" href="/public/favicon.ico">
<link rel="stylesheet" href="/public/css/style.css">
<style>
* {
	box-sizing: border-box;
}

.image-board {
	width: 100%;
	max-width: 340px;
	border: 2px solid #ccc;
	margin-bottom: 15px;
	border-radius: 10px;
}

#image {
	width: 100%;
}

.disnone {
	display: none !important;
}

.form-group {
	margin-bottom: 20px;
}

.header {
	height: 150px;
}

/* input file 디자인 변경 */
.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox .file-label {
	display: inline-block;
	padding: .5em .75em;
	color: gray;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	width: 100%;
	max-width: 340px;
	text-align: center;
} /* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em; /* label의 패딩값과 일치 */
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

#id-error {
	margin-bottom: 0;
}
</style>
</head>
<body>
	<div class="header">
		<h1 class="text-center" style="padding-top: 50px;">Join</h1>
	</div>
	<div class="content">
		<div class="container-fluid">
			<form:form action="/user/join?${_csrf.parameterName}=${_csrf.token }"
				method="post" modelAttribute="user"
				class="form-horizontal filebox">
				<div class="row">
					<div class="col-sm-7 col-sm-offset-2">
						<div class="form-group">
							<label class="col-sm-3 control-label" for="id">ID</label>
							<div class="col-sm-9">
								<div class="input-group">
									<form:input path="id" class="form-control"
										onkeydown="javascript:idModified();"
										placeholder="영문 또는 숫자 4 ~ 20 글자" />
									<div class="input-group-btn">
										<button type="button" id="idCheck-btn" class="btn btn-danger"
											onclick="idDualCheck(this.form);">중복 확인</button>
									</div>
								</div>
								<p id="id-error" style="color: red" class="disnone">사용할 수 없는
									아이디입니다</p>
								<form:errors path="id"></form:errors>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="password">Password</label>
							<div class="col-sm-9">
								<form:password path="password" class="form-control"
									id="password" placeholder="숫자와 영문, 특수문자(!@#*_-) 4 ~ 20 글자"
									onkeyup="checkPassword();" />
								<form:errors path="password"></form:errors>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="pCheck">Password
								Check</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="pCheck"
									placeholder="패스워드 확인" onkeyup="checkPassword();" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="nickname">Nickname</label>
							<div class="col-sm-9">
								<form:input path="name" class="form-control"
									onkeyup="dualCheckNickname(this);"
									placeholder="숫자와 영문, 한글, 특수문자(!@#*_-) 4 ~ 20 글자" />
								<p id="dualCheckResult" class="disnone" style="margin: 0;"></p>
								<form:errors path="name"></form:errors>
							</div>
						</div>
						<%-- <div class="form-group">
							<label class="col-sm-3 control-label" for="email">email</label>
							<div class="col-sm-9">
								<div class="input-group">
									<form:input path="email" class="form-control"
										placeholder="한 이메일 당 하나의 계정만 생성 가능" />
									<span class="input-group-btn">
										<button id="sendCode-btn" type="button" class="btn btn-danger"
											onclick="sendCode(this.form);">인증번호 발송</button>
									</span>
								</div>
								<p id="email-error" style="margin: 0"></p>
							</div>
						</div>
						<div class="form-group disnone" id="emailCertify">
							<label class="col-sm-3 control-label" for="code">이메일 인증코드</label>
							<div class="col-sm-9">
								<div class="input-group">
									<input id="code" name="code" class="form-control"
										placeholder="해당 이메일로 발송된 코드를 입력하세요" /> <span
										class="input-group-btn">
										<button type="button" class="btn btn-danger"
											onclick="checkCode(this.form);">인증번호 확인</button>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="myinfo">한 줄 소개</label>
							<div class="col-sm-9">
								<form:textarea path="myinfo" class="form-control"
									placeholder="자신을 소개해보세요" style="resize: none;"></form:textarea>
								<form:errors path="myinfo"></form:errors>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">reCAPTCHA</label>
							<div class="col-sm-9">
								<div id="html_element" style="width: 100%"></div>
							</div>
						</div> --%>
						<div class="form-group">
							<label class="col-sm-3"></label>
							<div class="col-sm-9">
								<button type="button" class="btn btn-block btn-primary"
									onclick="insert(this.form)">가입</button>
							</div>
						</div>
					</div>
					<%-- <div class="col-sm-3">
						<div class="form-group">
							<div class="image-board">
								<div class="text-center">
									<div id="image-board-text">
										<label class="control-label">프로필 이미지</label>
										<p style="margin : 10px 0 0 0;">가로세로 비율이 1대1인 이미지만 </p>
										<p>사용할 수 있습니다</p>
									</div>
								</div>
							</div>
							<input type="file" name="image_file" onchange="uploadImage(this)" id="image_input"/>
							<label for="image_input" class="file-label">이미지 선택</label>
						</div>
						<div>
							<a href="/user/cropimage" target="_blank">이미지 조정하러가기</a>
						</div>
					</div> --%>
				</div>
			</form:form>
		</div>
	</div>
	<div class="footer"></div>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script
		src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
		async defer>
		
	</script>
	<script>
		var passwordCheck = false;
		var isCertified = false;
		var idCheck = false;
		
		function idDualCheck(f) {
			var id = f.id.value;
			console.log(id);
			$.ajax({
				url : "/user/dualcheck/id",
				type : "post",
				data : {
					id : id
				},
				beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
					xhr.setRequestHeader("${_csrf.headerName}",
							"${_csrf.token}");
				},
				success : function(data) {
					console.log(data);
					if (data == "duplicated") {
						$("#id-error").removeClass("disnone");
					} else {
						$("#idCheck-btn").text("사용 가능").css({
							"background-color" : "green",
							"border-color" : "green"
						}).attr("disabled", "disabled");
						$("#id").css("border-color", "green");
						$("#id-error").addClass("disnone");
						idCheck = true;
					}
				},
				error : function(e) {
					console.error(e);
				}
			});
		}

		function idModified() {
			$("#idCheck-btn").text("중복 확인").css("background-color", "#d9534f")
					.removeAttr("disabled");
			$("#id").css("border-color", "red");
			$("#idCheck-btn").css("border-color", "red");
		}

		function insert(f) {
			if (idCheck == false) {
				alert('아이디 중복 여부를 확인하세요');
				return;
			}
			if (passwordCheck == false) {
				alert("패스워드를 확인하세요");
				return;
			}
			f.submit();
		}

		function checkPassword() {
			if ($("#password").val() == $("#pCheck").val()) {
				passwordCheck = true;
				$("#pCheck").css('border-color', 'green');
			} else {
				passwordCheck = false;
				$("#pCheck").css('border-color', 'red');
			}
		}
		
	</script>
</body>
</html>