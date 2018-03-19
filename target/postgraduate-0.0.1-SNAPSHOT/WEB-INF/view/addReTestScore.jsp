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
<style type="text/css">
input{
width: 35px;
}
</style>
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
		<td>专业</td>
		<td>初试成绩</td>
		<td>复试科1</td>
		<td>复试科2</td>
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
		url:"${path}/searchStuAndScore",
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
		var name = $("<td></td>").text(data.info[o].stuName);
		var candidate = $("<td></td>").text(data.info[o].stuCandidate);
		var major = $("<td></td>").text(data.info[o].stuMajorname);
		var score =  $("<td></td>").text(data.info[o].stuTotalscore1);
		var resub1= $('<td><input type="text" name="reSub1"></td>');
		$(resub1).find("input[name='reSub1']").val(data.info[o].stuResub1);
		var resub2= $('<td><input type="text" name="reSub2"></td>');
		$(resub2).find("input[name='reSub2']").val(data.info[o].stuResub2);
		var id = $('<input name="stuId" type="hidden">').val(data.info[o].stuId);
		var btn1 = $("<td><button class='btn btn-primary btn1'>添加</button></td>");
		tr.append(index).append(name).append(candidate).append(major).append(score).append(resub1).append(resub2).append(id).append(btn1).appendTo($("#tab2 tbody"));
		 
	}
}

$(document).on("click",".btn1",function(){
	var id = $(this).parent().parent("tr").find("input[name='stuId']").val();
	var resub1  =$(this).parent().parent("tr").find("input[name='reSub1']").val();
	var resub2  =$(this).parent().parent("tr").find("input[name='reSub2']").val();
	$.ajax({
		url:"${path}/addReTestScore2?stuId="+id+"&&stuResub1="+resub1+"&&stuResub2="+resub2,
		type:"GET",
		success:function(data){
			console.log(data);
			if(data.msg=="success"){
				var type = "${type}";
				$("#main").load("addReTestScore",{"type":type});
			}
		}
	});
});
</script>
</html>