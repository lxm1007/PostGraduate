<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%request.setAttribute("info", request.getSession().getAttribute("loginfo")); %>
     <%request.setAttribute("path", request.getContextPath()); %>
      <%request.setAttribute("type", request.getAttribute("type")); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>信息完善</title>
</head>
<body style="color: black;">
<div class="col-md-offset-3" style="color: black;text-align: center"><span id="type"></span></div>
<div class="col-md-offset-3" style="color: black;">
<table class="table table-hover  table-condensed " id="tab2">
<thead>
	
		<td>序号</td>
		<td>姓名</td>
		<td>电话</td>
		<td>研究方向</td>
		<td>指导人数</td>
		<td>职称</td>
		<td>导师类型</td>
		<td>专业</td>
		<td>角色</td>
		<td colspan="2">操作</td>
	
	
	</thead>
	<tbody>
	</tbody>
	</table>
</div>

<div class="modal fade" tabindex="-1" role="dialog" id="modal8" style="color: black;">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">信息提示</h4>
      </div>
      <div class="modal-body" style="text-align: center">
      <span id="showmsg4" style="font-size: 15px">操作成功</span>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="btn8">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</body>
</body>
<script type="text/javascript">
var type = "${type}";
if(type=="31"){
	$("#type").text("指定复试阅卷人").css("font-size","18px");
}if(type=="32"){
	$("#type").text("指定面试组长").css("font-size","18px");
}
$(function(){
	$.ajax({
		url:"${path}/searchAllTea",
		type:"POST",
		success:function(data){
			if(data.msg=="success"){
				buildTal(data);
			}else{
				alert("数据错误!!!!");
			}
		}
	});
});
	function buildTal(data){
		for(var o in data.info){
			
			var tr = $("<tr></tr>");
			var index = $("<td></td>").text(eval(o)+1);
			var name = $("<td></td>").text(data.info[o].managerName);
			var tel = $("<td></td>").text(data.info[o].managerTel==null?"":data.info[o].managerTel);
			var cond = $("<td></td>").text(data.info[o].managerCond);
			var rated = $("<td></td>").text(data.info[o].managerRatednum);
			var title = $("<td></td>").text(data.info[o].managerTitle);
			var type = $("<td></td>").text(data.info[o].managerMentortype);
			var major = $("<td></td>").text(data.info[o].managerMajor);
			var hide =$("<input type='hidden' name='managerId'>").val(data.info[o].managerId);
			var type = data.info[o].managerType;
			var role = $("<td style='color:red'></td>").text(type=="2"?"未分配角色":(type=="31"?"复试阅卷人":(type=="32"?"面试组长":"阅卷人/面试组长")))
			var btn1 = $("<td><button class='btn btn-primary btn1'>确认指定</button></td>");
			
			tr.append(index).append(name).append(tel).append(cond).append(rated).append(title).append(type).append(major).append(role).append(btn1).append(hide).appendTo($("#tab2 tbody"));
			 
		}
	}
	
	
	$(document).on("click",'.btn1',function(){
		var type="${type}";
		var id = $(this).parent().parent("tr").find("input[name='managerId']").val();
		$.ajax({
			url:"${path}/assignDuty?type="+type+"&&id="+id,
			type:"GET",
			success:function(data){
				if(data.msg=="success"){
					$("#modal8").modal(function(){
						backdrop:'static'
					});
					$("#btn8").click(function(){
						
						$("#modal8").modal('hide');
						$('#modal8').on('hidden.bs.modal', function (e) {
							$("#main").load("assign",{"type":"${type}"})
							});
					
					});
				}
			}
			
			
		});
		
	});
	
</script>
</html>