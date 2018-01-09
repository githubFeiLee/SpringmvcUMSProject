<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<style>
.operation-btn{
	width: 35px;
	height:20px;
	padding: 0px;
	font-size: 12px;
	
}
</style>

<div id="mainPanel" class="main-panel">
	<section class="toolbar">
		<label for="">用户名称：</label> <input type="text" name="userName" />
		<button type="button">查询</button>
		<button type="button" id="to-hobby-add" data-url="/hobbys/add">添加</button>
		<button type="button">删除</button>
	</section>
	<section>
		<table class="table table-sm">
			<thead>
				<tr>
					<th scope="col">序号</th>
					<th scope="col">名称</th>
					<th scope="col">描述</th>
					<th scope="col">创建时间</th>
					
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${professions }" var="professions" varStatus="status">
				<tr>
					<td scope="row"><input type="checkbox">${status.count }</td>
					<td>${professions.name }</td>
					<td>${professions.createDate }</td>
					<td>${professions.description }</td>
					
					<td>
					<button type="button" id="to-update-user"
						data-url="/hobbys/add"
						class="btn btn-primary btn-sm to-edit-hoobybutton pt-0 operation-btn" data-id="${hobbys.id }">编辑</button>
					<button type="button" id="delete-user-btn" data-url="/hobbys/delete"
						class="btn bg-danger text-white btn-sm delete-hobby pt-0 operation-btn" data-id="${hobbys.id }">删除</button>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<ul class="pagination" id="pagination"></ul>		
	</section>
</div>




<script type="text/javascript">
	$(function() {
		var totalPage=${page.totalPage};
		var currentPage=${page.currentPage};

		$("#pagination").jqPaginator({
			totalPages:totalPage,
			visiblePages:5,
			currentPage:currentPage,
			  first: '<li class="first"><a href="javascript:void(0);">首页</a></li>',
			    prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
			    next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
			    last: '<li class="last"><a href="javascript:void(0);">尾页</a></li>',
			    page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
			    onPageChange: function (num,type) {
			        if (type == 'change') {
			        loadMainContent("hobbys/list", function() {
					}, {
						currentPage : num
					});
			    }
			 }
			});
	
	})
</script>
