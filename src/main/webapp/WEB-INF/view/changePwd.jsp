<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    <%request.setAttribute("info", request.getSession().getAttribute("loginfo")); %>
    <% request.setAttribute("path", request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
	 	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
		<link rel="stylesheet" href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css" media="screen"/>
		<link rel="stylesheet" type="text/css" href="${path}/static/bootstrap-3.3.7-dist/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="${path}/static/bootstrap-3.3.7-dist/css/default.css">
		<link rel="stylesheet" type="text/css" href="${path}/static/bootstrap-3.3.7-dist/css/styles.css">
		<script type="text/javascript" src="${path }/static/bootstrap-3.3.7-dist/jquery-3.2.1.js"></script>
		<script type="text/javascript" src="${path}/static/bootstrap-3.3.7-dist/js/bootstrap.js""></script>
		<title>密码重置</title>
	</head> 
	
	<style>
	
	.text1{
	 font-style: inherit;
	 text-align: center;
	 line-height:420%;
	 font-size: 10px;
	}
	#toBack{
		font-size: 5px;
		margin-top: 30%;
		}
	@media (min-width: 768px) {
			.text1 {
			 font-size:20px;
			 font-style: inherit;
			 text-align: center;
			 line-height:420%;"
			}
		
	
	#toBack{
		font-size: 15px;
		margin-top: 50%;
		}
				}
		@media (min-width: 992px) {
		.text1 {
			font-size:25px;
		 	font-style: inherit;
		 	text-align: center;
	 		line-height:420%;"
		}
	
			#toBack{
		font-size: 15px;
		margin-top: 50%;
			}
		}
	
	.linear{   
	        width:100%;   
	        height:600px;   
	        FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#ACD6FF,endColorStr=#ECF5FF); /*IE 6 7 8*/   
	        background: -ms-linear-gradient(top, #ACD6FF,  #ECF5FF);        /* IE 10 */  
	        background:-moz-linear-gradient(top,#ACD6FF,#ECF5FF);/*火狐*/   
	        background:-webkit-gradient(linear, 0% 0%, 0% 100%,from(#ACD6FF), to(#ECF5FF));/*谷歌*/   
	        background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#ACD6FF), to(#ECF5FF));      /* Safari 4-5, Chrome 1-9*/  
	        background: -webkit-linear-gradient(top, #ACD6FF, #ECF5FF);   /*Safari5.1 Chrome 10+*/  
	        background: -o-linear-gradient(top, #ACD6FF, #ECF5FF);  /*Opera 11.10+*/  
	    }   
	</style>
	<body class="linear">
		<div class="container">
			<div class="row">
				<div class="col-md-5  col-md-offset-2 col-xs-6" style="height:85px;"><img class="img-responsive" src="${path}/static/img/banner.png"></div>
				<div class="col-md-3  col-xs-4 text1">研究生信息管理</div>
				<div class="col-md-1 col-xs-2"><button id="toBack" class="btn btn-primary">首页</button></div>
			</div>
		</div>
		
		<!-- 模态框 -->
		
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">提示信息</h4>
		      </div>
		      <div class="modal-body" style="text-align: center">
		       <span id="showmsg" class="glyphicon glyphicon-star" style="color: red;font-size: 18px;">身份验证</span>
		       
		       <form id="form1" class="form-horizontal" style="text-align: center">
					  <div class="form-group" id="div1">
					    <label for="name" class="col-sm-2 col-sm-offset-2 control-label">姓名</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="name" name="stuName" placeholder="姓名" required="required">
					    </div>
					  </div>
					  <div class="form-group" id="div2">
					    <label for="idcard" class="col-sm-2 col-sm-offset-2 control-label">身份证号</label>
					    <div class="col-sm-5">
					      <input type="text" name="stuIdcard" class="form-control" id="idcard" placeholder="身份证号" required="required">
					      
					    </div>
					  </div>
					  <input type="hidden" id="stuId" name="stuId">
					  <!-- 默认隐藏项 -->
					  
					   <div class="form-group" style="display: none;" id="div3">
					    <label for="pwd" class="col-sm-2 col-sm-offset-2 control-label">密码</label>
					    <div class="col-sm-5">
					      <input type="password" class="form-control" name="pwd" id="pwd" placeholder="8位及以上的数字或字母组合" required="required" disabled="disabled" >
					    </div>
					  </div>
					  <div class="form-group" style="display: none;" id="div4">
					    <label for="rePwd" class="col-sm-2 col-sm-offset-2 control-label">确认密码</label>
					    <div class="col-sm-5">
					      <input type="password" class="form-control"  name="rePwd" id="rePwd" placeholder="确认密码" required="required" disabled="disabled">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <span id="showmsg"></span>
					    <div class="col-sm-offset-5">
					      <button class="btn btn-primary" type="button" id="checkBtn">校验</button>
					    </div>
					  </div>
					</form>
							       
							       
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button id="confirmBtn" type="button" class="btn btn-primary" disabled="disabled">确认重置</button>
		      </div>
		    </div>
		  </div>
		</div>
				
		
</body>
<script type="text/javascript">
$(function(){
	$("#myModal").modal(function(){
		backdrop:'static'
	});
});

$("#toBack").click(function(){
	window.location.href="${path}/index.jsp";
});

$("#idcard").blur(function(){
	var val = $(this).val();
});

$("#checkBtn").click(function(){
	var f = checkId($("#idcard").val());
	
	if(f){
	$.ajax({
		url:"${path }/searchStu",
		type:"POST",
		data:$("#form1").serialize(),
		success:function(data){
			var msg = data.msg;
			if(msg=="success"){
				var stuId = data.stuId;
				$("#stuId").val(stuId);
				$("#div1").remove();
				$("#div2").remove();
				$("#div3").css("display","block");
				$("#div4").css("display","block");
				$("#pwd").removeAttr("disabled");
				$("#checkBtn").remove();
				$("#showmsg").removeClass("glyphicon glyphicon-remove").addClass("glyphicon glyphicon-star").text("密码重置");
			}else{
				$("#showmsg").css("color","red").text("校验失败,请重试").addClass("glyphicon glyphicon-remove");
			}
		}
		
	});
	}
});

function checkId(sId){
	var flag =true;
	var reg = /(^\d{18}$)|(^\d{17}(\d|X|x)$)/; 
	if(reg.test(sId) === false) 
	{ 
		 $("#showmsg").css("color","red").text("身份证格式非法").addClass("glyphicon glyphicon-remove");
	flag = false; 
	} 
 
	 return flag;
}


$("#idcard").change(function(){

	checkId($(this).val());
	
});
$("#pwd").keyup(function(){
	$("#showmsg").removeClass("glyphicon glyphicon-remove").addClass("glyphicon glyphicon-star").text("密码重置");
	var pwd = $(this).val();
	f =true;
	var reg = /[a-zA-Z0-9]{8,}/;
	if(reg.test(pwd)==false){
		$("#showmsg").removeClass("glyphicon glyphicon-ok").addClass("glyphicon glyphicon-remove").css("color","red").text("密码格式不正确");
		f = false;
		$("#rePwd").attr("disabled","disabled");
	}
	if(pwd==""){
		$("#showmsg").css("color","red").text("密码为空请重新填写").addClass("glyphicon glyphicon-remove");
		f = false;
		$("#rePwd").attr("disabled","disabled");
	}
	if(f){
		$("#rePwd").removeAttr("disabled");
		$("#showmsg").removeClass("glyphicon glyphicon-remove").addClass("glyphicon glyphicon-ok").css("color","green").text("密码可用");
	}
});

$("#rePwd").keyup(function(){
	$("#showmsg").removeClass("glyphicon glyphicon-remove").addClass("glyphicon glyphicon-star").text("密码重置");
	var f = checkPwd($("#pwd").val(),$(this).val());
	var pwd = $("#pwd").val();
	var reg = /[a-zA-Z0-9]{8,}/;
	if(reg.test($(this).val())==false){
		$("#showmsg").removeClass("glyphicon glyphicon-ok").addClass("glyphicon glyphicon-remove").css("color","red").text("密码格式不正确");
		f  = false;
	}
	if($(this).val()!=pwd){
		$("#showmsg").css("color","red").text("两次输入的密码不一致").addClass("glyphicon glyphicon-remove");
		f = false;
	}
	if(f){
		$("#confirmBtn").removeAttr("disabled");
		$("#showmsg").text("密码相同").removeClass("glyphicon glyphicon-remove").addClass("glyphicon glyphicon-ok").css("color","green");
	}else{
		$("#confirmBtn").attr("disabled","disabled");
	}
});

function checkPwd(obj1,obj2){
	var flag = false;
	if(obj1==""&&obj2==""){
		$("#confirmBtn").attr("disabled","disabled");
	}
	if(obj1===obj2&&obj1!=""&&obj2!=""){
		flag = true;
	}
	
	return flag;
}


$("#confirmBtn").click(function(){
	var flag = checkPwd($("#pwd").val(),$("#rePwd").val());
	$.ajax({
		url:"${path}/updatePwd",
		type:"POST",
		data:$("#form1").serialize(),
		success:function(data){
			if(data.msg=="success"){
			$("#showmsg").text("修改成功").css("color","green").addClass("glyphicon glyphicon-ok");
			
				window.location.href="${path}/index.jsp";
		
			}else{
			$("#showmsg").text("修改失败").css("color","red").addClass("glyphicon glyphicon-remove");
			$("#pwd").empty();
			$("#rePwd").empty();
			}
		}
	});
});

</script>
</html>