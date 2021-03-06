<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layouts/taglibs.jsp" %>
<tilesx:useAttribute name="pageName"/>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	
<script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>

<body>
	<div class="container">
		<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href='<spring:url value="/" />'>JBA</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="${pageName eq 'index' ? 'active' : ''}"><a href='<spring:url value="/" />'>Home</a></li>
						<security:authorize access="hasRole('ROLE_ADMIN')">
							<li class="${pageName eq 'users' ? 'active' : ''}"><a href='<spring:url value="/users" />'>Users</a></li>
						</security:authorize>
						<li class="${pageName eq 'register' ? 'active' : ''}"><a href='<spring:url value="/register" />'>Register</a></li>
						<security:authorize access="! isAuthenticated()">
							<li class="${pageName eq 'login' ? 'active' : ''}"><a href='<spring:url value="login" />'>Login</a></li>
						</security:authorize>
						<security:authorize access="isAuthenticated()">
							<li class="${pageName eq 'account' ? 'active' : ''}"><a href='<spring:url value="/account" />'>My Account</a></li>
							<li><a href='<spring:url value="/logout" />'>Logout</a></li>
						</security:authorize>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
		<tiles:insertAttribute name="body" />
		<br> <br>
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>