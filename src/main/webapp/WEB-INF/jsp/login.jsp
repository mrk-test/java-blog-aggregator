<%@ include file="../layouts/taglibs.jsp"%>

<tiles:insertDefinition name="common">
	<tiles:putAttribute name="pageName" value="login" />
	<tiles:putAttribute name="title" value="Java Blog Aggregator" />
	<tiles:putAttribute name="body">

		<style>
		.form-signin {
			max-width: 330px;
			padding: 15px;
			margin: 0 auto;
		}
		
		.form-signin .form-signin-heading, .form-signin .checkbox {
			margin-bottom: 10px;
		}
		
		.form-signin .checkbox {
			font-weight: normal;
		}
		
		.form-signin .form-control {
			position: relative;
			height: auto;
			-webkit-box-sizing: border-box;
			-moz-box-sizing: border-box;
			box-sizing: border-box;
			padding: 10px;
			font-size: 16px;
		}
		
		.form-signin .form-control:focus {
			z-index: 2;
		}
		
		.form-signin input[type="email"] {
			margin-bottom: -1px;
			border-bottom-right-radius: 0;
			border-bottom-left-radius: 0;
		}
		
		.form-signin input[type="password"] {
			margin-bottom: 10px;
			border-top-left-radius: 0;
			border-top-right-radius: 0;
		}
		</style>

		<form class="form-signin" role="form" action='<spring:url value="/j_spring_security_check"></spring:url>' method="post">
			<h2 class="form-signin-heading">Please sign in</h2>
			<input type="text" name="j_username" class="form-control" placeholder="Name" required autofocus>
			<input type="password" name="j_password" class="form-control" placeholder="Password" required>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
		</form>



	</tiles:putAttribute>
</tiles:insertDefinition>