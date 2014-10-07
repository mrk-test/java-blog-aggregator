<%@ include file="../layouts/taglibs.jsp" %>

<tiles:insertDefinition name="common">
	<tiles:putAttribute name="pageName" value="index" />
	<tiles:putAttribute name="title" value="Java Blog Aggregator" />
	<tiles:putAttribute name="body">



		<div class="body">
			<h1>Latest news from the Java world:</h1>
			<table class="table table-bordered table-hover table-striped">
				<tr>
					<th>date</th>
					<th>item</th>
				</tr>
				<c:forEach items="${items}" var="item">
					<tr>
						<td>
							<c:out value="${item.publishedDate}" />
							<br><br>
							<c:out value="${item.blog.name}" />
						</td>
						<td>
							<strong>
								<a href='<c:out value="${item.link}" />'><c:out value="${item.title}" /></a>
							</strong>
							<br>
							${item.description}
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>



	</tiles:putAttribute>
</tiles:insertDefinition>