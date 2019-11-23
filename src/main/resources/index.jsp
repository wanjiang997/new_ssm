<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

	<!-- 学生信息修改模态框 -->
	<div class="modal fade" id="stuUpdateModal" tabindex="-1" role="dialog" aria-labelledby="学生添加">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">学生修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="stuNameId_update"></p>
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">年龄</label>
							<div class="col-sm-10">
								<input min="0" type="number" name="stuAge"　id="stuAgeId_update" placeholder="学生年龄" class="form-control">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> 
									<input type="radio" name="stuSex" id="stuSex1_update" value="M" checked="checked"> 男
								</label> 
								<label class="radio-inline"> 
									<input type="radio" name="stuSex" id="stuSex2_update" value="F"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="text" name="stuEmail" id="stuEmailId_update" placeholder="wanjiang@bonc.con.com" class="form-control">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">班级</label>
							<div class="col-sm-4">
								<select name="stuCname" class="form-control">
								  
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="stu_update_btn" onclick="updateStudent()">Save</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 学生信息添加模态框 -->
	<div class="modal fade" id="stuAddModal" tabindex="-1" role="dialog" aria-labelledby="学生添加">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">学生新增</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<input type="text" name="stuName" id="stuNameId" placeholder="学生姓名" class="form-control">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">年龄</label>
							<div class="col-sm-10">
								<input min="0" type="number" name="stuAge"　id="stuAgeId" placeholder="学生年龄" class="form-control">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> 
									<input type="radio" name="stuSex" id="stuSex1" value="M" checked="checked"> 男
								</label> 
								<label class="radio-inline"> 
									<input type="radio" name="stuSex" id="stuSex2" value="F"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="text" name="stuEmail" id="stuEmailId" placeholder="wanjiang@bonc.con.com" class="form-control">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">班级</label>
							<div class="col-sm-4">
								<select name="stuCname" class="form-control">
								  
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="stu_add_btn" onclick="saveStudent()">Save</button>
				</div>
			</div>
		</div>
	</div>
	
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
				<button class="btn btn-primary" id="stu_add_modal_btn">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<!-- 现世表格信息 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="stu_table">
					<thead>
						<tr>
							<th>ID</th>
							<th>姓名</th>
							<th>性别</th>
							<th>年龄</th>
							<th>Email</th>
							<th>班级</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
		<!-- 现世分页信息 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-5" id="page_info_area">
			</div>
			<!-- 分页条信息 -->
			<div class="col-md-7" id="page_nav_area">
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		var totalRecord;//全局总记录数
		$(function () {
			to_page(1);
		});
		
		function to_page (pn) {
			$.ajax({
				url : '${APP_PATH}/getStudentAll',
				data : 'pn='+pn,
				type : 'GET',
				success : function (response) {
					//解析并显示学生信息
					stu_build_table(response);
					//解析显示分页信息
					build_page_info(response);
					//解析显示分页条
					build_page_nav(response);
				}
			});
		}
		
		function stu_build_table (result) {
			$('#stu_table tbody').empty();
			var data = result.extend.pageInfo.list;
			$.each(data, function (index, item) {
				var stuIdTd = $('<td></td>').append(item.stuId);
				var stuNameTd = $('<td></td>').append(item.stuName);
				var stuSexTd = $('<td></td>').append(item.stuSex=='M'?'男':'女');
				var stuAgeTd = $('<td></td>').append(item.stuAge);
				var stuEmailTd = $('<td></td>').append(item.stuEmail);
				var className = $('<td></td>').append(item.className.className);
				//操作按钮
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				//为没一个编辑按钮添加自定义的属性，来表示当前学生的Id
				editBtn.attr('edit-id', item.stuId);
				var delBtn = $('<button></button>').addClass('btn btn-danger btn-sm delete-btn')
								.append('<span></span>').addClass('glyphicon glyphicon-trash').append('删除');
				var btnTd = $('<td></td>').append(editBtn).append(' ').append(delBtn);
				
				$('<tr></tr>').append(stuIdTd).append(stuNameTd)
								.append(stuSexTd).append(stuAgeTd)
								.append(stuEmailTd).append(className)
								.append(btnTd).appendTo('#stu_table tbody');
			});
		}
		
		function build_page_info (result) {
			$('#page_info_area').empty();
			var pageInfo = result.extend.pageInfo;
			$('#page_info_area').append('当前第 ' + pageInfo.pageNum + ' 页，共 ' + pageInfo.pages + ' 页，共 ' + pageInfo.total + ' 条记录');
			totalRecord = pageInfo.total;
		}
		
		function build_page_nav (result) {
			$('#page_nav_area').empty();
			var ul = $('<ul></ul>').addClass('pagination');
			//首页
			var firstPage = $('<li></li>').append($('<a></a>').append('首页').attr('href', '#'));
			//上一页
			var prePage = $('<li></li>').append($('<a></a>').append('上一页').attr('href', '#'));
			if (!result.extend.pageInfo.hasPreviousPage) {
				firstPage.addClass('disabled');
				prePage.addClass('disabled');
			} else {
				//添加翻页点击事件
				firstPage.click(function () {
					to_page(1);
				});
				prePage.click(function () {
					to_page(result.extend.pageInfo.pageNum - 1);
				});
			}
			
			//下一页
			var nextPage = $('<li></li>').append($('<a></a>').append('下一页').attr('href', '#'));
			//尾页
			var lastPage = $('<li></li>').append($('<a></a>').append('尾页').attr('href', '#'));
			
			if (!result.extend.pageInfo.hasNextPage) {
				nextPage.addClass('disabled');
				lastPage.addClass('disabled');
			} else {
				//添加翻页点击事件
				nextPage.click(function () {
					to_page(result.extend.pageInfo.pageNum + 1);
				});
				lastPage.click(function () {
					to_page(result.extend.pageInfo.pages);
				});
			}
			
			ul.append(firstPage).append(prePage);
			$.each(result.extend.pageInfo.navigatepageNums, function(index, item){
				var num = $('<li></li>').append($('<a></a>').append(item).attr('href', '#'));
				if (result.extend.pageInfo.pageNum == item) {
					num.addClass('active');
				}
				num.click(function(){
					to_page(item);
				});
				ul.append(num);
			});
			ul.append(nextPage).append(lastPage);
			
			var navEl = $('<nav></nav>').append(ul);
			navEl.appendTo('#page_nav_area');
		}
		
		//点击新增按钮，探出模态框
		$('#stu_add_modal_btn').click(function () {
			//表单重置
			//$('#stuAddModal form')[0].reset();
			form_reset('#stuAddModal form');
			//发送ajax请求，查询出所有班级信息
			getClassName('#stuAddModal select');
			//弹出模态框
			$('#stuAddModal').modal({
				backdrop : 'static'
			});
		});
		
		//查询班级信息 
		function getClassName (ele) {
			$(ele).empty();//先清空下拉列表
			$.ajax({
				url : '${APP_PATH}/getClsName',
				type : 'GET',
				success : function (result) {
					$.each(result.extend.data, function () {
						var optionEle = $('<option></option>').append(this.className).attr('value', this.classId);
						optionEle.appendTo(ele);
					});
				}
			});
		}
		
		//表单校验
		function validate_add_form () {
			//校验姓名
			var regStuName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			var stuName = $('#stuNameId').val();
			if (stuName.trim() == '' || stuName.trim() == null){
				show_validate_msg('#stuNameId', 'error', '学生姓名不能为空');
				return false;
			}
			if (!regStuName.test(stuName)) {
				//alert('学生姓名可以是2-5位中文或3-16位英文和数字组合');
				show_validate_msg('#stuNameId', 'error', '学生姓名可以是2-5位中文或3-16位英文和数字组合');
				return false;
			} else {
				show_validate_msg('#stuNameId', 'success', '');
			}
			//校验邮箱
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			var email = $('#stuEmailId').val();
			if (email.trim() == '' || email.trim() == null){
				show_validate_msg('#stuEmailId', 'error', '邮箱不能为空');
				return false;
			}
			if (!regEmail.test(email)) {
				//alert('邮箱格式错误！');
				show_validate_msg('#stuEmailId', 'error', '邮箱格式错误');
				return false;
			} else {
				show_validate_msg('#stuEmailId', 'success', '');
			}
			return true;
		}
		
		//显示校验信息
		function show_validate_msg (ele, status, msg) {
			//清除当前元素的校验状态
			$(ele).parent().removeClass('has-success has-error');
			$(ele).next('span').text('');
			//添加新状态
			if ('success' == status) {
				$(ele).parent().addClass('has-success');
				$(ele).next('span').text(msg);
			} else if ('error' == status) {
				$(ele).parent().addClass('has-error');
				$(ele).next('span').text(msg);
			}
		}
		
		//清空表单内容及样式
		function form_reset (ele) {
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find('*').removeClass('has-error has-success');
			$(ele).find('.help-block').text('');
		}
		
		//发送ajax请求校验用户名是否可用
		$('#stuNameId').change(function(){
			var stuName = this.value;
			$.ajax({
				url : '${APP_PATH}/checkStuName',
				type : 'POST',
				data : 'stuName=' + stuName,
				success : function (result) {
					if (result.code == 100) {
						show_validate_msg('#stuNameId', 'success', '该姓名可用');
						$('#stu_add_btn').attr('ajax-va', 'success');
					} else {
						show_validate_msg('#stuNameId', 'error', result.extend.errorMsg);
						$('#stu_add_btn').attr('ajax-va', 'error');
					}
				}
			});
		});
		
		//学生保存
		function saveStudent () {
			if (!validate_add_form()) {
				return false;
			};
			//校验姓名是否重复
			if ($('#stu_add_btn').attr('ajax-va') == 'error') {
				return false;
			}
			$.ajax({
				url : '${APP_PATH}/saveStudent',
				type : 'POST',
				data : $('#stuAddModal form').serialize(),
				success : function (result) {
					if (result.code == 100) {
						//隐藏模态框
						$('#stuAddModal').modal('hide');
						//刷新最后一页数据
						to_page(totalRecord);
					} else {
						if (undefined != result.extend.errorFields.stuName) {
							show_validate_msg('#stuNameId', 'error', result.extend.errorFields.stuName);
						}
						if (undefined != result.extend.errorFields.stuEmail) {
							show_validate_msg('#stuEmailId', 'error', result.extend.errorFields.stuEmail);
						}
					}
				}
			});
		}
		
		//编辑
		$(document).on("click",".edit_btn",function(){
			//查询班级信息
			getClassName('#stuUpdateModal select');
			//查询学生信息
			getStudent($(this).attr('edit-id'));
			//把学生Id传给更新按钮
			$('#stu_update_btn').attr('edit-id', $(this).attr('edit-id'));
			$('#stuUpdateModal').modal({
				backdrop : 'static'
			});
		});
		
		//查询学生信息
		function getStudent(id){
			form_reset('#stuUpdateModal form');
			$.ajax({
				url : '${APP_PATH}/getStudent/'+id,
				type : 'GET',
				success : function (result) {
					var item = result.extend.student;
					$('#stuNameId_update').text(item.stuName);
					$('#stuUpdateModal input[type=number]').val(item.stuAge);
					$('#stuUpdateModal input[name=stuSex]').val([item.stuSex]);
					$('#stuEmailId_update').val(item.stuEmail);
					$('#stuUpdateModal select').val([item.stuCname]);
				}
			});
		}
		
		function updateStudent(){
			//校验邮箱
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			var email = $('#stuEmailId_update').val();
			if (email.trim() == '' || email.trim() == null){
				show_validate_msg('#stuEmailId_update', 'error', '邮箱不能为空');
				return false;
			}
			if (!regEmail.test(email)) {
				//alert('邮箱格式错误！');
				show_validate_msg('#stuEmailId_update', 'error', '邮箱格式错误');
				return false;
			} else {
				show_validate_msg('#stuEmailId_update', 'success', '');
			}
			var id = $('#stu_update_btn').attr('edit-id');
			$.ajax({
				url : '${APP_PATH}/updateStudent/'+id,
				type : 'POST',
				data : $('#stuUpdateModal form').serialize() + '&_method=PUT',
				success : function (result) {
					
				}
			});
		}
		
	</script>
</body>
</html>