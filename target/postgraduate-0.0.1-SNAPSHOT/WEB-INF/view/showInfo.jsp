<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%request.setAttribute("info", request.getSession().getAttribute("loginfo")); %>
     <%request.setAttribute("path", request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>信息完善</title>

<style>
	.form{
		
		width: 200px;
	}
	.lable{
	width: 100px;
	}
	body{
	color: black;
	}
</style>
</head>
<body>
<div id="tab1" style="text-align: center">
	<form id="form3"  method="post" enctype="multipart/form-data">
	<div class="form-group has-success">
	<label class="col-md-2 col-xs-3 col-xs-offset-3 col-md-offset-0 control-label">姓名</label>
	<div class="col-md-4 col-xs-6">
 	<input type="text" class="form-control form" id="name"  value="${info.info.stuName }" readonly="readonly">
 	</div>
	</div>
		
	<div id="telClass" class="form-group has-success">
	  <label class=" col-md-2  col-xs-3 col-xs-offset-3 col-md-offset-0 control-label">电话</label>
	  <div class="col-md-3 col-xs-6">
	  <span id="telspan"></span>
	  <input type="text" class="form-control form" id="tel" name="stuTel" value="${info.info.stuTel }" autofocus="autofocus" required="required">
	  </div>
	</div>
	<div class="col-md-12"><br></div>
	<div id="idcardClass" class="form-group has-warning">
	  <label class="col-md-2 col-xs-3 col-xs-offset-3 col-md-offset-0  control-label">身份证号</label>
	  <div class="col-md-3 col-xs-6">
	  <span id="idspan"></span>
	  <input type="text" class="form-control form" name="stuIdcard" id="idcard" value="${info.info.stuIdcard }" required="required" autofocus="autofocus" placeholder="必填">

	  </div>
	  <div class="col-md-1 col-xs-12"></div>
	</div>
		
	<div id="emailClass" class="form-group has-warning">
	 <label class="col-md-2 col-xs-3 col-xs-offset-3 col-md-offset-0  control-label">邮箱</label>
	 <div class="col-md-3 col-xs-6">
	  <span id="emailspan"></span>
	  <input type="text" class="form-control form" name="stuEmail" id="email" value="${info.info.stuEmail }" required="required" style="imeMode:inactive" autofocus="autofocus" placeholder="必填">
	  </div>
	</div>
	<div class="col-md-12"><br></div>
	<div id="qqClass" class="form-group has-warning" >
	 <label class="col-sm-2 col-md-2  col-xs-3 col-xs-offset-3 col-md-offset-0 control-label">QQ</label>
	 <div class="col-md-3 col-xs-6">
	  <span id="qqspan"></span>
	  <input type="number" class="form-control form" name="stuQq" id="qq" placeholder="qq和微信至少填写一项" value="${info.info.stuQq }" autofocus="autofocus">
	  </div>
	  <div class="col-md-1"></div>
	</div>
	<div id="wechatClass" class="form-group has-warning">
	 <label class="col-sm-2 col-md-2 col-xs-3 col-xs-offset-3 col-md-offset-0 control-label">微信</label>
	 <div class="col-md-3 col-xs-6">
	  <span id="wechatspan"></span>
	  <input type="text" class="form-control form" name="stuWechat" id="wechat" placeholder="qq和微信至少填写一项"  value="${info.info.stuWechat }" autofocus="autofocus">
	  </div>
	</div>
	<div class="col-md-12 col-xs-12"><br></div>
	<div id="honor" class="form-group has-warning" style="line-height: 100px">
	 <label class="col-sm-2 col-md-2 col-xs-4 col-xs-offset-2 col-md-offset-0 control-label">所获荣誉</label>
	 <div class="col-md-9 col-xs-6">
	  <textarea class="form-control" rows="5" name="stuHonor" id="honor">1.XXXX--按照该格式书写,没有则填写无(附件为(考号.zip)命名的压缩包)</textarea>
	  </div>
	  <br>
	</div>
	<div class="col-md-12 col-xs-12"><br></div>
 
  	 <div id="other" class="has-warning">
	 <label class="col-sm-2 col-md-2 col-xs-3 col-xs-offset-3 col-md-offset-0 control-label">附件上传</label>
	
	  <div class="col-md-4 col-xs-6">
	  <input type="file" id="file" name="file">
	  <div class="col-md-2">
	  </div>
	  </div>
	 
	</div>
	<div class="col-md-12"></div>
	<div class="col-md-12"> <span id="otherspan" style="font-size: 16px;text-align: center"></span></div>
	<div class="col-md-12"><br></div>
	<div class="col-md-2 col-md-offset-5">
	
	<button class="btn btn-primary" type="button" id="fileupload">提交</button>
	</div>
	<input name="stuId" type="hidden" value="${info.info.stuId }">
	</form>
  </div>
  
 
<input type="hidden" id="hide11" value="1">
<input type="hidden" id="hide22">
<input type="hidden" id="hide33">
<input type="hidden" id="hide44">
<input type="hidden" id="hide55">

</div>
</div>
</div>

			<div class="modal fade" id="modal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" >
				  <div class="modal-dialog" role="document" style="width:350px;text-align: center;">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
				        <h4 class="modal-title" id="myModalLabel">信息提示</h4>
				      </div>
				      <div class="modal-body">
				      		<br>
				      		<span id="msgn" style="text-align: center;font-size: 18px"></span>
				      </div>
				      <div class="modal-footer">
				        <input type="hidden" name="role">
				        <button type="button" id="btn2" class="btn btn-primary">确定</button>
				      </div>
				    </div>
				  </div>
				</div>
			

<script type="text/javascript">
$("#idcard").keyup(function(){
	var f =  checkId($(this).val());
	if(f){
		$("#idcardClass").removeClass("has-warning").removeClass("has-error").addClass("has-success");
		$("#hide22").val(1);
		
	}else
		{
		$("#idcardClass").removeClass("has-success").removeClass("has-warning").addClass("has-error");
		$("#hide22").val(0);
		}
	return f;
});

$("#idcard").blur(function(){
	var f =checkId($(this).val());
	if(f){
		$("#idspan").removeClass("glyphicon glyphicon-remove").css("color","green").addClass("glyphicon glyphicon-ok form-control-feedback");
	}else{
		$("#idspan").removeClass("glyphicon glyphicon-ok").css("color","red").addClass("glyphicon glyphicon-remove form-control-feedback");
	}
});


function checkId(obj){
	var flag =true;
	var reg = /(^\d{18}$)|(^\d{17}(\d|X|x)$)/; 
	if(reg.test(obj) == false) 
	{ 
	flag = false; 
	} 
	 return flag;
}

function checkTel(obj){
	var reg = /^1[3|4|5|8|7|9][0-9]\d{8}$/;
	var flag = reg.test(obj);
	return flag;
}

$("#tel").blur(function(){
	var f  =checkTel($(this).val());
	if(f){
		$("#telspan").removeClass("glyphicon glyphicon-remove").css("color","green").addClass("glyphicon glyphicon-ok form-control-feedback");
	}else{
		$("#telspan").removeClass("glyphicon glyphicon-ok").css("color","red").addClass("glyphicon glyphicon-remove form-control-feedback");
	}
});

function checkEmail(obj){
	var reg  = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/ 
	var flag = reg.test(obj);
	return flag;
		
}



$("#tel").keyup(function(){
	var f = checkTel($(this).val());
	if(f){
		$("#telClass").removeClass("has-warning").removeClass("has-error").addClass("has-success");
		$("#hide11").val(1);
	}else{
		$("#telClass").removeClass("has-warning").removeClass("has-success").addClass("has-error");
		$("#hide11").val(0);
	}
});

$("#email").keyup(function(){
	var f = checkEmail($(this).val());
	if(f){
		$("#emailClass").removeClass("has-warning").removeClass("has-error").addClass("has-success");
		$("#hide33").val(1);
	}else{
		$("#emailClass").removeClass("has-warning").removeClass("has-success").addClass("has-error");
		$("#hide33").val(0);
	}
});

$("#email").blur(function(){
	var f = checkEmail($(this).val());
	if(f){
		$("#emailspan").removeClass("glyphicon glyphicon-remove").css("color","green").addClass("glyphicon glyphicon-ok form-control-feedback");
	}else{
		$("#emailspan").removeClass("glyphicon glyphicon-ok").css("color","red").addClass("glyphicon glyphicon-remove form-control-feedback");
	}
});


$("#qq").keyup(function(){
	var f =($(this).val()!="");
	if(f){
		$("#hide44").val(1);
		$("#qqspan").removeClass("glyphicon glyphicon-romove").css("color","white");
	}else{
		$("#hide44").val(0);
	}
});

$("#wechat").keyup(function(){
	var f  =($(this).val()!="");
	if(f){
		$("#hide55").val(1);
		$("#wechatspan").removeClass("glyphicon glyphicon-romove").css("color","white");
	}else{
		$("#hide55").val(0);
	}
});
$("#fileupload").click(function(){
	var f1 = $("#hide22").val()=="1";
	var f2 = $("#hide11").val()=="1";
	var f3 = $("#hide33").val()=="1";
	var f4 =$("#hide44").val()=="1";
	var f5=$("#hide55").val()=="1";
	var f6=$("#file").val()!="";
	var name = $("#file").val();
	var index = name.indexOf(".");
	var last = name.lastIndexOf("\\");
	var ext = name.substring(last+1,index);
	var rex = /^[0-9]{15}$/;
	if(rex.test(ext)==false){
		f6=false;
	}
	if(f1==false){
	$("#idspan").removeClass("glyphicon glyphicon-ok").css("color","red").addClass("glyphicon glyphicon-remove form-control-feedback");
	}if(f2==false){
		$("#telspan").removeClass("glyphicon glyphicon-ok").css("color","red").addClass("glyphicon glyphicon-remove form-control-feedback");
	}if(f3==false){
		$("#emailspan").removeClass("glyphicon glyphicon-ok").css("color","red").addClass("glyphicon glyphicon-remove form-control-feedback");
	}if((f4||f5)==false){
		$("#qqspan").removeClass("glyphicon glyphicon-ok").css("color","red").addClass("glyphicon glyphicon-remove form-control-feedback");
		$("#wechatspan").removeClass("glyphicon glyphicon-ok").css("color","red").addClass("glyphicon glyphicon-remove form-control-feedback");
	}
	if(f6==false){
		$("#other").removeClass("has-success").removeClass("has-warning").addClass("has-error");
		$("input[name='file']").css("color","red").text("文件未上传或命名不正确");
		$("#otherspan").css("color","red").text("文件未上传或命名不正确");
	}
	
	/*暂时不对文件的上传进行处理  */
	if(f1&&f2&&f3&&(f4||f5)){
		var formdata = new FormData($('#form3')[0]);
		$.ajax({
			
			url:"${path}/upload",
			type:"POST",
			data:formdata,
			async:false,
			processData:false,
            contentType:false,
            cache:false,
			success:function(data){
				var msg = data.msg;
				if(data.msg=="success"){
					$("#msgn").text("信息修改成功").css("color","green");	
				}else{
					$("#msgn").text("信息修改失败,请重试").css("color","red");
				}
				
				$("#modal2").modal(function(){
					backdrop:'static'
				});
				$("#btn2").click(function(){
					
				
					if(msg=="success"){
						
						
						$('#modal2').on('hidden.bs.modal', function () {
							var stuId = "${info.info.stuId}";
							var state = "${info.info.stuState}";
							if(state=="1"){
								$.ajax({
									url:"${path}/updateType?stuId="+stuId,
									type:"GET",
									success:function(data){
										
									}
								});
							}
							
							/* $("#main").load("updateType?stuId=${info.info.stuId}"); */
							   
						});
						 
						$("#modal2").modal('hide');
					}
				});
			}
		});
	}
	
});

</script>

</body>
</html>