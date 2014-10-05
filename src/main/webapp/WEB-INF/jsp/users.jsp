<%@ include file="..//layouts/taglibs.jsp" %>

<tiles:insertDefinition name="common">
	<tiles:putAttribute name="pageName" value="users" />
	<tiles:putAttribute name="title" value="Java Blog Aggregator" />
	<tiles:putAttribute name="body">



		<script>
		$(function() {
			$(".triggerRemove").click(function(e) {
				e.preventDefault();
				$("#modalRemove .removeBtn").attr("href", $(this).attr("href"));
				$("#modalRemove").modal();
			})
		})
		</script>
		
		<div class="body">
			<table class="table table-bordered table-hover table-striped">
				<tr>
					<th>user name</th>
					<th>operations</th>
				</tr>
				<c:forEach items="${users}" var="user">
					<tr>
						<td><a href='<spring:url value="/users/${user.id}" />'><c:out value="${user.name}" /></a></td>
						<td>
							<a href='<spring:url value="/users/remove/${user.id}" />' class="btn btn-danger triggerRemove">remove</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			
			<!-- Modal -->
			<div class="modal fade" id="modalRemove" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Remove User</h4>
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