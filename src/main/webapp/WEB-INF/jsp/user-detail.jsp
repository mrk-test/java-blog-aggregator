<%@ include file="..//layouts/taglibs.jsp"%>

<tiles:insertDefinition name="common">
	<tiles:putAttribute name="pageName" value="users" />
	<tiles:putAttribute name="title" value="Java Blog Aggregator" />
	<tiles:putAttribute name="body">

		<script type="text/javascript">
			$(function() {
				$(".nav-tabs a:first").tab("show");
				$(".triggerRemove").click(function(e) {
					e.preventDefault();
					$("#modalRemove .removeBtn").attr("href", $(this).attr("href"));
					$("#modalRemove").modal();
				})
			});
		</script>



		<div class="body">
			<h1><c:out value="${user.name}" /></h1>

			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<c:forEach items="${user.blogs}" var="blog">
					<li><a href="#blog_${blog.id}" role="tab" data-toggle="tab"><c:out value="${blog.name}" /></a></li>
				</c:forEach>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
				<c:forEach items="${user.blogs}" var="blog">
					<div class="tab-pane" id="blog_${blog.id}">
						<h1><c:out value="${blog.name}" /></h1>
						<p>
							<a href='<spring:url value="/blog/remove/${blog.id}" />'
								class="btn btn-danger triggerRemove">Remove Blog</a> <c:out value="${blog.url}" />
						</p>
						<table class="table table-bordered table-hover table-striped">
							<tr>
								<th>Title</th>
								<th>Link</th>
							</tr>
							<c:forEach items="${blog.items}" var="item">
								<tr>
									<td><c:out value="${item.title}" /></td>
									<td><c:out value="${item.link}" /></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</c:forEach>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="modalRemove" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Remove Blog</h4>
						</div>
						<div class="modal-body">Really remove?</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Cancel</button>
							<a href="" class="btn btn-danger removeBtn">Remove</a>
						</div>
					</div>
				</div>
			</div>
		</div>



	</tiles:putAttribute>
</tiles:insertDefinition>