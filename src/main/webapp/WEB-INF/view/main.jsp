<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%request.setAttribute("info", request.getSession().getAttribute("loginfo")); %>
    <%request.setAttribute("managerloginfo", request.getSession().getAttribute("managerloginfo")); %>
   
    <% request.setAttribute("path", request.getContextPath()); %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html>
<html lang="zh">
	<head>
		<meta charset="utf-8">
	 	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
		<link rel="stylesheet" href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css" media="screen"/>
		<title>首页</title>
		<link rel="stylesheet" type="text/css" href="${path}/static/bootstrap-3.3.7-dist/css/htmleaf-demo.css">
		<link rel="stylesheet" type="text/css" href="${path}/static/bootstrap-3.3.7-dist/css/nav.css">
       <link rel="stylesheet" type="text/css" href="${path}/static/bootstrap-3.3.7-dist/fonts/iconfont.css">
       <style type="text/css">
       
       	.text1{
       	color:black;
	 font-style: inherit;
	 text-align: center;
	 line-height:420%;
	 font-size: 10px;
	 padding-top: 13px;
	}
	.nav{
	width: 100px;
	height: 100%;
	background: #263238;
	transition: all .3s; 
	position: absolute;
	top:0;
	left: 0;
	}

	.spanText{
	font-size: 10px;
	
	}
	.spanTextSon{
	font-size: 8px;
	}
	
	.nav .nav-icon{
	font-size: 15px;
	}
	.nav a span{
	margin-left: 20px;
	}
	@media (min-width: 768px) {
			.text1 {
			 font-size:20px;
			 font-style: inherit;
			 text-align: center;
			 line-height:420%;
			 padding-top: 5px;
			 
			}
			.nav{
				width: 220px;
				height: 100%;
				background: #263238;
				transition: all .3s; 
				position: absolute;
				top:0;
				left: 0;
				}
				
				.spanText{
			font-size: 15px;
			text-decoration: none;
			
			}
			.spanTextSon{
			font-size: 10px;
			}
			
			.nav .nav-icon{
			font-size: 20px;
			}
			.nav a span{
			margin-left: 20px;
			}
				
				}
		@media (min-width: 992px) {
		.text1 {
			font-size:30px;
		 	font-style: inherit;
		 	text-align: center;
	 		line-height:420%;
	 		 padding-top: 5px;
		}
		
		.nav{
			width: 220px;
			height: 100%;
			background: #263238;
			transition: all .3s; 
			position: absolute;
			top:0;
			left: 0;
			}
		.spanText{
		font-size: 20px;
		padding-left: 18px;
		}
		.spanTextSon{
		font-size: 15px;
		padding-left: 30px;
		}
		
		.nav .nav-icon{
		font-size: 22px;
		text-align: center;
		}
		.nav a span{
		margin-left: 25px;
		}
		
		.nav-more{
		margin-right: 45px;
		}
			}
     
       </style>
       
       <script type="text/javascript" src="${path }/static/bootstrap-3.3.7-dist/jquery-3.2.1.js"></script>
			<script type="text/javascript" src="${path}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
			<script type="text/javascript" src="${path}/static/bootstrap-3.3.7-dist/js/nav.js"></script>
       
	</head>
		<body>
			<div class="nav">
			        <div class="nav-top">
			            <div id="mini" style="border-bottom:1px solid rgba(255,255,255,.1)"><img src="${path }/static/img/mini.png" ></div>
			            
			        </div>
			        <ul id="ul11">
			            <li class="nav-item" id="lii1">
			                <a id="a1" href="javascript:;"><i class="my-icon nav-icon icon_1"></i><span class="spanText">学生信息</span><i class="my-icon nav-more"></i></a>
			                <ul id="ul1">
			                    <li id="li11"><a href="javascript:updateInfo1();"><span class="spanTextSon">我的信息</span></a></li>
			                    <li id="li13"><a href="javascript:showFirtstScore();"><span class="spanTextSon">报考信息</span></a></li>
			                    <li id="li12"><a href="javascript:searchInfo()"><span class="spanTextSon">已选老师</span></a></li>
			                    
			                   
			                </ul>
			            </li>
			            <li class="nav-item" id="li2">
			                <a id="a2" href="javascript:;"><i class="my-icon nav-icon icon_2"></i><span class="spanText">教师信息</span><i class="my-icon nav-more"></i></a>
			                <ul id="ul2">
			                    <li id="li21"><a href="javascript:updateInfo2();"><span class="spanTextSon">我的信息</span></a></li>
			                    <li id="li22"><a href="javascript:jump()"><span class="spanTextSon">详细介绍</span></a></li>
			                    <li id="li23"><a href="javascript:showSelect();"><span class="spanTextSon">选择情况</span></a></li>
			                    <li id="li24"><a href="Javascript:searchTea()"><span class="spanTextSon">导师选择</span></a></li>
			                    <li id="li25"><a href="Javascript:updatePwd()"><span class="spanTextSon">修改密码</span></a></li>
			                    
			                </ul>
			            </li>
			            <li class="nav-item" id="li3">
			                <a id="a3" href="javascript:;"><i class="my-icon nav-icon icon_3"></i><span class="spanText">管理信息</span><i class="my-icon nav-more"></i></a>
			                <ul d="ul3">
			                    <li id="li31"><a  href="javascript:upload1();"><span class="spanTextSon">上传初试分数</span></a></li>
			                    <li id="li32"><a href="javascript:addReTestScore();"><span class="spanTextSon">上传复试笔试分数</span></a></li>
			                    <li id="li33"><a href="javascript:addReTestScore2();"><span class="spanTextSon">上传复试面试分数</span></a></li>
			                   <!--  <li id="li34"><a href="javascript:updateSub();"><span class="spanTextSon">修改复试成绩比例</span></a></li> -->
			                    <li id="li35"><a href="javascript:emptyTea();"><span class="spanTextSon">解除学生与导师关系</span></a></li>
			                    <li id="li36"><a href="javascript:upload2();"><span class="spanTextSon">上传教师信息</span></a></li>
			                    <li id="li37"><a href="javascript:updateStuInfo();"><span class="spanTextSon">学生信息维护</span></a></li>
			                    <li id="li38"><a href="javascript:updateTeaInfo();"><span class="spanTextSon">教师信息维护</span></a></li>
			                    <li id="li39"><a href="javascript:divide();"><span class="spanTextSon">复试分组</span></a></li>
			                    <!-- <li id="li40"><a href="javascript:assignYjr();"><span class="spanTextSon">指定/解除复试阅卷人</span></a></li> -->
			                   <!--  <li id="li41"><a href="javascript:assignMszz();"><span class="spanTextSon">指定/解除面试组长</span></a></li>-->
			                    <li id="li42"><a href="javascript:calculateScore();"><span class="spanTextSon">计算成绩</span></a></li>
			                    <li id="li43"><a href="javascript:empty();"><span class="spanTextSon">清空数据库</span></a></li>
			                </ul>
			            </li>
			        </ul>
			    </div>
			<div class="htmleaf-container">
			<div class="col-md-5  col-md-offset-2 col-xs-5 col-xs-offset-3" style="height:85px;margin-top: 15px"><img class="img-responsive" src="${path}/static/img/banner.png"></div>
			<div class="col-md-3  col-xs-4 text1">研究生信息管理</div><span class="glyphicon glyphicon-off" style="color: red;font-size: 18px;padding-top: 60px" id="logout">注销</span>
	
			</div>
			<br>
			<div id="main" class="col-md-8 col-md-offset-2"></div>
			
			
			<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" >
				  <div class="modal-dialog" role="document" style="width:350px;text-align: center;">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
				        <h4 class="modal-title" id="myModalLabel">信息提示</h4>
				      </div>
				      <div class="modal-body">
				      		<span id="showmsg" style="text-align: center;"></span><br>
				      		<span id="showmsg2" style="text-align: center;"></span>
				      </div>
				      <div class="modal-footer">
				        <input type="hidden" name="role">
				        <button type="button" id="btn1" class="btn btn-primary">确定</button>
				      </div>
				    </div>
				  </div>
				</div>
			
			
	  </body>
	  <script type="text/javascript">
	  	$(function(){
	  	
console.log(" 				 /\\            /\\  \n" +
			"    			/  \\          /  \\  \n"+
			"		  	   /    \\        /    \\  \n"+
			"\n"		  									+
			"  												\n"+
			"      				 =========			 \n"+
			"	  有任何疑问,请尽情骚扰网站创作人，微信与手机同步\n"+
			"	  		        15853261424					 \n"	);
			  		
	  		var role1 = "${info.role}";
	  		var role2  = "${managerloginfo.role}";
	  		var stustate = "0";
	  		var name = "";
	  		if(role1=="2"){
	  			name = "${info.info.stuName}";
	  			stustate = "${info.info.stuState}";
	  			$("#li3").remove();
	  			$("#li21").remove();
	  			$("#li23").remove();
	  			$("#li25").remove();
	  			if(stustate=="1"){
	  				
	  				$("#showmsg").css("color","black").css("font-size","18px").text(name+"  您好!");
		  			$("#showmsg2").css("color","red").css("font-size","18px").text("请您完善个人信息");
		  			$("#myModal").modal(function(){
			  			backdrop:'static'
			  		});
	  			}
	  			
	  			
	  		}
	  		else if(role2=="1"){
	  		
	  			name="${managerloginfo.info.managerName}";
	  			state = "${managerloginfo.info.managerState}";
	  			var type = "${managerloginfo.info.managerType}";
  				if(type==2){
  					$("#lii1").remove();
  		  			$("#li22").remove();
  		  			$("#li24").remove();
  		  			$("#li3").remove();
  				}else if(type==1){
  					$("#lii1").remove();
  		  			$("#li22").remove();
  		  			$("#li23").remove();
  		  			$("#li24").remove();
  				}
	  		
	  			if(state=="1"){
	  				$("#showmsg").css("color","black").css("font-size","18px").text(name+"  老师"+"您好");
	  				$("#showmsg2").css("color","red").css("font-size","18px").text("请您完善个人信息");
	  				$("#myModal").modal(function(){
			  			backdrop:'static'
			  		});
	  			}
	
	  		}
	  		
	  	});
	  	$("#btn1").click(function(){
	  		$("#myModal").modal('hide');
	  		var role = "${info.role}";
	  		if(role=="2"){
	  		
	  		var state = "${info.info.stuState}"
	  		if(state=="1"){
		  		$("#main").load("updateInfo");
	  		}
	  		
	  		}
	  		
	  		var role2 = "${managerloginfo.role}";
	  		if(role2=="1"){
	  			$("#myModal").modal('hide');
	  			$("#main").load("updateTeacherInfo");
	  		}
	  		
	  	});
	  	function updateInfo1(){
	  		$("#main").load("updateInfo");
	  	}
	  	
	  	function searchTea(){
	  		$.ajax({
	  			url:"${path}/checkStuState?stuId="+"${info.info.stuId}",
	  			type:"POST",
	  			success:function(data){
	  				if(data.info.stuState=="1"){
	  					alert("请完善个人信息！！");
	  				}else{
	  					$("#main").load("seachTea");
	  				}
	  			}
	  			
	  		});
	  		
	  	}

	  	function searchInfo(){
	  		$("#main").load("searchInfo");
	  	}
	  	
	  	function updateInfo2(){
	  		$("#main").load("updateTeacherInfo");
	  	}
	  	
	  	function showSelect(){
	  		$("#main").load("showSelect");
	  	}
	  	
	  	function upload1(){
	  		$("#main").load("upload1");
	  	}
	  	
	  	function showFirtstScore(){
	  		$("#main").load("showFirtstScore");
	  	}
	  	
	  	function upload2(){
	  		$("#main").load("uploadManagerInfo");
	  	}
	  	
	  	function updateSub(){
	  		$("#main").load("updateSub");
	  	}
	  	
	  	function updateStuInfo(){
	  		$("#main").load("updateStuInfo");
	  	}
	  	
	  	function updateTeaInfo(){
	  		$("#main").load("updateTeaInfo");
	  	}
	  	
	  	function divide(){
	  		$("#main").load("divide");
	  	}
	  	function emptyTea(){
	  		$("#main").load("emptyTea");
	  	}
	  	function addReTestScore(){
	  		$("#main").load("addReTestScore",{"type":"1"});
	  	}
	  	function addReTestScore2(){
	  		$("#main").load("addReTestScore",{"type":"2"});
	  	}
	  	function assignYjr(){
	  		$("#main").load("assign",{"type":"31"});
	  	}
	  	function assignMszz(){
	  		$("#main").load("assign",{"type":"32"});
	  	}
	  	function calculateScore(){
	  		$("#main").load("calculateScore");
	  	}
	  	
	  	function updatePwd(){
	  		$("#main").load("updateTeaPwd");
	  	}
	  	$("#logout").click(function(){
	  		window.location.href = "${path}/logout";
	  	});
	  	
	  	function jump(){
	  		window.open("http://cise.sdust.edu.cn/web2010/cp.php?ac=teachers&tuid=1");
	  	}
	  
	  	function empty(){
	  		var f = confirm("是否确认清空数据库？？？");
	  		if(f){
	  			$.ajax({
	  				url:"${path}/empty",
	  				type:"POST",
	  				success:function(data){
	  					if(data.msg=="success"){
	  						alert("清空成功");
	  					}else{
	  						alert("清空失败或数据为空");
	  					}
	  				}
	  			});
	  		}
	  	}
	  </script>
	  
</html>