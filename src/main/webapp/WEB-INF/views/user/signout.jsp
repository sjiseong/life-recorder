<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function signout() {
		var form = document.createElement("form");
		form.method = "post";
		form.action = "/signout";
		var input = document.createElement("input");
		input.type = "hidden";
		input.name = "${_csrf.parameterName}";
		input.value = "${_csrf.token}";
		form.appendChild(input);
		document.body.appendChild(form);
		form.submit();
	}
</script>
