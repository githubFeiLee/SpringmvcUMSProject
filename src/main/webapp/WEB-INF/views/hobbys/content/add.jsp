<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
label {
	display: block;
	font-size: 12px;
}

.input-label span {
	color: red;
	float: right;
}
.fileLabel span{
	color: red;
	float: right;
}

.error-input {
	border: red solid 1px;
}
.checkbox-content{
	font-size:14px;
}
.error-file{
	border: red solid 1px;
}
</style>

<!-- 引入日期选择器插件 -->
<%@ include file="/commons/taglibs.jsp"%>
<script src="${ctx}/plugins/validate/jquery-html5Validate-min.js"></script>
<script src="${ctx}/plugins/jquery-form/jquery.form.min.js"></script>
<script src="${ctx}/plugins/air-datepicker/js/datepicker.min.js"></script>
<!-- 日期选择器引入中文语言 -->
<script src="${ctx}/plugins/air-datepicker/js/i18n/datepicker.zh.js"></script>
<section class="main-panel hobbyPanel m-0">
	<c:if test="${hobby.id==null }">
	<h4 class="form-title text-center">添加用户</h4>
	</c:if>
	<c:if test="${hobby.id>0 }">
	<h4 class="form-title text-center">编辑用户</h4>
	</c:if>
	<form name="hobbyForm" action="${ctx}/hobby/save" method="post" class="form">
		<div class="form-input row p-0 m-0">
			<div class="form-group col-md-6 m-0">
				<div class="row">
				<input type="hidden"
							name="id" class="form-control" id="validationDefault01"
							value="${hobby.id }">
				</div>
				<div class="column">
					<div class="col-md-12 mb-3">
						<label class="input-label" for="validationDefault03">姓名</label> <input
							type="text" class="form-control" name="name" value="${hobby.name }"
							id="validationDefault03" placeholder="请输入姓名...">
					</div>
					<div class="col-md-12 mb-3">
						<label class="input-label" for="validationDefault03">姓名</label> <textarea
							 class="form-control" name="description" 
							id="validationDefault03" placeholder="请输入姓名...">${hobby.description }</textarea>
					</div>
					
					<div class="col-md-12 mb-3">
						<label class="input-label" for="validationDefault03">创建时间</label> <input text="text"
							class="form-control birthday" value="${hobby.createDate }"
							name="createDate" id="" data-language="zh"
							placeholder="请选择创建时间...">
					</div>

				</div>
				
				
			</div>
		</div>
		<hr>
		<div class="d-flex justify-content-center">

			<button type="button"
				class="btn btn-primary btn-sm mr-5 save-hobby-btn">保存</button>
			<button type="reset" class="btn btn-secondary btn-sm">重置</button>
			<button type="button"
				class="btn btn-secondary btn-sm bg-warning ml-5">返回</button>

		</div>
	</form>
</section>

<script type="text/javascript">
	$(function() {
		$(".birthday").datepicker({
			dateFormat : "yyyy-mm-dd",
			autoClose : true,
			"view":'years' 
		});
		
			var $hobbyAddPanel = $(".hobbyPanel");
			var $hobbyContentForm = $hobbyAddPanel.find(".form");

			// 初始化表单提交
			$hobbyContentForm.html5Validate(function() {
				// 对表单进行提交
				// jquery-form的异步提交方式
				$hobbyContentForm.ajaxSubmit({
					success : function() {
						// 刷新页面
						triggerCurrentMenu();
					}
				});
			}, {
				// 对表单数据做有效性验证
				validate : function() {
					var hobbyname = $hobbyContentForm
							.find("input[name='hobbyname']");
					var password = $hobbyContentForm
							.find("input[name='password']")
					var name = $hobbyContentForm.find("input[name='name']")
					var birthday = $hobbyContentForm
							.find("input[name='birthday']")
					var email=$hobbyContentForm.find("input[name='email']")
					var $sex = $hobbyContentForm.find("select[name='sex']")
					var sexSelected=$sex.find("option:selected")
					var $profession=$hobbyContentForm.find("select[name='profession.id']")
					var profession=$profession.find("option:selected")
					var hobby = $hobbyContentForm.find("input[name='hobby.id']:checked")
					var inputHobby=$hobbyContentForm.find(".inputHobby")
					var file = $hobbyContentForm.find("input[name='imageFile']")
					if ($.trim(hobbyname.val()) === "") {
						return showInputTip(hobbyname, "请输入名称");
					} else {
						hideInputTip(hobbyname);
					if ($.trim(password.val()) === "") {
						return showInputTip(password, "请输入密码");
					} else {
						hideInputTip(password);
					}
					if ($.trim(name.val()) === "") {
						return showInputTip(name, "请输入姓名");
					} else {
						hideInputTip(name);
					}
					if ($.trim(birthday.val()) === "") {
						return showInputTip(birthday, "请选择生日");
					} else {
						hideInputTip(birthday);
					}
					if($.trim(email.val())===""){
						return showInputTip(email, "请输入邮箱");
					}else{
						hideInputTip(email)
					}
					if($.trim(sexSelected.val())===""){
						return showInputTip($sex, "请选择性别");
					}else{
						hideInputTip($sex)
					}
					if($.trim(profession.val())===""){
						return showInputTip($profession, "请选择职业");
					}else{
						hideInputTip($profession)
					}

					if (hobby.length === 0) {
						$(".inputHobby span").remove();
						$(".inputHobby").append("<span>" +"请选择爱好" + "</span>");
						return false;
					} else {
						$(".inputHobby span").remove();
						// 循环遍历被选中的复选框，并填充有效的name属性
						
					}
					if($.trim(file.val())===""){
						file.addClass("error-file")
						$(".fileLabel").append("<span>" +"请选择头像文件" + "</span>");
						return false;
					}else{
						$(".fileLabel span").remove();
					}
					// 当表单数据验证全部通过之后，需要返回true，告知插件验证通过，可以进行表单提交
					return true;
				}
				}
			});

			// 保存角色
			$hobbyAddPanel.find(".save-hobby-btn").on("click", function() {
				$hobbyContentForm.trigger("submit");
			});

			// 取消保存
			$hobbyAddPanel.find(".cancel-btn").on("click", function() {
				// 刷新页面
				triggerCurrentMenu();
			});
		
	})
</script>
