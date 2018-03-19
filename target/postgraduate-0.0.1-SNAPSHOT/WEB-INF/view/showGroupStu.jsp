<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%request.setAttribute("info", request.getSession().getAttribute("loginfo")); %>
     <%request.setAttribute("path", request.getContextPath()); %>
     <%request.setAttribute("group", request.getAttribute("group")); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>信息完善</title>
<script type="text/javascript" src="${path}/static/jquery.table2excel.js"></script>
</head>
<body style="color: black;">
<div class="col-md-offset-3" style="color: black;">
<div class="col-md-offset-10"><button id="download" class="btn btn-success">导出</button></div>
<table id="tab2" class="table table-hover table-striped">
<thead>
<tr style="text-align: center;"><td colspan="9" id="groupNum"></td></tr>
<tr>
<td>时间:</td>
<td id="groupTime" colspan="2"></td>
<td colspan="1">地点:</td>
<td id="groupPlace" colspan="2"></td>
<td colspan="1">面试教师:</td>
<td id="groupTea" colspan="2"></td>
</tr>
<td>序号</td>
<td>专业</td>
<td>姓名</td>
<td>政治</td>
<td>英语</td>
<td>专业课1</td>
<td>专业课2</td>
<td>总成绩</td>
<td>面试成绩</td>

</thead>
<tbody>
</tbody>
</table>
</div>

</body>
<script type="text/javascript">
var group = "${group}";
$.ajax({
	url:"${path}/serachGroupInfo?groupNum="+group,
	type:"GET",
	success:function(data){
		$("#groupNum").css("color","red").text("第"+data.info.GROUP_NUM+"组");
		$("#groupTime").css("color","green").text(data.info.GROUP_TIME);
		$("#groupPlace").css("color","green").text(data.info.GROUP_PLACE);
		$("#groupTea").css("color","green").text(data.info.GROUP_TEA);
		
		buildTal(data);
	}
});
function buildTal(data){
	for(var o in data.stuInfo){
		
		var tr = $("<tr></tr>");
		var index = $("<td></td>").text(eval(o)+1);
		var major = $("<td></td>").text(data.stuInfo[o].STU_MAJORNAME);
		var name = $("<td></td>").text(data.stuInfo[o].STU_NAME);
		var polotics = $("<td></td>").text(data.stuInfo[o].STU_POLOTICS);
		var english = $("<td></td>").text(data.stuInfo[o].STU_ENGLISH);
		var sub1 = $("<td></td>").text(data.stuInfo[o].STU_SUB1);
		var sub2 = $("<td></td>").text(data.stuInfo[o].STU_SUB2);
		var total = $("<td></td>").text(data.stuInfo[o].STU_TOTALSCORE1);
		var td = $("<td></td>");
		tr.append(index).append(major).append(name).append(polotics).append(english).append(sub1).append(sub2).append(total).append(td).appendTo($("#tab2 tbody"));
		 
	}
}

$("#download").click(function(){
	var groupNum = $("#tab2").find("tr:eq(0)").find("td:eq(0)").text();
	 $("#tab2").table2excel({
         exclude  : ".noExl", //过滤位置的 css 类名
         filename : groupNum+"面试表" + ".xls" //文件名称
     });
});
</script>
</html>