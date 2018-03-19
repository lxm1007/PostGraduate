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
<div id ="tab1" class="col-md-10 col-md-offset-2" style="color: black;text-align: center">
	<div class="col-md-offset-8">
		<span id="showNum"></span>
	</div>
<form class="form-inline" id="form1">
  <div class="form-group">
    <label  for="exampleInputEmail3">姓名</label>
    <input type="text" class="form-control" name="stuName" id="stuName">
  </div>
  <div class="form-group">
    <label  for="exampleInputPassword3">考号</label>
    <input type="text" class="form-control" name="candidate" id="candidate" >
    <div class="btn-group">
  
</div>
  </div>
  <button type="button" id="search" class="btn btn-primary">搜索</button>
</form>	
	
<table class="table table-hover " id="tab2">
<thead>
	
		<td>序号</td>
		<td>姓名</td>
		<td>考号</td>
		<td>所选导师</td>
		<td>操作</td>

	</thead>
	<tbody>
	</tbody>
	</table>

</div>
</body>
<script type="text/javascript">
$("#search").click(function(){
	$("#tab2 tbody").empty();
	var stuName=$("#stuName").val();
	var stuCandidate = $("#candidate").val();
	var str={"stuName":stuName,"stuCandidate":stuCandidate};
	$.ajax({
		url:"${path}/searchStuAndTea",
		contentType:"application/json",
		dataType : "json", 
		type:"POST",
		data:JSON.stringify(str),
		success:function(data){
			console.log(data);
			if(data.msg=="success"){
			
			 buildTal(data);
				
			}
		}
	});
});

function buildTal(data){
	for(var o in data.info){
		
		var tr = $("<tr></tr>");
		var index = $("<td></td>").text(eval(o)+1);
		var name = $("<td></td>").text(data.info[o].STU_NAME);
		var candidate = $("<td></td>").text(data.info[o].STU_CANDIDATE);
		var tea = $("<td></td>").text(data.info[o].MANAGER_NAME);
		var id = $('<input name="stuId" type="hidden">').val(data.info[o].STU_ID);
		var btn1 = $("<td><button class='btn btn-primary btn1'>解除关系</button></td>");
		tr.append(index).append(name).append(candidate).append(tea).append(id).append(btn1).appendTo($("#tab2 tbody"));
		 
	}
}

$(document).on("click",".btn1",function(){
	var id = $(this).parent().parent("tr").find("input[name='stuId']").val();
	$.ajax({
		url:"${path}/emptyTeaId?stuId="+id,
		type:"GET",
		success:function(data){
			console.log(data);
			if(data.msg=="success"){
				$("#main").load("emptyTea");
			}
		}
	});
});
</script>
</html>