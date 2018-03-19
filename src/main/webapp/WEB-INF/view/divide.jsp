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
<div class="col-md-offset-9 col-md-3" style="color: black"><button class="btn btn-success" id="add" type="button">添加到组</button><button class="btn btn-danger" id="showGroup" type="button">编辑分组</button></div>
<div class="col-md-offset-3" style="color: black;">
<table class="table table-hover  table-condensed " id="tab2">
<thead>
	
		<td>序号</td>
		<td>姓名</td>
		<td>电话</td>
		<td>专业</td>
		<td>总分</td>
	
		
		<td>操作</td>
	
	
	</thead>
	<tbody>
	</tbody>
	</table>
</div>

<div class="modal fade" tabindex="-1" role="dialog" id="modal4" style="color: black;">
  <div class="modal-dialog 	modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">信息提示</h4>
      </div>
      <div class="modal-body">
      <h4>是否要对这<span style="color: red;font-size: 18px" id="num"></span>条数据进行分组???</h4>
	<form class="form-horizontal" id="data"> 
    <div class="col-md-2">
   <input type="text" name="group" id="group" placeholder="组别/01">
   <input type="hidden" id="stuId" name="id">
    </div>
<br><br>
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="btnn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="modal fade" tabindex="-1" role="dialog" id="modal5" style="color: black;">
  <div class="modal-dialog 	modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">信息提示</h4>
      </div>
      <div class="modal-body">
      <h4>操作成功</h4>
	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="btnn2">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
<script type="text/javascript">
$.ajax({
	url:"${path}/searchAllStuByTea",
	type:"POST",
	success:function(data){
		buildTal(data);
	}
});

function buildTal(data){
	for(var o in data.info){
		
		var tr = $("<tr></tr>");
		var index = $("<td></td>").text(eval(o)+1);
		var name = $("<td></td>").text(data.info[o].stuName);
		var tel = $("<td></td>").text(data.info[o].stuTel==null?"":data.info[o].stuTel);
		var major= $("<td></td>").text(data.info[o].stuMajorname);
		var score = $("<td></td>").text(data.info[o].stuTotalscore1);
		
		var hide =$("<input type='hidden' name='managerId'>").val(data.info[o].stuId);

		var btn1 = $("<input type='checkbox' class='check'>").val(data.info[o].stuId);
		var checkbox = $("<td></td>").append(btn1);
		tr.append(index).append(name).append(tel).append(major).append(score).append(checkbox).append(hide).appendTo($("#tab2 tbody"));
		 
	}
}
$("#add").click(function(){
	var idArr = "";
	  $.each($('input:checkbox:checked'),function(){
         idArr = idArr+$(this).val()+",";
      });
	 arr = idArr.substring(0,idArr.length-1);
	 var strArr = arr.split(',');
	 var num = strArr.length;
	 if(arr==""){
		 num=0;	
		 $("#btnn").attr("disabled","disabled");
	 }else{
		 $("#btnn").removeAttr("disabled");
	 }
	 $("#num").text(num);
	 $("#stuId").val(arr);
	 $("#modal4").modal(function(){
		 backdrop:'static'
	 });
});
$("#btnn").click(function(){
	var group = $("#group").val();
	var id = $("#stuId").val();
	var searchData = {"group":group,"id":id};
	$.ajax({
		url:"${path}/addOneGroup",
		contentType:"application/json",
		dataType : "json", 
		type:"POST",
		data:JSON.stringify(searchData),
		success:function(data){
			if(data.msg=="success"){
				$("#modal4").modal('hide');
				$("#modal5").modal(function(){
					backdrop:'static'
				});
			}
		}
	});
});
$("#btnn2").click(function(){
	$("#modal5").modal('hide');
	$("#modal5").on('hidden.bs.modal',function(){
		$("#main").load("divide");
	})

});
$("#showGroup").click(function(){
	$("#main").load("allGroup");
});
</script>
</html>