<%@ include file="..//layouts/taglibs.jsp" %>

<tiles:insertDefinition name="common">
	<tiles:putAttribute name="pageName" value="users" />
	<tiles:putAttribute name="title" value="Java Blog Aggregator" />
	<tiles:putAttribute name="body">



		<div class="body">
			<table class="table table-bordered table-hover table-striped">
				<tr>
					<th>user name</th>
				</tr>
				<c:forEach items="${users}" var="user">
					<tr>
						<td><a href='<spring:url value="/users/${user.id}" />'>${user.name}</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>



	</tiles:putAttribute>
</tiles:insertDefinition>