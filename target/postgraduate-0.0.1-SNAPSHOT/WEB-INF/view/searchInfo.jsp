<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%request.setAttribute("info", request.getSession().getAttribute("loginfo")); %>
    <%request.setAttribute("managerloginfo", request.getSession().getAttribute("managerloginfo")); %>
   
    <% request.setAttribute("path", request.getContextPath()); %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html>
<html lang="zh">
	<head>
		<meta charset="utf-8">
	 	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
		<link rel="stylesheet" href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css" media="screen"/>
		<title>首页</title>
		<link rel="stylesheet" type="text/css" href="${path}/static/bootstrap-3.3.7-dist/css/htmleaf-demo.css">
		<link rel="stylesheet" type="text/css" href="${path}/static/bootstrap-3.3.7-dist/css/nav.css">
       <link rel="stylesheet" type="text/css" href="${path}/static/bootstrap-3.3.7-dist/fonts/iconfont.css">
       </head>
<body>
<div class="modal fade" tabindex="-1" role="dialog" id="modal4" style="color: black;">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">信息提示</h4>
      </div>
      <div class="modal-body">
<form class="form-horizontal">
  <div class="form-group">
    <label for="input3" class="col-md-2 control-label">姓名</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input3" value="${teacherinfo.MANAGER_NAME }" readonly="readonly">
    </div>
    <label for="input2" class="col-md-2 control-label">电话</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input2" value="${teacherinfo.MANAGER_TEL }"  readonly="readonly">
    </div>
  </div>
  <div class="form-group">
    <label for="input1" class="col-md-2 control-label">研究方向</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input1" value="${teacherinfo.MANAGER_COND }" readonly="readonly">
    </div>
     <label for="input4" class="col-md-2 control-label">状态</label>
    <div class="col-md-4 has-error">
      <input type="text" class="form-control" id="input4" readonly="readonly">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      
    </div>
  </div>
  
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="btnn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


</body>
<script type="text/javascript">
$(function(){
	
	var val = "${teacherinfo.STU_STATE}";
	if(val=="3"){
		$("#input4").val("已选择导师,待导师确认").css("color","green");
	}else if(val=="4"){
		$("#input4").val("导师已确认").css("color","green");
	}else{
		$("#input4").val("未选择导师").css("color","red");
	}
	$("#modal4").modal({
		backdrop:'static'
	});
	
})

$("#btnn").click(function(){
	$("#modal4").modal('hide');
});
</script>
</html>