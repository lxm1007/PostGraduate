<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%request.setAttribute("info", request.getSession().getAttribute("loginfo")); %>
     <%request.setAttribute("path", request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>信息完善</title>
<style type="text/css">
.select{

height: 35px;
width: 160px;
}
</style>
</head>
<body style="color: black;">
<div class="col-md-2" style="margin-left: 768px"><button id="add" class="btn btn-success">添加</button></div>
<div class="col-md-12 col-md-offset-3" style="color: black;">
<form class="form-inline" id="form1">
  <div class="form-group">
    <label  for="exampleInputEmail3">导师姓名</label>
    <input type="text" class="form-control" name="managerName" id="managerName">
  </div>
  <div class="form-group">
    <label  for="exampleInputPassword3">导师职称</label>
    <input type="text" class="form-control" name="managerTitle" id="managerDetail" >
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
<div class="col-md-offset-2" style="color: black;">
<table class="table table-hover" id="tab2">
<thead>
	
		<td>序号</td>
		<td>姓名</td>
		<td>电话</td>
		<td>研究方向</td>
		<td>指导人数</td>
		<td>职称</td>
		<td>导师类型</td>
		<td>专业</td>
		
		<td colspan="2">操作</td>
	
	
	</thead>
	<tbody>
	</tbody>
	</table>
</div>

<div class="modal fade" tabindex="-1" role="dialog" id="modal4" style="color: black;">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">信息提示</h4>
      </div>
      <div class="modal-body">
<form class="form-horizontal" id="data">
  <div class="form-group">
    <label for="input3" class="col-md-2 control-label">姓名</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input3" value="" name="managerName">
    </div>
    <label for="input2" class="col-md-2 control-label">电话</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input2" value="" name="managerTel" >
    </div>
  </div>
  <div class="form-group">
    <label for="input1" class="col-md-2 control-label">研究方向</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input1" value="" name="managerCond" >
    </div>
     <label for="input4" class="col-md-2 control-label">指导人数</label>
    <div class="col-md-4 ">
      <input type="text" class="form-control" id="input4" name="managerRatednum" >
    </div>
  </div>
    <div class="form-group">
    <label for="input5" class="col-md-2 control-label">职称</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input5" value="" name="managerTitle">
    </div>
     <label for="input6" class="col-md-2 control-label">导师类型</label>
    <div class="col-md-4 ">
      <input type="text" class="form-control" id="input6" name="managerMentortype">
    </div>
  </div>

      <input type="hidden" class="form-control" id="input7" value="" name="managerId">
  
     
 
   <div class="form-group">
    <label for="input8" class="col-md-2 control-label">专业</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input8" value="" name="managerMajor">
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

<!--  -->
<div class="modal fade" tabindex="-1" role="dialog" id="modal5" style="color: black;">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">信息提示</h4>
      </div>
      <div class="modal-body">
<form class="form-horizontal" id="data2">
  <div class="form-group">
    <label for="input33" class="col-md-2 control-label">姓名</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input33" value="" name="managerName">
    </div>
    <label for="input22" class="col-md-2 control-label">电话</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input22" value="" name="managerTel" >
    </div>
  </div>
  <div class="form-group">
    <label for="input11" class="col-md-2 control-label">研究方向</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input11" value="" name="managerCond" >
    </div>
     <label for="input44" class="col-md-2 control-label">指导人数</label>
    <div class="col-md-4 ">
      <input type="text" class="form-control" id="input44" name="managerRatednum" >
    </div>
  </div>
    <div class="form-group">
    <label for="input55" class="col-md-2 control-label">职称</label>
    <div class="col-md-4">
      <select name="managerTitle" class="select">
      <option value="教授">教授</option>
      <option value="副教授">副教授</option>
      <option value="讲师">讲师</option>
      </select>
    </div>
     <label for="input66" class="col-md-2 control-label">导师类型</label>
    <div class="col-md-4">
      <select name="managerMentortype" class="select">
      <option value="博士生导师">博导</option>
      <option value="硕士生导师">硕导</option>
      </select>
    </div>
  </div>

      <div class="form-group">
    <label for="input99" class="col-md-2 control-label">教工号</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input99" value="" name="managerAccount">
    </div>
     <label for="input100" class="col-md-2 control-label">性别</label>
    <div class="col-md-4 ">
      <input type="text" class="form-control" id="input100" name="managerSex">
    </div>
  </div>
 
   <div class="form-group">
    <label for="input88" class="col-md-2 control-label">专业</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input88" value="" name="managerMajor">
    </div>
     
  </div>
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="btnn2">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!--消息提示窗  -->
<div class="modal fade" tabindex="-1" role="dialog" id="modal7" style="color: black;">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">信息提示</h4>
      </div>
      <div class="modal-body" style="text-align: center">
      <span id="showmsg3" style="font-size: 15px"></span>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="btn7">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!--消息提示窗  -->
<div class="modal fade" tabindex="-1" role="dialog" id="modal8" style="color: black;">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">信息提示</h4>
      </div>
      <div class="modal-body" style="text-align: center">
      <span id="showmsg4" style="font-size: 15px"></span>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="btn8">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>

<script type="text/javascript">
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
	$("#tab2 tbody").empty();
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

		var btn1 = $("<td><button class='btn btn-primary btn1'>修改</button></td>");
		var btn2 = $("<td><button class='btn btn-danger btn2'>删除</button></td>");
		
		tr.append(index).append(name).append(tel).append(cond).append(rated).append(title).append(type).append(major).append(btn1).append(btn2).append(hide).appendTo($("#tab2 tbody"));
		 
	}
}


$(document).on("click",'.btn1',function(){
	var managerId = $(this).parent().parent("tr").find("input[name='managerId']").val();
	$.ajax({
		url:"${path}/selectManager?managerId="+managerId,
		type:"GET",
		success:function(data){
			var msg = data.msg;
			if(msg=="success"){
				console.log(data.info);
				
				$("#input1").val(data.info.managerCond);
				$("#input2").val(data.info.managerTel);
				$("#input3").val(data.info.managerName);
				$("#input4").val(data.info.managerRatednum);
				$("#input5").val(data.info.managerTitle);
				$("#input6").val(data.info.managerMentortype);
				$("#input7").val(data.info.managerId);
				$("#input8").val(data.info.managerMajor);
				$("#modal4").modal(function(){
					backdrop:'static'
				});
			}
		}
	})
});

$(document).on("click",'.btn2',function(){
	var managerId = $(this).parent().parent("tr").find("input[name='managerId']").val();
	$("#showmsg3").css("color","red").text("确认删除？？？");
	$("#modal7").modal(function(){
		backdrop:'static'
	});
	$("#btn7").click(function(){
		$("#modal7").modal('hide');
		$.ajax({
			url:"${path}/deleteOneTea?managerId="+managerId,
			type:"GET",
			async:false,
			success:function(data){
				var msg = data.msg;
				if(msg=="success"){
					$("#showmsg4").css("color","green").text("操作成功");
					$("#modal8").modal(function(){
						backdrop:'static'
					});
					$("#btn8").click(function(){
						$("#modal8").modal('hide');
					});
					$('#modal8').on('hidden.bs.modal', function () {
						$("#main").load("updateTeaInfo");
						});
				}
			}
		})	
	});
	
});

$("#btnn").click(function(){
	$.ajax({
		url:"${path}/updateTeaInfoSecond",
		data:$("#data").serialize(),
		success:function(data){
			console.log(data.msg);
			if(data.msg=="success"){
				$("#modal4").modal('hide');
				$("#modal4").on("hidden.bs.modal",function(){
					$("#main").load("updateTeaInfo");
				})
			}
			
			
		}
		
	});
	
});

$("#search").click(function(){
	$.ajax({
		url:"${path }/serachTeaByCon2",
		method:"POST",
		data:$("#form1").serialize(),
		success:function(data){
			$("#tab2 tbody").empty();
			if(data.msg=="success"){
				buildTal(data);
			}else{
				alert("数据错误!!!!");
			}
		}
	});
});

$("#a_1").click(function(){
	$("#managerDetail").val("教授");
});
$("#a_2").click(function(){
	$("#managerDetail").val("副教授");
});
$("#a_3").click(function(){
	$("#managerDetail").val("讲师");
});

$("#add").click(function(){
	$("#modal5").modal(function(){
		backdrop:'static'
	});
	$("#btnn2").click(function(){
		$("#modal5").modal('hide');
		$.ajax({
			url:"${path}/addOneTea",
			data:$("#data2").serialize(),
			type:"POST",
			success:function(data){
				if(data.msg=="success"){
					$("#showmsg4").css("color","green").text("操作成功");
					$("#modal8").modal(function(){
						backdrop:'static'
					});
					$("#btn8").click(function(){
						$("#modal8").modal('hide');
					});
					$("#modal8").on("hidden.bs.modal",function(){
						$("#main").load("updateTeaInfo");
					})
				}
			}
		});
	});
});


</script>
</html>