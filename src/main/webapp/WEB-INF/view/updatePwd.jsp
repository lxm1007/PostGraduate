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
<div class="modal fade" tabindex="-1" role="dialog" id="modal4" aria-hidden="true" style="color: black;">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="text-align: center">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
        <h4 class="modal-title">信息提示</h4>
      </div>
      <div class="modal-body">
<form class="form-horizontal" method="post" id = "form1">
  <div class="form-group">
    <label for="input3" class="col-md-2 control-label">密码</label>
    <div class="col-md-4">
      <input type="password" class="form-control" id="input3" name="managerPwd" required="required">
    </div>
    <label for="input2" class="col-md-2 control-label">确认密码</label>
    <div class="col-md-4">
      <input type="password" class="form-control" id="input2"  required="required">
    </div>
  </div>
<input id="managerId" name="managerId" type="hidden">
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="btnn">确定</button>
      </div>
    
        </form>
      </div>
        <span id="msg" style="font-size: 18px"></span>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

			

<script type="text/javascript">

$(function(){
	$("#modal4").modal(function(){
		backdrop:'static'
	});
	
});
	$("#btnn").click(function(){
		
		var pwd1 = $("#input2").val();
		var pwd2 = $("#input3").val();
		var id = "${managerloginfo.info.managerId}";
		$("#managerId").val(id);
		if(pwd1==pwd2&&pwd1!=""){
			$.ajax({
				
				url:"${path}/changeTeaPwd",
				data:$("#form1").serialize(),
				type:"POST",
				success:function(data){
					
					if(data.msg=="success"){
						$("#modal4").modal('hide');
						alert("操作成功");
					}else{
					alert("操作失败，请重试")	
					}
				}
			});
		}else{
			alert("请检查您的密码！！！")
		}
	});
	

</script>

</body>
</html>