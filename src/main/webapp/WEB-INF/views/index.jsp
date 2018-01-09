<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="实训,教育,IT">
<meta name="description" content="轻实训案例">
<meta name="author" content="轻实训">
<!-- 引入 jQuery 库 -->
<script src="${ctx}/plugins/jquery-2.2.4.min.js"></script>

<link rel="stylesheet" href="${ctx}/plugins/bootstrap/css/bootstrap.css">
<script src="${ctx}/plugins/bootstrap/js/popper.min.js"></script>
<script src="${ctx}/plugins/bootstrap/js/bootstrap.js"></script>
<script src="${ctx}/plugins/jqpaginator.min.js"></script>
<script src="${ctx}/plugins/validate/jquery-html5Validate-min.js"></script>
<script src="${ctx}/plugins/jquery-form/jquery.form.min.js"></script>
<script src="${ctx}/plugins/air-datepicker/js/datepicker.min.js"></script>
<!-- 日期选择器引入中文语言 -->
<script src="${ctx}/plugins/air-datepicker/js/i18n/datepicker.zh.js"></script>
<!-- 引入日期选择器插件 -->
<link href="${ctx}/plugins/air-datepicker/css/datepicker.min.css"
	rel="stylesheet" type="text/css">
<!-- 引入自定义样式文件 -->
<link rel="stylesheet" href="${ctx}/css/style.css">
<style>
.title {
	line-height: 70px;
}
</style>
</head>

<body>
	<header>
	<h2 class="title">用户管理系统</h2>
	<nav> <a href="#">帮助</a> <a href="#">退出</a> </nav> </header>
	<div class="content">
		<aside id="left" class="left">
		<div class="menu">
			<a href="javascript:;" id="add-user" data-url="/user/list"
				class="menu-item active">用户管理</a> 
				<a href="#" class="menu-item" data-url="/description/list">职业管理</a>
			<a href="javascript:;" class="menu-item" data-url="/hobbys/list">爱好管理</a>
		</div>
		<div class="head-avatar">
			<img src="images/avatar.png" alt="头像" />
			<h5>当前登录用户</h5>
		</div>
		</aside>
		<div id="right" class="right">
			<div class="copyright"></div>

		</div>

	</div>


	<script type="text/javascript">
		// 加载主页面内容
		function loadMainContent(url, params) {
			var $targes = $("#right")
			$targes.find(".copyright").load("${ctx}" + url, params);
		}
		// 触发当前菜单点击
		function triggerCurrentMenu() {
			var $content = $(".content")
			
			$content.find(".menu-item.active").trigger("click");
		}
		// 显示验证提示
		function showInputTip($input, value) {
			var $parent = $input.parent();
			$(".input-lable").addClass("error-group");
			$parent.find(".input-label span").remove();
			$parent.find(".input-label").append("<span>" + value + "</span>");
			$input.addClass("error-input");
			return false;
		}
		

		// 隐藏验证提示
		function hideInputTip($input) {
			var $parent = $input.parent();
			$parent.removeClass("error-group");
			$input.removeClass("error-input")
			$parent.find(".input-label span").remove();
		}
		function doAction(url, params) {
			$.ajax({
				url : "${ctx}" + url,
				type : "POST",
				dataType : "TEXT",
				data : params,
				success : function() {
					alert("删除成功！");
					triggerCurrentMenu();
				}
			})
		}
		$(function() {
			var url;
			var $right = $("#right");
			var $copyright = $right.find(".copyright");
			var $content = $(".content")
			
			$content.find(".menu-item").on("click", function() {
				url = $(this).data("url")
				$content.find(".menu-item").removeClass("active");
			$(this).addClass("active");
				loadMainContent(url,{currentPage:1});
			}).first().click();
			//添加页面
			$copyright.on("click", "#to-add", function() {
				url = $(this).data("url")
				loadMainContent(url, {
					userId : -1
				})
			})
			$copyright.on("click", "#to-hobby-add", function() {
				url = $(this).data("url")
				loadMainContent(url, {
					hobbyId : -1
				})
			})
			$copyright.on("click", ".to-edit-button", function() {
				url = $(this).data("url")
				var userId = $(this).data("id");
				loadMainContent(url, {
					userId : userId
				})
			})
			$copyright.on("click", ".to-edit-hoobybutton", function() {
				url = $(this).data("url")
				var hobbyId = $(this).data("id");
				loadMainContent(url, {
					hobbyId : hobbyId
				})
			})
			$copyright.on("click", ".delete-user", function() {
				url = $(this).data("url")
				var userId = $(this).data("id");
				doAction(url, {
					userId : userId
				})
			})
			$copyright.on("click", ".delete-hobby", function() {
				url = $(this).data("url")
				var hobbyId = $(this).data("id");
				doAction(url, {
					hobbyId : hobbyId
				})
			})
		})

		
	</script>

</body>
</html>