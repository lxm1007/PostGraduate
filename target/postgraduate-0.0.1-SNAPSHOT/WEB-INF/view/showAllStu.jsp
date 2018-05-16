<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%request.setAttribute("info", request.getSession().getAttribute("loginfo")); %>
     <%request.setAttribute("path", request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>信息完善</title>

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
<body>
<div class="col-md-offset-10 col-md-4">
<button id="addOne" class="btn btn-success">添加记录</button>
</div>
<form class="form-inline" id="form1">
  <div class="form-group col-md-offset-3" >
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
	<div class="col-md-offset-3">
<table class="table table-hover  table-condensed " id="tab2">
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
      <input type="text" class="form-control" id="input3" value="" name="stuName">
    </div>
    <label for="input2" class="col-md-2 control-label">电话</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input2" value="" name="stuTel" >
    </div>
  </div>
  <div class="form-group">
    <label for="input1" class="col-md-2 control-label">研究方向</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input1" value="" name="stuMajorcondition" >
    </div>
     <label for="input4" class="col-md-2 control-label">性别</label>
    <div class="col-md-4 ">
      <input type="text" class="form-control" id="input4"  >
    </div>
  </div>
    <div class="form-group">
    <label for="input5" class="col-md-2 control-label">毕业院校</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input5" value="" name="stuGraduationschool">
    </div>
     <label for="input6" class="col-md-2 control-label">毕业专业</label>
    <div class="col-md-4 ">
      <input type="text" class="form-control" id="input6" name="stuGraduationmajor">
    </div>
  </div>
   <div class="form-group">
    <label for="input7" class="col-md-2 control-label">硕士类型</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input7" value="" name="stuMastertype">
    </div>
     <label for="input8" class="col-md-2 control-label">总分</label>
    <div class="col-md-4 has-error">
      <input type="text" class="form-control" id="input8" value="" name="stuTotalscore1">
    </div>
  </div>
 <div class="form-group">
    <label for="input9" class="col-md-2 control-label">政治</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input9" value="" name="stuPolotics">
    </div>
     <label for="input10" class="col-md-2 control-label">英语</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input10" value="" name="stuEnglish" >
    </div>
  </div>
   <div class="form-group">
    <label for="input11" class="col-md-2 control-label">专业科一</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input11" value="" name="stuSub1">
    </div>
     <label for="input12" class="col-md-2 control-label">专业科二</label>
    <div class="col-md-4 ">
      <input type="text" class="form-control" id="input12" value="" name="stuSub2">
      <input type="hidden" id="stuIdVal" name="stuId">
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
<!-- 添加的模态框 -->
<div class="modal fade" tabindex="-1" role="dialog" id="modal7" style="color: black;">
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
      <input type="text" class="form-control" id="input33" value="" name="stuName" required="required">
    </div>
    <label for="input22" class="col-md-2 control-label">电话</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input22" value=""  required="required">
    </div>
  </div>
  <div class="form-group">
    <label for="input11" class="col-md-2 control-label">研究方向</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input11" value="" name="stuMajorcondition" required="required">
    </div>
     <label for="input44" class="col-md-2 control-label">性别</label>
    <div class="col-md-4 ">
      <input type="text" class="form-control" id="input4"  name="stuSex" required="required">
    </div>
  </div>
    <div class="form-group">
    <label for="input55" class="col-md-2 control-label">毕业院校</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input55" value="" name="stuGraduationschool" required="required">
    </div>
     <label for="input66" class="col-md-2 control-label">毕业专业</label>
    <div class="col-md-4 ">
      <input type="text" class="form-control" id="input66" name="stuGraduationmajor" required="required">
    </div>
  </div>
   <div class="form-group">
    <label for="input77" class="col-md-2 control-label">硕士类型</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input77" value="" name="stuMastertype" placeholder="学硕/专硕" required="required">
    </div>
     <label for="input88" class="col-md-2 control-label">总分</label>
    <div class="col-md-4 has-error">
      <input type="text" class="form-control" id="input88" value="" name="stuTotalscore1" required="required">
    </div>
  </div>
 <div class="form-group">
    <label for="input99" class="col-md-2 control-label">政治</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input99" value="" name="stuPolotics" required="required">
    </div>
     <label for="input100" class="col-md-2 control-label">英语</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input100" value="" name="stuEnglish" required="required" >
    </div>
  </div>
   <div class="form-group">
    <label for="input111" class="col-md-2 control-label">专业科一</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input111" value="" name="stuSub1" required="required">
    </div>
     <label for="input122" class="col-md-2 control-label">专业科二</label>
    <div class="col-md-4 ">
      <input type="text" class="form-control" id="input122" value="" name="stuSub2" required="required">
      
    </div>
  </div>
   <div class="form-group">
    <label for="input133" class="col-md-2 control-label">专业代码</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input133" value="" name="stuSpecialtycode" required="required">
    </div>
     <label for="input144" class="col-md-2 control-label">学生考号</label>
    <div class="col-md-4 ">
      <input type="text" class="form-control" id="input144" value="" name="stuCandidate" required="required">
      
    </div>
  </div>
  <div class="form-group">
    <label for="input155" class="col-md-2 control-label">授课方式</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input155" value="" name="stuStudytype"  placeholder="全日制/非全日制" required="required">
    </div>
     <label for="input166" class="col-md-2 control-label">毕业时间</label>
    <div class="col-md-4 ">
      <input type="text" class="form-control" id="input166" value="" name="stuGraduationtime" placeholder="201807" required="required">
      
    </div>
  </div>
  <div class="form-group">
    <label for="input1777" class="col-md-2 control-label">专业</label>
    <div class="col-md-4">
      <input type="text" class="form-control" id="input177" value="" name="stuMajorname"   required="required">
    </div>
   <div><span id="msg" style="font-size: 10px"></span></div>
  </div>
 
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="btnn2">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!--  -->
<!--  -->


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
		url:"${path}/searchAllStu",
		type:"POST",
		success:function(data){
			
			buildTal(data);
		}
	});
});
function buildTal(data){
	for(var o in data.info){
		
		var tr = $("<tr></tr>");
		var index = $("<td></td>").text(eval(o)+1);
		var name = $("<td></td>").text(data.info[o].stuName);
		var score = $("<td></td>").text(data.info[o].stuTotalscore1);
		var master = $("<td></td>").text(data.info[o].stuMastertype);
		var school = $("<td></td>").text(data.info[o].stuGraduationschool);
		var sex = $("<td></td>").text(data.info[o].stuSex);
		var hide =$("<input type='hidden' name='stuId'>").val(data.info[o].stuId);
		var state = data.info[o].stuState;
	
		var btn2 = $("<td><button class='btn btn-danger btn2'>删除</button></td>");
	
		var btn1 = $("<td><button class='btn btn-primary btn1'>详情</button></td>");
		
		tr.append(index).append(name).append(sex).append(score).append(master).append(school).append(btn1).append(btn2).append(hide).appendTo($("#tab2 tbody"));
		 
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
				$("#input1").val(data.info.stuMajorcondition);
				$("#input2").val(data.info.stuTel);
				$("#input3").val(data.info.stuName);
				$("#input4").val(data.info.stuSex);
				$("#input5").val(data.info.stuGraduationschool);
				$("#input6").val(data.info.stuGraduationmajor);
				$("#input7").val(data.info.stuMastertype);
				$("#input8").val(data.info.stuTotalscore1);
				$("#input9").val(data.info.stuPolotics);
				$("#input10").val(data.info.stuEnglish);
				$("#input11").val(data.info.stuSub1);
				$("#input12").val(data.info.stuSub2);
				$("#stuIdVal").val(data.info.stuId);
			}
		}
	});
	
	$("#modal4").modal(function(){
		backdrop:'static'
	});
});

$(document).on("click",'.btn2',function(){
	$("#showmsg").empty();
	$("#showmsg").text("是否确认删除").css("color","red");
	$("#modal5").modal(function(){
		backdrop:'static'
	});
	var stuId = $(this).parent().parent("tr").find("input[name='stuId']").val();
	$("#btn5").click(function(){
		$("#modal5").modal('hide');
		$.ajax({
			url:'${path}/deleteOneStu?&stuId='+stuId,
			type:'GET',
			async:false,
			success:function(data){
				if(data.msg=="success"){
					$("#showmsg2").empty();
					$("#showmsg2").text("操作成功").css("color","green");
					
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
		$("#main").load("updateStuInfo");
		});
});
$("#btnn").click(function(){
	$("#modal4").modal('hide');
	$.ajax({
		url:"${path}/updateStuInfoByTea",
		data:$("#data").serialize(),
		success:function(data){
			if(data.msg=="success"){
				$("#showmsg").css("color","green").text("操作成功");
				
			}else{
				$("#showmsg").css("color","red").text("操作失败");
			}
			$("#modal5").modal(function(){
				backdrop:'static'
			});
			
			$("#btn5").click(function(){
				$("#modal5").modal('hide');
				$('#modal5').on('hidden.bs.modal', function (e) {
					$("#main").load("updateStuInfo");
					});
				
			});
		}
	});
});

$("#search").click(function(){
	$("#tab2 tbody").empty();
	
	var stuName=$("#stuName").val();
	var stuTel = $("#stuTel").val();
	var str={"stuName":stuName,"stuTel":stuTel};
	$.ajax({
		url:"${path}/searchAllStuByExample?stuName="+stuName+"&&stuTel="+stuTel,
		type:"GET",
		success:function(data){
			if(data.msg=="success"){
				
			 buildTal(data);
				
			}
		}
	});
});
</script>
<script type="text/javascript">
$("#addOne").click(function(){
	$("#modal7").modal(function(){
		backdrop:'static'
	});
	
	$("#btnn2").click(function(){
		$.ajax({
			url:"${path}/addOneByTea",
			data:$("#data2").serialize(),
			success:function(data){
				if(data.msg=="success"){
					$("#modal7").modal('hide');
				}else{
					$("#msg").css("color","red").text("数据库错误!!!");
				}
			}
		});
		
	});
});
/*
$("#clear").click(function(){
	$("#showmsg4").css("color","red").text("确定要删除所有数据????")
	$("#modal8").modal(function(){
		backdrop:'static'
	});
	$("#btn8").click(function(){
		$.ajax({
			url:"${path}/deleteAllStu",
			type:"GET",
			success:function(data){
				$("#modal8").modal('hide');
				$('#modal8').on('hidden.bs.modal', function () {
					$("#main").load("updateStuInfo");
					});
				
			}
		});
	});
});
*/
</script>

</html>