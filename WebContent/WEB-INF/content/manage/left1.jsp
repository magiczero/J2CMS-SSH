<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>左侧列表</title>
<link href="style/style1.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="script/jquery.js"></script>
<script language="JavaScript" src="script/jquery.ztree.all-3.5.js"></script>
<link href="style/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
		<!--
		var curMenu = null, zTree_Menu = null;
		var setting = {
			view: {
				showLine: true,
				selectedMulti: false,
				dblClickExpand: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onNodeCreated: this.onNodeCreated,
				beforeClick: this.beforeClick
				//onClick: this.onClick
			}
		};

		/*var zNodes =[
			{ id:1, pId:0, name:"抽屉 1", open:true},
			{ id:11, pId:1, name:"某车辆可靠性试验"},
			{ id:111, pId:11, name:"试验方案设计",url:"right.html", target:"rightFrame"},
			{ id:1111, pId:111, name:"指数定时截尾20130311"},
			{ id:1112, pId:111, name:"序贯截尾定时方案20140123"},
			{ id:112, pId:11, name:"试验数据管理",url:"form.html", target:"rightFrame"},
			{ id:1121, pId:112, name:"初样阶段试验数据"},
			{ id:1122, pId:112, name:"正样阶段试验数据"},
			{ id:113, pId:11, name:"可靠性评估"},
			{ id:1131, pId:113, name:"初样阶段可靠性水平"},
			{ id:1132, pId:113, name:"正样阶段可靠性水平"},
			{ id:12, pId:1, name:"某底盘系统可靠性试验"},
			{ id:121, pId:12, name:"叶子节点 1-2-1"},
			{ id:122, pId:12, name:"叶子节点 1-2-2"},
			{ id:123, pId:12, name:"叶子节点 1-2-3"},
			{ id:124, pId:12, name:"叶子节点 1-2-4"},
			{ id:2, pId:0, name:"抽屉 2"},
			{ id:21, pId:2, name:"子菜单 2-1"},
			{ id:211, pId:21, name:"叶子节点 2-1-1"},
			{ id:212, pId:21, name:"叶子节点 2-1-2"},
			{ id:213, pId:21, name:"叶子节点 2-1-3"},
			{ id:214, pId:21, name:"叶子节点 2-1-4"},
			{ id:22, pId:2, name:"子菜单 2-2"},
			{ id:221, pId:22, name:"叶子节点 2-2-1"},
			{ id:222, pId:22, name:"叶子节点 2-2-2"},
			{ id:223, pId:22, name:"叶子节点 2-2-3"},
			{ id:224, pId:22, name:"叶子节点 2-2-4"},
			{ id:3, pId:0, name:"抽屉 3"},
			{ id:31, pId:3, name:"子菜单 3-1"},
			{ id:311, pId:31, name:"叶子节点 3-1-1"},
			{ id:312, pId:31, name:"叶子节点 3-1-2"},
			{ id:313, pId:31, name:"叶子节点 3-1-3"},
			{ id:314, pId:31, name:"叶子节点 3-1-4"},
			{ id:32, pId:3, name:"子菜单 3-2"},
			{ id:321, pId:32, name:"叶子节点 3-2-1"},
			{ id:322, pId:32, name:"叶子节点 3-2-2"},
			{ id:323, pId:32, name:"叶子节点 3-2-3"},
			{ id:324, pId:32, name:"叶子节点 3-2-4"}			
		];*/

		function beforeClick(treeId, node) {
			if (node.isParent) {
				if (node.level === 0) {
					var pNode = curMenu;
					while (pNode && pNode.level !==0) {
						pNode = pNode.getParentNode();
					}
					if (pNode !== node) {
						var a = $("#" + pNode.tId + "_a");
						a.removeClass("cur");
						zTree_Menu.expandNode(pNode, false);
					}
					a = $("#" + node.tId + "_a");
					a.addClass("cur");

					var isOpen = false;
					for (var i=0,l=node.children.length; i<l; i++) {
						if(node.children[i].open) {
							isOpen = true;
							break;
						}
					}
					if (isOpen) {
						zTree_Menu.expandNode(node, true);
						curMenu = node;
					} else {
						zTree_Menu.expandNode(node.children[0].isParent?node.children[0]:node, true);
						curMenu = node.children[0];
					}
				} 
			}
			//return !node.isParent;
		}
		
		function onClick(e, treeId, node) {
			alert("Do what you want to do!");
		}
		
		function loadTree() {
			$.ajax({
			type:"POST",
			url:"manage/box/listTree",
			dataType : "json",
			success:function(data){
				// 如果返回数据不为空，加载"业务模块"目录
				if(data != null){
					// 将返回的数据赋给zTree
					var data1 = eval(data);
					$.fn.zTree.init($("#tree"), setting, data1);
					zTree_Menu = $.fn.zTree.getZTreeObj("tree");
					curMenu = zTree_Menu.getNodes()[0].children[0].children[0];
					zTree_Menu.selectNode(curMenu);
					var a = $("#" + zTree_Menu.getNodes()[0].tId + "_a");
					a.addClass("cur");
				}
			}
		});
		}

		$(document).ready(function(){
			loadTree();
			
		});
		
		
		//-->
	</script>

</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span><strong>试验列表</strong></div>
    
    
    
    	<ul id="tree" class="ztree"></ul>
    
</body>
</html>