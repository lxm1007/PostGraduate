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
width: 60px;
}

</style>
<script type="text/javascript" src="${path}/static/jquery.table2excel.js"></script>
</head>
<body style="color: black;">

<div class="col-md-offset-12"><button id="download" class="btn btn-success">导出</button></div>
<br>
<div class="col-md-12 col-md-offset-2" style="color: red;" >
初试:<input placeholder="百分比" id="input1">复试:<input placeholder="百分比" id="input2">复试面试:<input placeholder="百分比" id="input6">复试英语:<input placeholder="百分比" id="input3">

<input type="hidden" id="input7"><input type="hidden" id="input8">
<button id="calculate" class="btn btn-danger">计算</button>
</div>
<div style="color: black" class="col-md-offset-2">
<table class="table table-hover " id="tab2" style="text-align: center">
<thead>
		<td>序号</td>
		<td>姓名</td>
		<td>考号</td>
		<td>初试</td>
		<td>政治</td>
		<td>英语</td>
		<td>专业科1</td>
		<td>专业科2</td>
		<td>复试科1</td>
		<td>复试科2</td>
		<td>面试</td>
		<td>面试英语</td>
		<td>总分</td>
	</thead>
	<tbody>
	</tbody>
	</table>

</div>
</body>
<script type="text/javascript">
$.ajax({
	url:"${path}/showAllScore",
	type:"GET",
	success:function(data){
		console.log(data);
		buildTal(data);
		var FirstScore;
		var SecondScore;
		var SecondWritten;
		var SecondInterview;
		var reEnglish;
		var interview;
		var reSub1Val;
		var reSub2Val;
		for(var o in data.info2){
			if(data.info2[o].F_CODE=="FirstScore"){
				FirstScore = data.info2[o].F_VALUE;
			}
			else if(data.info2[o].F_CODE=="SecondScore"){
				SecondScore = data.info2[o].F_VALUE;
			}
			else if(data.info2[o].F_CODE=="SecondWritten"){
				SecondWritten = data.info2[o].F_VALUE;
			}
			else if(data.info2[o].F_CODE=="SecondInterview"){
				SecondInterview = data.info2[o].F_VALUE;
			}
			else if(data.info2[o].F_CODE=="reEnglish"){
				reEnglish = data.info2[o].F_VALUE;
			}
			else if(data.info2[o].F_CODE=="interview"){
				interview = data.info2[o].F_VALUE;
			}
			else if(data.info2[o].F_CODE=="reSub1Val"){
				reSub1Val = data.info2[o].F_VALUE;
			}
			else if(data.info2[o].F_CODE=="reSub2Val"){
				reSub2Val = data.info2[o].F_VALUE;
			}
		}
		
		$("#input1").val(FirstScore);
		$("#input2").val(SecondScore);
		$("#input3").val(reEnglish);
		//$("#input4").val(interview);
		//$("#input5").val(SecondWritten);
		$("#input6").val(SecondInterview);
		//$("#input7").val(reSub1Val);
		//$("#input8").val(reSub2Val);
}
});


function buildTal(data){
	
	for(var o in data.info){
		var td=$("<td></td>");
		var tr = $("<tr></tr>");
		var index = $("<td></td>").text(eval(o)+1);
		var name = $("<td></td>").text(data.info[o].STU_NAME);
		var candidate = $("<td></td>").text(data.info[o].STU_CANDIDATE);
		var score =  $("<td></td>").text(data.info[o].STU_TOTALSCORE1);
		var resub1= $('<td></td>').text(data.info[o].STU_RESUB1);
		var sub2= $('<td></td>').text(data.info[o].STU_SUB2);
		var sub1= $('<td></td>').text(data.info[o].STU_SUB1);
		var english= $('<td></td>').text(data.info[o].STU_ENGLISH);
		var polotics= $('<td></td>').text(data.info[o].STU_POLOTICS);
		var resub2= $('<td></td>').text(data.info[o].STU_RESUB2);
		var reenglish = $('<td></td>').text(data.info[o].STU_REENGLISH);
		var interview = $('<td></td>').text(data.info[o].STU_INTERVIEW);
		var id = $('<input name="stuId" type="hidden">').val(data.info[o].STU_ID);
		tr.append(index).append(name).append(candidate).append(score).append(polotics).append(english).append(sub1).append(sub2).append(resub1).append(resub2).append(reenglish).append(interview).append(td).appendTo($("#tab2 tbody"));
		 
	}
}

$("#calculate").click(function(){
	var len = ($("#tab2").find("tr").length)-1;
	per1 = $("#input1").val().substring(0,2);
	per2 = $("#input2").val().substring(0,2);
	per3 = $("#input3").val().substring(0,2);
	//per4 = $("#input4").val().substring(0,2);
	//per5 = $("#input5").val().substring(0,2);
	per6 = $("#input6").val().substring(0,2);
	per7 = $("#input7").val().substring(0,2);
	per8 = $("#input8").val().substring(0,2);
	
	for(var i = 1;i<=len;i++){
		var s1 = $("#tab2").find("tr:eq("+i+")").find("td:eq(3)").text();
		if (s1.toString()=="") s1=0;
		var s2 = $("#tab2").find("tr:eq("+i+")").find("td:eq(8)").text();
		if (s2.toString()=="") s2=0;
		var s3 = $("#tab2").find("tr:eq("+i+")").find("td:eq(9)").text();
		if (s3.toString()=="") s3=0;
		var s4 = $("#tab2").find("tr:eq("+i+")").find("td:eq(10)").text();
		if (s4.toString()=="") s4=0;
		var s5 = $("#tab2").find("tr:eq("+i+")").find("td:eq(11)").text();
		if (s5.toString()=="") s5=0;
		//var finalscore = (parseFloat(per1/100*parseFloat(s1))+parseFloat(per2/100*((per5/100*(parseFloat(s2)*(per7/100)+parseFloat(s3)*(per8/100)))+(per6/100*((per4/100*s4)+(per3/100*s5)))))).toFixed(2);
		var finalscore = (parseFloat((per1/100/5)*parseFloat(s1)+parseFloat((parseFloat(s2)+parseFloat(s3)+parseFloat(s4)*per6/100+parseFloat(s5)*per3/100)/2*per2/100))).toFixed(2);
		$("#tab2").find("tr:eq("+i+")").find("td:eq(12)").text(finalscore);
		
	}
	
	
	
});

$("#download").click(function(){
	 $("#tab2").table2excel({
         exclude  : ".noExl", //过滤位置的 css 类名
         filename : "学生成绩表" + ".xls" //文件名称
     });
});

</script>
</html>