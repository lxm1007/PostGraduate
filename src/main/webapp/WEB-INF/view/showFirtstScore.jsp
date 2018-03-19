<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%request.setAttribute("info", request.getSession().getAttribute("loginfo")); %>
     <%request.setAttribute("path", request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>报考信息</title>

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
<div id="tab1" style="text-align: center">

	<form id="form3"  method="post" enctype="multipart/form-data">
	<div class="form-group has-success">
	<label class="col-md-2 col-xs-3 col-xs-offset-3 col-md-offset-0 control-label">总分</label>
	<div class="col-md-4 col-xs-6">
 	<input type="text" class="form-control form"   value="${info.info.stuTotalscore1 }" readonly="readonly">
 	</div>
	</div>
		
	<div id="telClass" class="form-group has-warning">
	  <label class=" col-md-2  col-xs-3 col-xs-offset-3 col-md-offset-0 control-label">政治</label>
	  <div class="col-md-3 col-xs-6">
	  <span id="telspan"></span>
	  <input type="text" class="form-control form"   value="${info.info.stuPolotics }" readonly="readonly">
	  </div>
	</div>
	<div class="col-md-12"><br></div>
	<div id="idcardClass" class="form-group has-warning">
	  <label class="col-md-2 col-xs-3 col-xs-offset-3 col-md-offset-0  control-label">英语</label>
	  <div class="col-md-3 col-xs-6">
	  <span id="idspan"></span>
	  <input type="text" class="form-control form"   value="${info.info.stuEnglish }" readonly="readonly">

	  </div>
	  <div class="col-md-1 col-xs-12"></div>
	</div>
		
	<div id="emailClass" class="form-group has-warning">
	 <label class="col-md-2 col-xs-3 col-xs-offset-3 col-md-offset-0  control-label">业务科1</label>
	 <div class="col-md-3 col-xs-6">
	  <span id="emailspan"></span>
	  <input type="text" class="form-control form"   value="${info.info.stuSub1 }" readonly="readonly">
	  </div>
	</div>
	<div class="col-md-12"><br></div>
	<div id="qqClass" class="form-group has-warning" >
	 <label class="col-sm-2 col-md-2  col-xs-3 col-xs-offset-3 col-md-offset-0 control-label">业务科2</label>
	 <div class="col-md-3 col-xs-6">
	  <span id="qqspan"></span>
	  <input type="number" class="form-control form"   readonly="readonly" value="${info.info.stuSub2 }">
	  </div>
	  <div class="col-md-1"></div>
	</div>
	<div id="wechatClass" class="form-group has-warning">
	 <label class="col-sm-2 col-md-2 col-xs-3 col-xs-offset-3 col-md-offset-0 control-label">报考专业</label>
	 <div class="col-md-3 col-xs-6">
	  <span id="wechatspan"></span>
	  <input type="text" class="form-control form"   readonly="readonly" value="${info.info.stuMajorname }">
	  </div>
	</div>
	<div class="col-md-12 col-xs-12"><br></div>
	<div id="qqClass" class="form-group has-warning" >
	 <label class="col-sm-2 col-md-2  col-xs-3 col-xs-offset-3 col-md-offset-0 control-label">毕业学校</label>
	 <div class="col-md-3 col-xs-6">
	  <span id="qqspan"></span>																
	  <input type="number" class="form-control form"   readonly="readonly" value="${info.info.stuGraduationschool}">
	  </div>
	  <div class="col-md-1"></div>
	</div>
	<div id="wechatClass" class="form-group has-warning">
	 <label class="col-sm-2 col-md-2 col-xs-3 col-xs-offset-3 col-md-offset-0 control-label">本科专业</label>
	 <div class="col-md-3 col-xs-6">
	  <span id="wechatspan"></span>
	  <input type="text" class="form-control form"   readonly="readonly" value="${info.info.stuGraduationmajor }">
	  </div>
	</div>
	
</body>

</html>