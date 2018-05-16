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
<div class="col-md-offset-2 col-md-12" style="color: black;">
<div class="col-md-offset-9"><button id="download" class="btn btn-success">导出</button><button id="back" class="btn btn-primary">返回</button></div>
<table id="tab2" class="table table-hover">
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
<span id="show"></span>
</body>
<script type="text/javascript">
var group = "${group}";
$.ajax({
	url:"${path}/serachGroupInfo?groupNum="+group,
	type:"GET",
	success:function(data){
		if(data.msg=="error"){
			$("#show").css("color","red").css("font-size","18px").css("margin-left","300px").text("先填写面试教师等信息!!");
		}else{
		$("#groupNum").css("color","red").text("第"+data.info.GROUP_NUM+"组");
		$("#groupTime").css("color","green").text(data.info.GROUP_TIME);
		$("#groupPlace").css("color","green").text(data.info.GROUP_PLACE);
		$("#groupTea").css("color","green").text(data.info.GROUP_TEA);
		
		buildTal(data);}
	}
});
function buildTal(data){
	$("#tab2 tbody").empty();
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
		var btn = $("<input type='button' class='btn btn-danger btn3' value='删除'>")
		var id = $("<input type='hidden' name='stuId'>");
		$(id).val(data.stuInfo[o].STU_ID);
		tr.append(index).append(major).append(name).append(polotics).append(english).append(sub1).append(sub2).append(total).append(td).append(btn).append(id).appendTo($("#tab2 tbody"));
		 
	}
}

$("#download").click(function(){
	var groupNum = $("#tab2").find("tr:eq(0)").find("td:eq(0)").text();
	 $("#tab2").table2excel({
         exclude  : ".noExl", //过滤位置的 css 类名
         filename : groupNum+"面试表" + ".xls" //文件名称
     });
});
$("#back").click(function(){
	$("#main").load("allGroup");
});

$(document).on("click",'.btn3',function(){
	var id = $(this).parent("tr").find("input[name='stuId']").val();
	var f = confirm("是否删除该信息");
	if(f==true){
		$.ajax({
			url:"${path}/updateStuState?stuId="+id,
			type:"GET",
			success:function(data){
				if(data.msg=="success"){
					var group = "${group}";
					$.ajax({
						url:"${path}/serachGroupInfo?groupNum="+group,
						type:"GET",
						success:function(data){
							if(data.msg=="error"){
								$("#show").css("color","red").css("font-size","18px").css("margin-left","300px").text("先填写面试教师等信息!!");
							}else{
							$("#groupNum").css("color","red").text("第"+data.info.GROUP_NUM+"组");
							$("#groupTime").css("color","green").text(data.info.GROUP_TIME);
							$("#groupPlace").css("color","green").text(data.info.GROUP_PLACE);
							$("#groupTea").css("color","green").text(data.info.GROUP_TEA);
							
							buildTal(data);}
						}
					});
				}else{
					alert("操作失败");
				}
			}
			
		});
	}
});
</script>
</html>