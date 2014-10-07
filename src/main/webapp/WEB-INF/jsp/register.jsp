<%@ include file="../layouts/taglibs.jsp" %>

<tiles:insertDefinition name="common">
	<tiles:putAttribute name="pageName" value="register" />
	<tiles:putAttribute name="title" value="Java Blog Aggregator" />
	<tiles:putAttribute name="body">



		<form:form commandName="user" cssClass="form-horizontal registrationForm">
			<c:if test="${success eq 'true'}">
				<div class="alert alert-success">Registration Successful!</div>
			</c:if>
			<div class="form-group">
				<label for="name" class="col-sm-2 control-label">Name:</label>
				<div class="col-sm-10">
					<form:input path="name" cssClass="form-control"/>
					<form:errors path="name" />
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-2 control-label">Email:</label>
				<div class="col-sm-10">
					<form:input path="email" cssClass="form-control"/>
					<form:errors path="email" />
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-2 control-label">Password:</label>
				<div class="col-sm-10">
					<form:password path="password" cssClass="form-control"/>
					<form:errors path="password" />
				</div>
			</div>
			<div class="form-group">
				<label for="password_again" class="col-sm-2 control-label">Password again:</label>
				<div class="col-sm-10">
					<input type="password" name="password_again" id="password_again" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<input type="submit" value="Save" class="btn btn-lg btn-primary">
				</div>
			</div>
		</form:form>

		<script>
		$(function() {
			$(".registrationForm").validate({
				highlight: function(e) {
					$(e).closest(".form-group").removeClass("has-success").addClass("has-error")
				},
				unhighlight: function(e) {
					$(e).closest(".form-group").removeClass("has-error").addClass("has-success")
				},
				rules: {
					name: {
						required: true,
						minlength: 3,
						remote: {
							url: "<spring:url value='/register/available'></spring:url>",
							type: "get",
							data: {
								username: function() {
									return $("#name").val();
								}
							}
						}
					},
					email: {
						required: true,
						email: true,
					},
					password: {
						required: true,
						minlength: 5
					},
					password_again: {
						required: true,
						equalTo: "#password"
					}
				},
				messages: {
					name: {
						remote: "Such user already exists!"	
					}
				}
			})
		})
		</script>

	</tiles:putAttribute>
</tiles:insertDefinition>