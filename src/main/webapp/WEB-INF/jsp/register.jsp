<%@ include file="../layouts/taglibs.jsp" %>

<tiles:insertDefinition name="common">
	<tiles:putAttribute name="pageName" value="register" />
	<tiles:putAttribute name="title" value="Java Blog Aggregator" />
	<tiles:putAttribute name="body">



		<form:form commandName="user" cssClass="form-horizontal">
			<div class="form-group">
				<label for="name" class="col-sm-2 control-label">Name</label>
				<div class="col-sm-10">
					<form:input path="name" cssClass="form-control"/>
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-2 control-label">Email</label>
				<div class="col-sm-10">
					<form:input path="email" cssClass="form-control"/>
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-2 control-label">Password</label>
				<div class="col-sm-10">
					<form:password path="password" cssClass="form-control"/>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<input type="submit" value="Save" class="btn btn-lg btn-primary">
				</div>
			</div>
		</form:form>



	</tiles:putAttribute>
</tiles:insertDefinition>