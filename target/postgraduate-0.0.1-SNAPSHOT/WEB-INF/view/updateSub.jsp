<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%request.setAttribute("info", request.getSession().getAttribute("loginfo")); %>
     <%request.setAttribute("path", request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css" media="screen"/>
		<title>首页</title>
		<link rel="stylesheet" type="text/css" href="${path}/static/bootstrap-3.3.7-dist/css/htmleaf-demo.css">
		<link rel="stylesheet" type="text/css" href="${path}/static/bootstrap-3.3.7-dist/css/nav.css">
       <link rel="stylesheet" type="text/css" href="${path}/static/bootstrap-3.3.7-dist/fonts/iconfont.css">

	<script type="text/javascript" src="${path }/static/bootstrap-3.3.7-dist/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="${path}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
	<script type="text/javascript" src="${path}/static/bootstrap-3.3.7-dist/js/nav.js"></script>
	<script type="text/javascript" src ="${path }/static/bootstrap-3.3.7-dist/jquery.jsonp.js"></script>
</head>
<body style="color: black;">
<div class="modal fade" tabindex="-1" role="dialog" id="modal4" aria-hidden="true" data-backdrop="static" style="color: black;">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="text-align: center">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
        <h4 class="modal-title">信息提示</h4>
      </div>
      <div class="modal-body">
<form class="form-horizontal" method="post" id = "form1">
  <div class="form-group">
    <label for="input3" class="col-md-2 control-label">科目一</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input3" name="reSub1" required="required">
    </div>
    <label for="input2" class="col-md-2 control-label">百分比</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input2" name="reSub1Val"  required="required">
    </div>
  </div>
  <div class="form-group">
    <label for="input1" class="col-md-2 control-label">科目二</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input1" name="reSub2" required="required" >
    </div>
     <label for="input4" class="col-md-2 control-label">百分比</label>
    <div class="col-md-4 ">
      <input type="text" class="form-control" id="input4" name="reSub2Val" required="required">
    </div>
  </div>
  
      
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="btnn">确定</button>
      </div>
    
        </form>
      </div>
        <span id="msg" style="font-size: 18px"></span>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!--  -->
<div class="modal fade" id="modal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" >
				  <div class="modal-dialog" role="document" style="width:350px;text-align: center;">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
				        <h4 class="modal-title" id="myModalLabel" style="color:black; ">信息提示</h4>
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

<!--  -->

</body>
<script type="text/javascript">
$(function(){
	var resub1 = '';
	var resub2 = '';
	var resub1val = '';
	var resub2val = '';
	$.ajax({
		url:"${path}/selectSub",
		type:"POST",
		async:false,
		success:function(data){
			for(o in data.info){
				if(data.info[o].F_CODE=='reSub1'){
					resub1 = data.info[o].F_VALUE;
				}
				if(data.info[o].F_CODE=='reSub2'){
					resub2 = data.info[o].F_VALUE;
				}
				if(data.info[o].F_CODE=='reSub1Val'){
					resub1val = data.info[o].F_VALUE;
				}if(data.info[o].F_CODE=='reSub2Val'){
					resub2val = data.info[o].F_VALUE;
				}
			}
			$("#input3").val(resub1);
			$("#input2").val(resub1val);
			$("#input1").val(resub2);
			$("#input4").val(resub2val);
		}
		
	});
	
	$("#modal4").modal(function(){
		backdrop:'static'
	});
});
$("#input4").blur(function(){
	var val1 = $(this).val();
	var subval = val1.substring(0,2);
	var val2 = 100-eval(subval);
	if(val2<=0){
		val2=50;
		val1=50;
	}
	$("#input2").val(val2+"%");
	$("#input4").val(subval+"%");
	
});
$("#input2").blur(function(){
	var val1 = $(this).val();
	var subval = val1.substring(0,2);
	var val2 = 100-eval(subval);
	if(val2<=0){
		val2=50;
		val1=50;
	}
	$("#input4").val(val2+"%");
	$("#input2").val(subval+"%");

});

$("#btnn").click(function(){
	var f1 = ($("#input1").val()!='');
	var f2 = ($("#input2").val()!='');
	var f3 = ($("#input3").val()!='');
	var f4 = ($("#input4").val()!='');
	if(f1&&f2&&f3&&f4){
		$.ajax({
			url:"${path}/updateSysCode",
			data:$("#form1").serialize(),
			type:"POST",
			success:function(data){
				if(data.msg=='success'){
					$("#modal4").modal('hide');
					$("#msgn").css("color","green").text("修改成功!!!")
					$("#modal2").modal(function(){
						backdrop:'static'
					});
					$("#btn2").click(function(){
						$("#modal2").modal('hide');
						$('#modal2').on('hidden.bs.modal', function (e) {
							location.reload();
							})
						
					});
				}else{
					$("#msg").css("color","red").text("操作失败请重试");
				}
			}
		});
	}else{
		$("#msg").css("color","red").text("请完善信息!!!");
	}
});
</script>
</html>