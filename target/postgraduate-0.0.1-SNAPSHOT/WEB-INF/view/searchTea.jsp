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



<!-- Modal -->
<div class="modal fade bs-example-modal-sm" id="modall" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" data-backdrop="static" style="color: black;">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
     <h4 class="modal-title" id="myModalLabel1" style="color:black;">信息提示</h4>
      <div style="color:black;;text-align: center;font-size: 18px"><span id="show"></span></div>
       <div class="modal-footer">
        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary btn-sm" id="confirm">确定</button>
      </div>
    </div>
  </div>
</div>


<!-- Modal -->
<div class="modal fade bs-example-modal-sm" id="modal2" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" data-backdrop="static" style="color: black;">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
     <h4 class="modal-title" id="myModalLabel1" style="color:black;">信息提示</h4>
      <div style="color:black;;text-align: center;font-size: 18px"><span id="show2"></span></div>
       <div class="modal-footer">
        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary btn-sm" id="confirm2">确定</button>
      </div>
    </div>
  </div>
</div>
<div class="col-md-12 col-md-offset-3" style="color: black;">
<form class="form-inline" id="form1">
  <div class="form-group">
    <label  for="exampleInputEmail3">导师姓名</label>
    <input type="text" class="form-control" name="managerName" id="managerName">
  </div>
  <div class="form-group">
    <label  for="exampleInputPassword3">导师职称</label>
    <input type="text" class="form-control" name="managerTitle" id="managerDetail" readonly="readonly" >
    <div class="btn-group">
  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    职称 <span class="caret"></span>
  </button>
  <ul class="dropdown-menu">
    <li><a id = "a_1">教授</a></li>
    <li><a id="a_2" >副教授</a></li>
    <li><a id = "a_3" >讲师</a></li>
    
  </ul>
</div>
  </div>

  <button type="button" id="search" class="btn btn-primary">搜索</button>
</form>
</div>
<div id ="tab1" class="col-md-10 col-md-offset-3" style="color: black;text-align: center">
<table class="table table-hover " id="tab2">
<thead>
	
		<td>序号</td>
		<td>姓名</td>
		<td>电话</td>
		<td>研究方向</td>
		<td>计划人数</td>
		<td>已招人数</td>
		<td colspan="2">操作</td>
	
	
	</thead>
	<tbody>
	</tbody>
	</table>

</div>


</body>
<script type="text/javascript">


$("#a_1").click(function(){
	$("#managerDetail").val("教授");
});
$("#a_2").click(function(){
	$("#managerDetail").val("副教授");
});
$("#a_3").click(function(){
	$("#managerDetail").val("讲师");
});
$("#search").click(function(){
	$.ajax({
		url:"${path }/serachTeaByCon",
		method:"POST",
		data:$("#form1").serialize(),
		success:function(data){
			$("#tab2 tbody").empty();
			for(var o in data){
				var tr = $("<tr></tr>");
				var id = $("<td></td>").text(eval(o)+1);
				
				var name = $("<td></td>").text(data[o].managerName);
				
				var tel = $("<td></td>").text(data[o].managerTel);
		
				var con = $("<td></td>").text(data[o].managerCond);
			
				var allNum = $("<td></td>").text(data[o].managerRatednum);
				
				var select = $("<td></td>").text(data[o].managerSelected==null?0:data[o].managerSelected);
			
				var btn1 = $("<button type='button'  class='btn btn-primary btn111'>详情</button>");
			
				var btn2 = $("<button type='button'  class='btn btn-danger btn222'>选择</button>");
				var hide = $("<input type='hidden' class='hide' name='managerId'>").attr("value",data[o].managerId);

				tr.append(id).append(name).append(tel).append(con).append(allNum).append(select).append(hide).append(btn1).append("&nbsp;&nbsp;").append(btn2).appendTo($("#tab2 tbody"));
				
			}
		}
		
	});
});


$(document).on("click",".btn111",function(){
var name = $(this).parent("tr").find("td:eq(1)").text();

	window.open("http://cise.sdust.edu.cn/web2010/cp.php?ac=teachers&tuid=1");

});
/* 注意 动态加载的时候 一定要用on事件绑定 click 事件无用 */

$(document).on("click",".btn222",function(){
	var  f = 0;
	var num1 = $(this).parent("tr").find("td:eq(4)").text();
	var num2 = $(this).parent("tr").find("td:eq(5)").text();
	$.ajax({
		url:"${path}/checkStuState?stuId="+"${info.info.stuId}",
		type:"GET",
		async:false,
		success:function(data){
			if(data.stuState=="1"){
				alert("请先完善个人信息");
				f = 1;
			}
			
			
		}
			
	});
	
	if(f==1){
		return false;
	}
	
	if(num1==num2 && num1!='0'){
		$("#show").text("该导师研究生名额已满");
		$("#modall").modal(function(){
			backdrop:'static'
		});
		
		$("#confirm").click(function(){
			$("#modall").modal('hide');
		});
		$(this).attr("disabled","disabled");
	}
	else{
		var managerId = "${info.info.managerId}";
		var stuId  ="${info.info.stuId}";
		var managerId2 = $(this).parent("tr").find("input[name='managerId']").val();
		
		if(managerId==null||managerId==''){
			$("#show").text("确认选择该导师???");
			$("#modall").modal(function(){
				backdrop:'static'
			});
		
			$("#confirm").click(function(){
				$("#modall").modal('hide');
				$.ajax({
					url:"${path}/updateStuMangerId?stuId="+stuId+"&managerId="+managerId2,
					async:false,
					type:"GET",
					success:function(data){
						
						var msg = data.msg;
						if(msg=="success"){
							$("#modal2").modal(function(){
								backdrop:'static'
							});
							
							$("#show2").text("操作成功");
							$("#confirm2").click(function(){
								$("#modal2").modal('hide');
								
							});
						}else{
							$("#modal2").modal(function(){
								backdrop:'static'
							});
							$("#show2").text("操作失败");
							$("#confirm2").click(function(){
								$("#modal2").modal('hide');
								
							});
						}
					}
				});
			});
		}else
			{
			$("#modal2").modal(function(){
				backdrop:'static'
			});
			$("#show2").text("对不起,您已经选择了导师!!!");
			$("#confirm2").click(function(){
				$("#modal2").modal('hide');
				
			});
			}
		
		
	}
	
});

$("#detail").on("hidden.bs.modal", function() {  
    $(this).removeData("bs.modal");  
});  
</script>
</html>