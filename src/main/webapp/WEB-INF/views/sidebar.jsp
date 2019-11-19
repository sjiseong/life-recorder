<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<nav class="navbar collapse in nav-collapse no-transition" id="myNav">
	<div class="mynav-header">
		<p class="mynav-brand">Life Recorder</p>
	</div>
	<hr class="mynav-hr">
	<p class="nav-username" style="text-align: center">
		<i class="fas fa-user-circle" style="font-size: 20px;"></i> &nbsp; <span><sec:authentication
				property="principal.name" /></span>
	</p>
	<hr class="mynav-hr">
	<ul class="mynav-nav">
		<li><a class="nav-link" href="/main"><span>Home</span></a></li>
		<li><a class="nav-link" href="/record/insert"><span>기록
					추가</span></a></li>
		<li><a class="nav-link" href="/memoir"><span>회고록</span></a></li>
		<li><a class="nav-link" href="/share/friend"><span>친구
					목록</span></a></li>
		<li><a class="nav-link" href="javascript:signout()"><span>로그아웃</span></a></li>
	</ul>
	<hr class="mynav-hr">
	<button type="button" id="hide-toggle" class="navbar-toggle"
		data-toggle="collapse" data-target="#myNav">
		<i class="fas fa-chevron-left"></i>
	</button>
</nav>
