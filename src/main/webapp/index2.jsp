<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<jsp:forward page="/studentAll"></jsp:forward>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>初始页面</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- web路径：
不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
		http://localhost:3306/crud
 -->
<%-- <script type="text/javascript"
	src="<%=request.getContextPath() %>/static/js/jquery-1.12.4.min.js"></script>
<link
	href="<%=request.getContextPath() %>/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="<%=request.getContextPath() %>/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head> --%>
</head>
<body>
	<!-- <button class="btn btn-success">按钮</button> -->
</body>
</html>