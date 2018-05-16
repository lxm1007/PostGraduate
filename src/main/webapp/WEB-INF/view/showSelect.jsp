<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%request.setAttribute("info", request.getSession().getAttribute("loginfo")); %>
     <%request.setAttribute("path", request.getContextPath()); %>
     <%request.setAttribute("managerloginfo", request.getSession().getAttribute("managerloginfo")); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css" media="screen"/>
<title>信息完善</title>
   <script type="text/javascript" src="${path }/static/bootstrap-3.3.7-dist/jquery-3.2.1.js"></script>
			<script type="text/javascript" src="${path}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<style>
	.form{
		
		width: 200px;
	}
	.lable{
	width: 100px;
	}
	body{
	color: black;
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
    <label  for="exampleInputEmail3">学生姓名</label>
    <input type="text" class="form-control" name="stuName" id="stuName">
  </div>
  <div class="form-group">
    <label  for="exampleInputPassword3">学生电话</label>
    <input type="text" class="form-control" name="stuTel" id="stuTel" >
    <div class="btn-group">
  
</div>
  </div>
	<input type="hidden" name="managerId">
  <button type="button" id="search" class="btn btn-primary">搜索</button>
</form>	
	
<table class="table table-hover " id="tab2">
<thead>
	
		<td>序号</td>
		<td>姓名</td>
		<td>性别</td>
		<td>总分</td>
		<td>硕士类型</td>
		<td>毕业院校</td>
		
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
<form class="form-horizontal">
  <div class="form-group">
    <label for="input3" class="col-md-2 control-label">姓名</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input3" value="" readonly="readonly">
    </div>
    <label for="input2" class="col-md-2 control-label">电话</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input2" value=""  readonly="readonly">
    </div>
  </div>
  <div class="form-group">
    <label for="input1" class="col-md-2 control-label">研究方向</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input1" value="" readonly="readonly">
    </div>
     <label for="input4" class="col-md-2 control-label">考研分数</label>
    <div class="col-md-4 ">
      <input type="text" class="form-control" id="input4" readonly="readonly">
    </div>
  </div>
    <div class="form-group">
    <label for="input5" class="col-md-2 control-label">毕业院校</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input5" value="" readonly="readonly">
    </div>
     <label for="input6" class="col-md-2 control-label">毕业专业</label>
    <div class="col-md-4 ">
      <input type="text" class="form-control" id="input6" readonly="readonly">
    </div>
  </div>
   <div class="form-group">
    <label for="input7" class="col-md-2 control-label">硕士类型</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input7" value="" readonly="readonly">
    </div>
     <label for="input8" class="col-md-2 control-label">总分</label>
    <div class="col-md-4 has-error">
      <input type="text" class="form-control" id="input8" value="" readonly="readonly">
    </div>
  </div>
 <div class="form-group">
    <label for="input9" class="col-md-2 control-label">政治</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input9" value="" readonly="readonly">
    </div>
     <label for="input10" class="col-md-2 control-label">英语</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input10" value="" readonly="readonly">
    </div>
  </div>
   <div class="form-group">
    <label for="input11" class="col-md-2 control-label">专业科一</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input11" value="" readonly="readonly">
    </div>
     <label for="input12" class="col-md-2 control-label">专业科二</label>
    <div class="col-md-4 ">
      <input type="text" class="form-control" id="input12" value="" readonly="readonly">
    </div>
  </div>
  <div class="form-group">
    <label for="input13" class="col-md-2 control-label">研究方向</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input13" value="" readonly="readonly">
    </div>
     <label for="input14" class="col-md-2 control-label">附件</label>
    <div class="col-md-4" id="down">
     <a id="download" style="line-height:12px;padding-left: 20px;margin-top: 80px;">下载</a>
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

<!-- 选择确认框 -->

<div class="modal fade" tabindex="-1" role="dialog" id="modal5" style="color: black;">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">信息提示</h4>
      </div>
      <div class="modal-body" style="text-align: center">
      <span id="showmsg" style="font-size: 15px"></span>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="btn5">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


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

</body>
<script type="text/javascript">
$(function(){
	var managerId = "${managerloginfo.info.managerId}";
	var realNum = "${managerloginfo.info.managerRatednum}";
	$.ajax({
		url:"${path}/searchSelect",
		data:{'managerId':managerId},
		type:"POST",
		success:function(data){
			if(data.msg=="success"){
				
				$("#showNum").css("color","red").text("当前已选择人数:"+data.num+",计划人数:"+realNum);
				$("input[name='managerId']").val("${managerloginfo.managerId}")
			 buildTal(data);
				if(data.num == realNum){
					$("button").attr("disabled","disabled");
				}
				
			}
		}
	});
});

$("#search").click(function(){
	$("#tab2 tbody").empty();
	var managerId = "${managerloginfo.info.managerId}";
	var stuName=$("#stuName").val();
	var stuTel = $("#stuTel").val();
	var str={"stuName":stuName,"stuTel":stuTel,"managerId":managerId};
	$.ajax({
		url:"${path}/searchSelectByExample",
		contentType:"application/json",
		dataType : "json", 
		type:"POST",
		data:JSON.stringify(str),
		success:function(data){
			if(data.msg=="success"){
				
				$("#showNum").css("color","red").text("当前已选择人数:"+data.num);
				$("input[name='managerId']").val("${managerloginfo.managerId}")
			 buildTal(data);
				
			}
		}
	});
});

function buildTal(data){
	$("#tab2 tbody").empty();
	for(var o in data.info){
		
		var tr = $("<tr></tr>");
		var index = $("<td></td>").text(eval(o)+1);
		var name = $("<td></td>").text(data.info[o].STU_NAME);
		var score = $("<td></td>").text(data.info[o].STU_TOTALSCORE1);
		var master = $("<td></td>").text(data.info[o].STU_MASTERTYPE);
		var school = $("<td></td>").text(data.info[o].STU_GRADUATIONSCHOOL);
		var sex = $("<td></td>").text(data.info[o].STU_SEX);
		var hide =$("<input type='hidden' name='stuId'>").val(data.info[o].STU_ID);
		var state = data.info[o].STU_STATE;
		if(state == '4'){
			var btn2 = $("<td><button class='btn btn-danger btn2' disabled='disabled'>已选择</button></td>");
			var btn3 = $("<td><button class='btn btn-primary btn3'  disabled='disabled'>拒绝</button></td>");
		}else {
			var btn2 = $("<td><button class='btn btn-danger btn2'>确认选择</button></td>");
			var btn3 = $("<td><button class='btn btn-primary btn3'>拒绝</button></td>");
		}
		var btn1 = $("<td><button class='btn btn-primary btn1'>详情</button></td>");
		//var btn3 = $("<td><button class='btn btn-primary btn3'>拒绝</button></td>");
		tr.append(index).append(name).append(sex).append(score).append(master).append(school).append(btn1).append(btn3).append(btn2).append(hide).appendTo($("#tab2 tbody"));
		 
	}
}

$(document).on("click",'.btn1',function(){
	var stuId = $(this).parent().parent("tr").find("input[name='stuId']").val();
	$.ajax({
		url:"${path}/selectStuInfo?stuId="+stuId,
		type:"GET",
		success:function(data){
			var msg = data.msg;
			if(msg=="success"){
				console.log(data.info);
				$("#input1").val(data.info.stuMajorcondition);
				$("#input2").val(data.info.stuTel);
				$("#input3").val(data.info.stuName);
				$("#input4").val(data.info.stuTotalscore1);
				$("#input5").val(data.info.stuGraduationschool);
				$("#input6").val(data.info.stuGraduationmajor);
				$("#input7").val(data.info.stuMastertype);
				$("#input8").val(data.info.stuTotalscore1);
				$("#input9").val(data.info.stuPolotics);
				$("#input10").val(data.info.stuEnglish);
				$("#input11").val(data.info.stuSub1);
				$("#input12").val(data.info.stuSub2);
				$("#input13").val(data.info.stuMajorcondition);
				var candidate = data.info.stuCandidate;
				if(data.info.stuHonor!=null){
					$("#download").attr("href","${path}/downloadExtra?stuCandidate="+candidate);
				}else{
					$("#down").attr("hidden","hidden");
				}
				
				
			}
		}
	});
	
	$("#modal4").modal(function(){
		backdrop:'static'
	});
});

$(document).on("click",'.btn2',function(){
	$("#showmsg").empty();
	$("#showmsg").text("是否选择该学生???").css("color","red");
	$("#modal5").modal(function(){
		backdrop:'static'
	});
	var stuId = $(this).parent().parent("tr").find("input[name='stuId']").val();
	var managerId = "${managerloginfo.info.managerId}";
	$("#btn5").click(function(){
		$("#modal5").modal('hide');
		$.ajax({
			url:'${path}/selectOneStu?managerId='+managerId+"&stuId="+stuId,
			type:'GET',
			async:false,
			success:function(data){
				if(data.msg=="success"){
					console.log(data);
					$("#showmsg2").empty();
					$("#showmsg2").text("操作成功").css("color","green");
					$("#showNum").css("color","red").text("当前已选择人数:"+data.info.managerSelected);
					$("#modal6").modal(function(){
						backdrop:'static'
					});
				}else{
					$("#showmsg2").empty();
					$("#showmsg2").text("操作失败").css("color","red");
					$("#modal6").modal(function(){
						backdrop:'static'
					});
				}
			}
		});
	});

});

$("#btn6").click(function(){
	$('#modal6').modal('hide');
	$('#modal6').on('hidden.bs.modal', function () {
		$("#main").load("showSelect");
		});
});
$("#btnn").click(function(){
	$("#modal4").modal('hide');
});
$(document).on("click",'.btn3',function(){
	
	$("#showmsg").empty();
	$("#showmsg").text("是否拒绝该学生???").css("color","red");
	$("#modal5").modal(function(){
		backdrop:'static'
	});
	var stuId = $(this).parent().parent("tr").find("input[name='stuId']").val();
	var managerId = "${managerloginfo.info.managerId}";
	
	$("#btn5").click(function(){
		$("#modal5").modal('hide');
		$.ajax({
			url:"${path}/cancleSelect?stuId="+stuId,
			type:"GET",
			success:function(data){
				if(data.msg=="success"){
					console.log(data);
					$("#showmsg2").empty();
					$("#showmsg2").text("操作成功").css("color","green");
					$("#modal6").modal(function(){
						backdrop:'static'
					});
					$("#btn6").click(function(){
						$('#modal6').modal('hide');
						$('#modal6').on('hidden.bs.modal', function () {
							$("#main").load("showSelect");
							});
					});
				}
			}
			
		});
		
	});
	
	
});

</script>
</html>