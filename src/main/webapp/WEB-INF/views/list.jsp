<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息</title>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/static/js/jquery-1.12.4.min.js"></script>
<link
	href="<%=request.getContextPath() %>/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="<%=request.getContextPath() %>/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 搭建Bootstrap 显示前台信息 -->
	<div class="container">
		<!-- 现世标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<!-- 现世按钮 -->
		<div class="row">
			<div class="col-md-2 col-md-offset-10">
				<button class="btn btn-primary">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<!-- 现世表格信息 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>ID</th>
						<th>姓名</th>
						<th>性别</th>
						<th>年龄</th>
						<th>Email</th>
						<th>班级</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageInfo.list }" var="stu">
						<tr>
							<td>${stu.stuId }</td>
							<td>${stu.stuName }</td>
							<td>${stu.stuSex == "M" ? "男" : "女"}</td>
							<td>${stu.stuAge }</td>
							<td>${stu.stuEmail }</td>
							<td>${stu.className.className }</td>
							<td>
								<button class="btn btn-primary btn-sm">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									编辑
								</button>
								<button class="btn btn-danger btn-sm">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
									删除
								</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<!-- 现世分页信息 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6">
				当前 ${pageInfo.pageNum } 页，总 ${pageInfo.pages } 页，总 ${pageInfo.total} 条记录
			</div>
			<!-- 分页条信息 -->
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				<ul class="pagination">
					<c:if test="${pageInfo.isFirstPage }">
						<li class="disabled"><a href="#">首页</a></li>
					</c:if>
					<c:if test="${!pageInfo.isFirstPage }">
						<li><a href="<%=request.getContextPath() %>/studentAll?pn=1">首页</a></li>
					</c:if>
					<c:if test="${pageInfo.hasPreviousPage }">
						<li><a href="<%=request.getContextPath() %>/studentAll?pn=${pageInfo.pageNum - 1 }" aria-label="Previous"> <span
								aria-hidden="true">上一页</span>
						</a></li>
					</c:if>
					<c:forEach items="${pageInfo.navigatepageNums }" var="page_num">
						<c:if test="${pageInfo.pageNum == page_num }">
							<li class="active"><a href="#">${page_num}</a></li>
						</c:if>
						<c:if test="${pageInfo.pageNum != page_num }">
							<li><a href="<%=request.getContextPath() %>/studentAll?pn=${page_num}">${page_num}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageInfo.hasNextPage }">
						<li><a href="<%=request.getContextPath() %>/studentAll?pn=${pageInfo.pageNum + 1 }" aria-label="Next"> <span
								aria-hidden="true">下一页</span>
						</a></li>
					</c:if>
					<c:if test="${pageInfo.isLastPage }">
						<li class="disabled"><a href="#">尾页</a></li>
					</c:if>
					<c:if test="${!pageInfo.isLastPage }">
						<li><a href="<%=request.getContextPath() %>/studentAll?pn=${pageInfo.pages }">尾页</a></li>
					</c:if>
				</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>