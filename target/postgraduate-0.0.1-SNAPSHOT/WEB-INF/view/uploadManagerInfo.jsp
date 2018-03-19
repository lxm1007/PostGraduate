<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%request.setAttribute("info", request.getSession().getAttribute("loginfo")); %>
     <%request.setAttribute("path", request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<div class="col-md-12" style="text-align: center;font-size: 18px">
<span class="glyphicon glyphicon-star" style="color: red;text-align: center">上传导师信息注意事项</span>
<span style="color: red">文件内容请参照<a href="${path }/template2">模板</a></span>
</div>
<br><br><br>
<div class="col-md-12">
<form id="form1"  method="post" enctype="mutipart/form-data">
<table style="color: black;text-align: center;margin-left: 250px" >
	<tr>
		<td >
			<input type="file" name="file" id="ListRecord">
		</td>
		<td><button type="button" id="upload" class="btn btn-success">上传</button></td>
	</tr>
</table>

</form>
<div class="col-md-12" style="color: red;text-align: center;font-size: 16px"><span id="showmsg"></span></div>
</div>


<!-- 信息提示 -->

<div class="modal fade" tabindex="-1" role="dialog" id="modal6" style="color: black;">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">信息提示</h4>
      </div>
      <div class="modal-body" style="text-align: center">
      <span id="showmsg2" style="font-size: 15px"></span>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="btn6">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script type="text/javascript">
$("#upload").click(function(){
	var f = false;
	var val = $("input[name='file']").val();
	var index = val.indexOf(".");
	var name = val.substring(index);
	if(name=='.xls'||name=='.xlsx'){
		$("#showmsg").empty();
		f = true;
		
	}else{
		$("#showmsg").text("文件格式不对,后缀名为.xls或者.xlsx").css("color","red");
	}
	if(f){
		var formdata = new FormData($('#form1')[0]);
		$.ajax({
			url:"${path}/upload3",
			type:"POST",
			data:formdata,
			async:false,
			processData:false,
            contentType:false,
            cache:false,
			success:function(data){
	
				if(data.msg=="success"&&data.num>0){
					$("#showmsg2").addClass("glyphicon glyphicon-ok-sign").text(data.num+"条数据导入成功!!!").css("color","green");
				}else{
					$("#showmsg2").addClass("glyphicon glyphicon-remove-circle").text("数据库错误").css("color","red");
				}
				$("#modal6").modal(function(){
					bachdrop:'static'
				});
				}
			});
	} 
});

$("#btn6").click(function(){
	$("#modal6").modal('hide');
});
</script>
</body>
</html>