<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%request.setAttribute("managerloginfo", request.getSession().getAttribute("managerloginfo")); %>
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
<script type="text/javascript" src="${path}/static/bootstrap-3.3.7-dist/jquery.form.js"></script>
</head>
<body>
<div id="tab1" style="text-align: center">
	<form id="form3"  method="post" action="${path }/updateTeachInfoFir">
	<div class="form-group has-success">
	<label class="col-md-2 col-xs-3 col-xs-offset-3 col-md-offset-0 control-label">姓名</label>
	<div class="col-md-4 col-xs-6">
 	<input type="text" class="form-control form" id="name" name="managerName"  value="${managerloginfo.info.managerName }" required="required">
 	</div>
	</div>
		
	<div id="telClass" class="form-group has-success">
	  <label class=" col-md-2  col-xs-3 col-xs-offset-3 col-md-offset-0 control-label">电话</label>
	  <div class="col-md-3 col-xs-6">
	  <span id="telspan"></span>
	  <input type="text" class="form-control form" id="tel" name="managerTel" value="${managerloginfo.info.managerTel }" autofocus="autofocus" required="required">
	  </div>
	</div>
	<div class="col-md-12"><br></div>

	<div id="idcardClass" class="form-group has-warning">
    <label  class="col-md-2 col-xs-3 col-xs-offset-3 col-md-offset-0  control-label" >性别</label>
   <div class="col-md-2 col-xs-6">
   <select class="form-control" name="managerSex" id="select1">
  <option value="男">男</option>
  <option value="女">女</option>
</select>
	  <span id="idspan"></span>
	</div>
	  </div>

	<div id="emailClass" class="form-group has-warning">
	 <label class="col-md-2 col-xs-3 col-xs-offset-3 col-md-offset-2  control-label">职称</label>
	 <div class="col-md-3 col-xs-6">
	  <span id="emailspan"></span>
	    <select class="form-control" id="select2" name="managerDetail">
		  <option value="教授">教授</option>
		  <option value="副教授">副教授</option>
		   <option value="讲师">讲师</option>
		   <option value="其他">其他</option>
		</select>
	  </div>
	</div>
	
	<div class="col-md-12"><br></div>
	
	<div id="qqClass" class="form-group has-warning" >
	 <label class="col-sm-2 col-md-2  col-xs-3 col-xs-offset-3 col-md-offset-0 control-label">导师类型</label>
	 <div class="col-md-2 col-xs-6">
	  <span id="qqspan"></span>
	 <select class="form-control" id="select3" name="managerMentortype">
  <option value="硕士导师">硕导</option>
  <option value="博士导师">博导</option>
  <option value="其他">其他</option>
</select>
	  </div>
	  <div class="col-md-1"></div>
	</div>
	
	
	<div id="wechatClass" class="form-group has-warning">
	 <label class="col-sm-2 col-md-2 col-xs-3 col-xs-offset-3 col-md-offset-1 control-label">专业</label>
	 <div class="col-md-3 col-xs-6">
	  <span id="wechatspan"></span>
	  <select class="form-control" id="select4" name="managerMajor">
		  <option value="计算机软件与理论">计算机软件与理论</option>
		  <option value="计算机应用技术">计算机应用技术</option>
		   <option value="计算机系统结构">计算机系统结构</option>
		   <option value="计算机技术">计算机技术</option>
		   <option value="软件工程">软件工程</option>
		   <option value="情报学">情报学</option>
		</select>
	  </div>
	</div>
	
	
	<div class="col-md-12 col-xs-12"><br></div>
	<div id="honor" class="form-group has-warning" >
	 <label class="col-sm-2 col-md-2 col-xs-4 col-xs-offset-2 col-md-offset-0 control-label">研究方向</label>
	 <div class="col-md-4 col-xs-6">
	 
	<input type="text" class="form-control form" name="managerCond" id="wechat"   value="${managerloginfo.info.managerCond}" autofocus="autofocus" required="required">
	  </div>
	  <br>
	</div>
	<div id="mangerpwd" class="form-group has-warning" >
	 <label class="col-md-2 col-xs-3 col-xs-offset-3 col-md-offset-0 control-label" >账户密码</label>
	 <div class="col-md-4 col-xs-6">
	 
	<input type="password" class="form-control form" name="managerPwd" id="pwd"  autofocus="autofocus" required="required">
	  </div>
	  <br>
	</div>
	<div class="col-md-12 col-xs-12"><br></div>
 
	<div class="col-md-12"><br></div>
	<div class="col-md-2 col-md-offset-5">
	<button class="btn btn-primary" type="button" id="confirm">提交</button>
	</div>
	<input name="managerId" type="hidden" value="${managerloginfo.info.managerId }">
	</form>
  </div>


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

$(function(){
	
	var sex = "${managerloginfo.info.managerSex}";
	$("#select1").val(sex);
	var detail = "${managerloginfo.info.managerDetail}";
	$("#select2").val(detail);
	var mentor ="${managerloginfo.info.managerMentortype}";
	$("#select3").val(mentor);
	var major = "${managerloginfo.info.managerMajor}";
	$("#select4").val(major);
});
$("#confirm").click(function(){
	 $("#form3").ajaxSubmit(function (data) {
	        var msg = data.msg;
	        if(msg=="success"){
	        	$("#msgn").css("color","green").text("修改成功");
	        }else{
	        	$("#msgn").css("color","red").text("网络错误,请重试");
	        }
	        $("#modal2").modal(function(){
	        	backdrop:'static'
	        });
	    });
});

$("#btn2").click(function(){
	  $("#modal2").modal('hide');
});
</script>

</body>
</html>