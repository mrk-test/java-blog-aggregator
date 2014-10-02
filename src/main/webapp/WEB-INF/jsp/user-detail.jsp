<%@ include file="..//layouts/taglibs.jsp" %>

<tiles:insertDefinition name="common">
	<tiles:putAttribute name="pageName" value="users" />
	<tiles:putAttribute name="title" value="Java Blog Aggregator" />
	<tiles:putAttribute name="body">



		<div class="body">
			<h1>${user.name}</h1>
			<c:forEach items="${user.blogs}" var="blog">
				<h1>${blog.name}</h1>
				<p>${blog.url}</p>
				<table class="table table-bordered table-hover table-striped">
					<tr>
						<th>Title</th>
						<th>Link</th>
					</tr>
					<c:forEach items="${blog.items}" var="item">
						<tr>
							<td>${item.title}</td>
							<td>${item.link}</td>
						</tr>
					</c:forEach>
				</table>
			</c:forEach>
		</div>



	</tiles:putAttribute>
</tiles:insertDefinition>