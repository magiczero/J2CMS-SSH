<%@ page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
<%@ include file="../util/taglib.jsp"%>
<%@ page import="org.j2cms.model.user.User" %>
<% User user = (User)session.getAttribute("user"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理</title>
<link href="css/main_css.css" rel="stylesheet" type="text/css" />
	<link href="css/zTreeStyle.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
	<script type="text/javascript" src="js/jquery.ztree.core-3.2.js"></script>
	<script type="text/javascript" src="js/commonAll.js"></script>
	<script type="text/javascript">
		/**退出系统**/
		function logout(){
			if(confirm("您确定要退出本系统吗？")){
				window.location.href = "user/logout";
			}
		}
		
		/* 隐藏ztree */
		function hideSysbar() {
			var left_menu_cnt_1 = $('#left_menu_cnt');
			if ( left_menu_cnt_1.is(":visible") ) {
				left_menu_cnt_1.hide(10);
				$('#side').css({width:'60px'});
		        	$('#top_nav').css({width:'100%', left:'60px', 'padding-left':'28px'});
		        	$('#main').css({left:'60px'});
		        	$("#show_hide_btn").find('img').attr('src', 'images/common/nav_show.png');
				}
		}
		
		function inScheme(projectid) {
			loadTree(projectid, 'dleft_tab1');
			//控制导航栏
			$('#here_area').html('当前位置：系统&nbsp;>&nbsp;<span style="color:#1A5CC6">试验方案</span>');
			switchSysBar(true);			//打开侧边栏
 			
		}
		
		function loadTree(proid, treeObj) {
			$.ajax({
				type:"POST",
				url:"onajax.action?projectid="+proid,
				dataType : "json",
				success:function(data){
					// 如果返回数据不为空，加载"业务模块"目录
					if(data != null){
						//alert(data.ajax);
						// 将返回的数据赋给zTree
						var data1 = eval(data.ajax);
						$.fn.zTree.init($("#"+treeObj), setting, data1);
 						
						zTree = $.fn.zTree.getZTreeObj(treeObj);
						if( zTree ){
							// 默认展开所有节点
							zTree.expandAll(true);
						}
						//右侧改变路径
						var accessPath = data1[1].accessPath;
						rightMain(accessPath);
					}
				}
			});
		}
		
		/**获得当前日期**/
		function  getDate01(){
			var time = new Date();
			var myYear = time.getFullYear();
			var myMonth = time.getMonth()+1;
			var myDay = time.getDate();
			if(myMonth < 10){
				myMonth = "0" + myMonth;
			}
			//document.getElementById("yue_fen").innerHTML =  myYear + "." + myMonth;
			document.getElementById("day_day").innerHTML =  myYear + "." + myMonth + "." + myDay;
		}
		
	</script>
	<script type="text/javascript">
		/* zTree插件加载目录的处理  */
		var zTree;
		
		var setting = {
				view: {
					dblClickExpand: false,
					showLine: false,
					expandSpeed: ($.browser.msie && parseInt($.browser.version)<=6)?"":"fast"
				},
				data: {
					key: {
						name: "resourceName"
					},
					simpleData: {
						enable:true,
						idKey: "resourceID",
						pIdKey: "parentID",
						rootPId: ""
					}
				},
				callback: {
	// 				beforeExpand: beforeExpand,
	// 				onExpand: onExpand,
					onClick: zTreeOnClick			
				}
		};
		 
		var curExpandNode = null;
		function beforeExpand(treeId, treeNode) {
			var pNode = curExpandNode ? curExpandNode.getParentNode():null;
			var treeNodeP = treeNode.parentTId ? treeNode.getParentNode():null;
			for(var i=0, l=!treeNodeP ? 0:treeNodeP.children.length; i<l; i++ ) {
				if (treeNode !== treeNodeP.children[i]) {
					zTree.expandNode(treeNodeP.children[i], false);
				}
			}
			while (pNode) {
				if (pNode === treeNode) {
					break;
				}
				pNode = pNode.getParentNode();
			}
			if (!pNode) {
				singlePath(treeNode);
			}
	
		}
		function singlePath(newNode) {
			if (newNode === curExpandNode) return;
			if (curExpandNode && curExpandNode.open==true) {
				if (newNode.parentTId === curExpandNode.parentTId) {
					zTree.expandNode(curExpandNode, false);
				} else {
					var newParents = [];
					while (newNode) {
						newNode = newNode.getParentNode();
						if (newNode === curExpandNode) {
							newParents = null;
							break;
						} else if (newNode) {
							newParents.push(newNode);
						}
					}
					if (newParents!=null) {
						var oldNode = curExpandNode;
						var oldParents = [];
						while (oldNode) {
							oldNode = oldNode.getParentNode();
							if (oldNode) {
								oldParents.push(oldNode);
							}
						}
						if (newParents.length>0) {
							for (var i = Math.min(newParents.length, oldParents.length)-1; i>=0; i--) {
								if (newParents[i] !== oldParents[i]) {
									zTree.expandNode(oldParents[i], false);
									break;
								}
							}
						}else {
							zTree.expandNode(oldParents[oldParents.length-1], false);
						}
					}
				}
			}
			curExpandNode = newNode;
		}
	
		function onExpand(event, treeId, treeNode) {
			curExpandNode = treeNode;
		}
		
		/** 用于捕获节点被点击的事件回调函数  **/
		function zTreeOnClick(event, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("dleft_tab1");
			zTree.expandNode(treeNode, null, null, null, true);
	// 		zTree.expandNode(treeNode);
			// 规定：如果是父类节点，不允许单击操作
			//if(treeNode.isParent){
	// 			alert("父类节点无法点击哦...");
			//	return false;
			//}
			// 如果节点路径为空或者为"#"，不允许单击操作
			if(treeNode.accessPath == "") return false;
			if(treeNode.accessPath.substring(0,1)=="#"){
				var iWidth=800; //弹出窗口的宽度
				var iHeight=600; //弹出窗口的高度;
				var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
				var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
				
				var accePath = treeNode.accessPath.substr(1);
				window.open (accePath,'newwindow','height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=yes,resizable=no, location=no,status=no') 
				return false;
			}
		    // 跳到该节点下对应的路径, 把当前资源ID(resourceID)传到后台，写进Session
		    rightMain(treeNode.accessPath);
		    
		    if( treeNode.isParent ){
			    $('#here_area').html('当前位置：'+treeNode.getParentNode().resourceName+'&nbsp;>&nbsp;<span style="color:#1A5CC6">'+treeNode.resourceName+'</span>');
		    }else{
			    $('#here_area').html('当前位置：系统&nbsp;>&nbsp;<span style="color:#1A5CC6">'+treeNode.resourceName+'</span>');
		    }
		};
		
		/* 上方菜单 */
		function switchTab(tabpage,tabid){
		var oItem = document.getElementById(tabpage).getElementsByTagName("li"); 
		    for(var i=0; i<oItem.length; i++){
		        var x = oItem[i];    
		        x.className = "";
			}
			if('left_tab1' == tabid){
				$(document).ajaxStart(onStart).ajaxSuccess(onStop);
				// 异步加载"业务模块"下的菜单
			  	loadMenu('YEWUMOKUAI', 'dleft_tab1');
			}else  if('left_tab2' == tabid){
				//$(document).ajaxStart(onStart).ajaxSuccess(onStop);
				// 异步加载"系统管理"下的菜单
				//loadMenu('XITONGMOKUAI', 'dleft_tab1');
				hideSysbar();		//隐藏
				var accessPath = 'manage//user//list';
				 rightMain(accessPath);
			}/*else  if('left_tab3' == tabid){
				$(document).ajaxStart(onStart).ajaxSuccess(onStop);
				// 异步加载"其他"下的菜单
				loadMenu('QITAMOKUAI', 'dleft_tab1');
			} */
		}
	
		
		
		$(document).ready(function(){
			//$(document).ajaxStart(onStart).ajaxSuccess(onStop);
			getDate01();
			var left_menu_cnt_1 = $('#left_menu_cnt');
			if ( left_menu_cnt_1.is(":visible") ) {			/*隐藏ztree*/
				left_menu_cnt_1.hide(10);
				$('#side').css({width:'60px'});
		        	$('#top_nav').css({width:'100%', left:'60px', 'padding-left':'28px'});
		        	$('#main').css({left:'60px'});
		        	$("#show_hide_btn").find('img').attr('src', 'images/nav_show.png');
			}
			
			/** 默认异步加载"业务模块"目录  **/
			loadMenu('YEWUMOKUAI', "dleft_tab1");
			// 默认展开所有节点
			if( zTree ){
				// 默认展开所有节点
				zTree.expandAll(true);
			}
		});
		
		function loadMenu(resourceType, treeObj){
			/*$.ajax({
				type:"POST",
				url:"${dynamicURL}/authority/modelPart.action?resourceType=" + resourceType,
				dataType : "json",
				success:function(data){
					// 如果返回数据不为空，加载"业务模块"目录
					if(data != null){
						// 将返回的数据赋给zTree
						$.fn.zTree.init($("#"+treeObj), setting, data);
 						alert(treeObj);
						zTree = $.fn.zTree.getZTreeObj(treeObj);
						if( zTree ){
							// 默认展开所有节点
							zTree.expandAll(true);
						}
					}
				}
			});*/
            data = [{"accessPath":"","checked":false,"delFlag":0,"parentID":1,"resourceCode":"","resourceDesc":"","resourceGrade":2,"resourceID":3,"resourceName":"某某产品","resourceOrder":0,"resourceType":""},
                    
                    {"accessPath":"","checked":false,"delFlag":0,"parentID":1,"resourceCode":"","resourceDesc":"","resourceGrade":2,"resourceID":2,"resourceName":"某火箭弹","resourceOrder":0,"resourceType":""},
                    {"accessPath":"","checked":false,"delFlag":0,"parentID":2,"resourceCode":"","resourceDesc":"","resourceGrade":2,"resourceID":16,"resourceName":"整弹","resourceOrder":0,"resourceType":""},
                    {"accessPath":"","checked":false,"delFlag":0,"parentID":2,"resourceCode":"","resourceDesc":"","resourceGrade":2,"resourceID":24,"resourceName":"引信","resourceOrder":0,"resourceType":""},
                    {"accessPath":"","checked":false,"delFlag":0,"parentID":2,"resourceCode":"","resourceDesc":"","resourceGrade":2,"resourceID":34,"resourceName":"动力系统","resourceOrder":0,"resourceType":""},
                    {"accessPath":"","checked":false,"delFlag":0,"parentID":2,"resourceCode":"","resourceDesc":"","resourceGrade":2,"resourceID":55,"resourceName":"弹体","resourceOrder":0,"resourceType":""},            
                    {"accessPath":"house_list.html","checked":false,"delFlag":0,"parentID":3,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":7,"resourceName":"整车","resourceOrder":0,"resourceType":""},
                    {"accessPath":"loupanchart.html","checked":false,"delFlag":0,"parentID":7,"resourceCode":"","resourceDesc":"","resourceGrade":4,"resourceID":8,"resourceName":"火控系统","resourceOrder":10,"resourceType":""},            
                    {"accessPath":"house_list.html","checked":false,"delFlag":0,"parentID":8,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":18,"resourceName":"火控计算机","resourceOrder":0,"resourceType":""},            
                    {"accessPath":"","checked":false,"delFlag":0,"parentID":1,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":32,"resourceName":"某底盘系统","resourceOrder":0,"resourceType":""},
                    {"accessPath":"","checked":false,"delFlag":0,"parentID":32,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":39,"resourceName":"系统","resourceOrder":0,"resourceType":""},
                    {"accessPath":"","checked":false,"delFlag":0,"parentID":32,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":9,"resourceName":"发动机","resourceOrder":0,"resourceType":""},
        			{"accessPath":"tables.html","checked":false,"delFlag":0,"parentID":7,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":100,"resourceName":"底盘系统","resourceOrder":20,"resourceType":""},
        			{"accessPath":"","checked":false,"delFlag":0,"parentID":100,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":200,"resourceName":"发动机","resourceOrder":0,"resourceType":""},
                    {"accessPath":"","checked":false,"delFlag":0,"parentID":7,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":52,"resourceName":"火力系统","resourceOrder":0,"resourceType":""},
                    {"accessPath":"","checked":false,"delFlag":0,"parentID":100,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":25,"resourceName":"动力系统","resourceOrder":0,"resourceType":""},
                    {"accessPath":"","checked":false,"delFlag":0,"parentID":100,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":51,"resourceName":"履带","resourceOrder":0,"resourceType":""},
                    {"accessPath":"","checked":false,"delFlag":0,"parentID":52,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":29,"resourceName":"供输弹机","resourceOrder":0,"resourceType":""},
                    {"accessPath":"","checked":false,"delFlag":0,"parentID":32,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":50,"resourceName":"动力传动","resourceOrder":0,"resourceType":""},
                    {"accessPath":"","checked":false,"delFlag":0,"parentID":32,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":38,"resourceName":"履带","resourceOrder":0,"resourceType":""}];

            // 如果返回数据不为空，加载"业务模块"目录
            if(data != null){
                // 将返回的数据赋给zTree
                $.fn.zTree.init($("#"+treeObj), setting, data);
//              alert(treeObj);
                zTree = $.fn.zTree.getZTreeObj(treeObj);
                if( zTree ){
                    // 默认展开所有节点
                    zTree.expandAll(true);
                }
            }
		}
		
		//ajax start function
		function onStart(){
			$("#ajaxDialog").show();
		}
		
		//ajax stop function
		function onStop(){
	// 		$("#ajaxDialog").dialog("close");
			$("#ajaxDialog").hide();
		}
	</script>
</head>
<body>
<div id="top">
		<div id="top_logo">
			<!--<img alt="logo" src="images/common/logo.jpg" width="274" height="49" style="vertical-align:middle;">-->
            <span style="color:#adadad;font-size:large;">兵器工业某某中心</span>
		</div>
		<div id="top_links">
			<div id="top_op">
				<ul>
					<li>
						<img alt="当前用户" src="images/user.jpg">：
						<span><%=user.getUsername() %></span>
					</li>
					<!--<li>
						<img alt="事务月份" src="images/common/month.jpg">：
						<span id="yue_fen"></span>
					</li>-->
					<li>
						<img alt="今天是" src="images/date.jpg">：
						<span id="day_day"></span>
					</li>
				</ul> 
			</div>
			<div id="top_close">
				<a href="javascript:void(0);" onclick="logout();" target="_parent">
					<img alt="退出系统" title="退出系统" src="images/close.jpg" style="position: relative; top: 10px; left: 25px;">
				</a>
			</div>
		</div>
	</div>
    <!-- side menu start -->
	<div id="side">
		<div id="left_menu">
		 	<ul id="TabPage2" style="height:200px; margin-top:50px;">
				<li id="left_tab1" class="selected"  title="业务模块">
					<img alt="业务模块" title="业务模块" src="images/1_hover.jpg" width="33" height="31">
				</li>
				<li id="left_tab2"  title="系统管理">
					<img alt="用户管理" title="用户管理" src="images/2.jpg" width="33" height="31">
				</li>		
				<!-- <li id="left_tab3" onClick="javascript:switchTab('TabPage2','left_tab3');" title="其他">
					<img alt="其他" title="其他" src="images/3.jpg" width="33" height="31">
				</li> -->
			</ul>
			
			
			<!-- <div id="nav_show" style="position:absolute; bottom:0px; padding:10px;">
				<a href="javascript:;" id="show_hide_btn">
					<img alt="显示/隐藏" title="显示/隐藏" src="images/common/nav_hide.png" width="35" height="35">
				</a>
			</div> -->
		 </div>
		 <div id="left_menu_cnt">
		 	<div id="nav_module">
		 		<img src="images/module_1.png" width="210" height="58"/>
		 	</div>
		 	<div id="nav_resource">
		 		<ul id="dleft_tab1" class="ztree"></ul>
		 	</div>
		 </div>
	</div>
	<script type="text/javascript">
	
		$(function(){
			$('#TabPage2 li').click(function(){
				var oItem = document.getElementById("TabPage2").getElementsByTagName("li"); 
			    for(var i=0; i<oItem.length; i++){
			        var x = oItem[i];    
			        x.className = "";
				}
				var index = $(this).index();
				$(this).find('img').attr('src', 'images/'+ (index+1) +'_hover.jpg');
				$(this).css({background:'#fff'});
				$('#nav_module').find('img').attr('src', 'images/module_'+ (index+1) +'.png');
				$('#TabPage2 li').each(function(i, ele){
					if( i!=index ){
						$(ele).find('img').attr('src', 'images/'+ (i+1) +'.jpg');
						$(ele).css({background:'#044599'});
					}
				});
				// 显示侧边栏
				//switchSysBar(true);
				var left_menu_cnt_1 = $('#left_menu_cnt');
			if ( left_menu_cnt_1.is(":visible") ) {			/*隐藏ztree*/
				left_menu_cnt_1.hide(10);
				$('#side').css({width:'60px'});
		        	$('#top_nav').css({width:'100%', left:'60px', 'padding-left':'28px'});
		        	$('#main').css({left:'60px'});
		        	$("#show_hide_btn").find('img').attr('src', 'images/nav_show.png');
			}
				if(index == 0) {
					$('#here_area').html('当前位置：业务模块&nbsp;>&nbsp;<span style="color:#1A5CC6">项目列表</span>');
					rightMain('manage/project/list');
				} else {
					$('#here_area').html('当前位置：系统管理&nbsp;>&nbsp;<span style="color:#1A5CC6">用户管理</span>');
					rightMain('manage/user/list');
				}
			});
			
			
		});
		
		/**隐藏或者显示侧边栏**/
		function switchSysBar(flag){
			var side = $('#side');
	        var left_menu_cnt = $('#left_menu_cnt');
			if( flag==true ){	// flag==true
				left_menu_cnt.show(500, 'linear');
				side.css({width:'280px'});
				$('#top_nav').css({width:'77%', left:'304px'});
	        	$('#main').css({left:'280px'});
			}else{
		        if ( left_menu_cnt.is(":visible") ) {
					left_menu_cnt.hide(10, 'linear');
					side.css({width:'60px'});
		        	$('#top_nav').css({width:'100%', left:'60px', 'padding-left':'28px'});
		        	$('#main').css({left:'60px'});
		        	$("#show_hide_btn").find('img').attr('src', 'images/common/nav_show.png');
		        } else {
					left_menu_cnt.show(500, 'linear');
					side.css({width:'280px'});
					$('#top_nav').css({width:'77%', left:'304px', 'padding-left':'0px'});
		        	$('#main').css({left:'280px'});
		        	$("#show_hide_btn").find('img').attr('src', 'images/common/nav_hide.png');
		        }
			}
		}
	</script>
    <!-- side menu start -->
    <div id="top_nav">
	 	<span id="here_area">当前位置：业务模块&nbsp;>&nbsp;<span style="color:#1A5CC6">项目列表</span></span>
	</div>
    <div id="main">
      	<iframe name="right" id="rightMain" src="<s:url action="list" namespace="manage/project"></s:url>" frameborder="no" scrolling="auto" width="100%" height="100%" allowtransparency="true"></iframe>
    </div>
</body>
</html>