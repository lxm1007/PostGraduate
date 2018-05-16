<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%request.setAttribute("info", request.getSession().getAttribute("loginfo")); %>
     <%request.setAttribute("path", request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>信息完善</title>
</head>
<body style="color: black;">
<div class="col-md-offset-3" style="color: black;">
<div class="col-md-offset-8"><button class="btn btn-primary" id="back">返回</button></div>
<table id="tab2" class="table table-hover table-striped">
<thead>
<td>序号</td>

<td>组别</td>

<td>人数</td>
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
    <label for="input1" class="col-md-2 control-label">时间:</label>
    <div class="col-md-5">
      <input type="datetime-local" class="form-control" id="input1" name="groupTime">
    </div>
     <label for="input2" class="col-md-2 control-label">地点:</label>
    <div class="col-md-3 ">
      <input type="text" class="form-control" id="input2" name="groupPlace">
    </div>
  </div>
<div class="form-group">
<label for="input4" class="col-md-2 control-label" >面试组长:</label>
    <div class="col-md-2 ">
     <input id="input4"  name="groupLeader" style="width: 150px;height: 30px">
    </div>
</div>
<div class="form-group">
<label for="input3" class="col-md-2 control-label">面试教师:</label>
    <div class="col-md-2 ">
     <textarea rows="3" cols="40" id="input3"  name="groupTea" placeholder="XXX/XX形式"></textarea>
    </div>
    <input type="hidden" id="groupNum" name="groupNum">
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
$.ajax({
	url:"${path}/showAllGroup",
	type:"POST",
	success:function(data){
		if(data.msg=="success"){
			buildTal(data);
		}
	}
});


function buildTal(data){
	for(var o in data.info){
		
		var tr = $("<tr></tr>");
		var index = $("<td></td>").text(eval(o)+1);
		var group = $("<td></td>").text("组别"+data.info[o].STU_STATE.substring(1));
		var num = $("<td></td>").text(data.info[o].NUM);
		var btn2 = $("<button class='btn btn-danger btn2'>编辑学生分组</button>");
		var td = $("<td></td>");
		var btn1 = $("<button class='btn btn-primary btn1'>编辑教师分组</button>");
		var btn = td.append(btn2).append(btn1);
		tr.append(index).append(group).append(num).append(btn).appendTo($("#tab2 tbody"));
		 
	}
}

$(document).on("click",".btn2",function(){
	var num  = $(this).parent().parent("tr").find("td:eq(1)").text().substring(2);
	$("#main").load("showGroupStu",{"groupNum":num});
});
$(document).on("click",".btn1",function(){
	var num  = $(this).parent().parent("tr").find("td:eq(1)").text().substring(2);
	$.ajax({
		url:"${path}/serachGroup?groupNum="+num,
		type:"GET",
		success:function(data){
			if(data.msg=="error"){
				$("#input1").val("");
				$("#input2").val("");
				$("#input3").val("");
				$("#input4").val("");
			}else{
			if(data.info!=null||data.info != ""||data.info!=undefined){
				console.log(data);
				$("#input1").val(data.info.GROUP_TIME);
				$("#input2").val(data.info.GROUP_PLACE);
				$("#input3").val(data.info.GROUP_TEA);
				$("#input4").val(data.info.GROUP_LEADER);
			}}
			
		}
		
	});
	$("#groupNum").val(num);
	$("#modal4").modal(function(){
		backdrop:'static'
	});
	
});
$("#btnn").click(function(){
	$.ajax({
		url:"${path}/updateGroupInfo",
		data:$("#data").serialize(),
		success:function(data){
			if(data.msg=="success"){
				$("#modal4").modal('hide');
			}
		}
		
	});
});

$("#back").click(function(){
	$("#main").load("divide");
	
});
</script>
</html>