<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../../util/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>试验方案设计</title>
<link href="../../style/style2.css" rel="stylesheet" type="text/css" />
<link href="../../style/tip-darkgray/tip-darkgray.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../script/jquery-1.11.1.js"></script>
<script type="text/javascript" src="../../script/jquery.validate.js"></script>
<script type="text/javascript" src="../../script/jquery.poshytip.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#dingshu").hide();
    $('#dingshi').show();
    $('#xuguan').hide();
    
    $('#save_selector_type').change(function(){
    	var $seltype = $('#save_selector_schemeType').children('option:selected').val();
    	var $sel = $(this).children('option:selected').val();
    	selectChange($sel, $seltype);
    });
    //-----------------选择事件结束--------------------//
	$('#save_selector_schemeType').change(function(){						//选择事件
		var $seltype = $('#save_selector_type').children('option:selected').val();
		var $sel = $(this).children('option:selected').val();
		if($seltype == 1) {
			
			var $txt1 = '';
			var $txt2 = '';
			var $txt3 = '';
			if($sel==1){
				//试验总时间T
				//$('#save_selector_truncTime').remove();
				$('#totalTimeTd').html('');
				$('#totalTimeTd').append('<input type="text" name="selector.totalTime" size="10" value="" id="save_selector_totalTime"/>');
				$('#totalTimeLabelTd').html('');
				$('#totalTimeLabelTd').append('<label for="save_selector_totalTime" id="totalTimeLabel">总试验时间T</label>');
				//$('#totalTimeLabel').html('');
				//$('#totalTimeLabel').append('试验总时间T');
				//$('#totalTimeLabel').attr('for','save_selector_totalTime');
				
				//$('#save_selector_producerRisk').val('10');
				//$('#save_selector_useRisk').val('');
	    		//$('#save_selector_ratio').val('3.0');
	    		
	    		$txt1 = $('<input type="text" name="selector.producerRisk" size="10" value="10" id="save_selector_producerRisk"/>');
	    		$txt2 = $('<input type="text" name="selector.useRisk" size="10" value="" id="save_selector_useRisk"/>');
	    		$txt3 = $('<input type="text" name="selector.ratio" size="10" value="3.0" id="save_selector_ratio"/>');
	    		
	    		$('#dingshi').show();
				$('#dingshu').hide();
				$('#xuguan').hide();
	    	} else if($sel==2){
	    		//truncTime 截尾数
	    		//$('#save_selector_totalTime').remove();
	    		$('#totalTimeTd').html('');
	    		$('#totalTimeTd').append('<input type="text" name="selector.truncTime" size="10" value="" id="save_selector_truncTime"/>');
	    		$('#totalTimeLabelTd').html('');
	    		$('#totalTimeLabelTd').append('<label for="save_selector_truncTime" id="totalTimeLabel">截尾数r</label>');
	    		//$('#totalTimeLabel').html('');
				//$('#totalTimeLabel').append('截尾数r');
				//$('#totalTimeLabel').attr('for','save_selector_truncTime');
				
	    		//$('#save_selector_producerRisk').val('10');
	    		//$('#save_selector_useRisk').val('10');
	    		//$('#save_selector_ratio').val('1.5');
	    		
	    		$txt1 = $('<select id="save_selector_producerRisk" name="selector.producerRisk" class="valid"><option value=""></option><option value="5">5</option><option selected="selected" value="10">10</option></select>');
	    		$txt2 = $('<select id="save_selector_useRisk" name="selector.useRisk" class="valid"><option value=""></option><option value="5">5</option><option selected="selected" value="10">10</option></select>');
	    		$txt3 = $('<select id="save_selector_ratio" name="selector.ratio" class="valid"><option value=""></option><option value="1.5" selected="selected">1.5</option><option value="2">2</option><option value="3">3</option><option value="5">5</option><option value="10">10</option></select>');
	    		
	    		$('#dingshu').show();
				$('#dingshi').hide();
				$('#xuguan').hide();
	    	} else if($sel==3) {		//序贯截尾
	    		if($('#save_selector_totalTime')) $('#save_selector_totalTime').remove();
	    		if($('#save_selector_truncTime')) $('#save_selector_truncTime').remove();
	    		if($('#totalTimeLabel')) $('#totalTimeLabel').remove();
	    		$('#totalTimeTd').append('&nbsp;');
	    		$('#totalTimeLabelTd').append('&nbsp;');
	    		
	    		$txt1 = $('<select id="save_selector_producerRisk" name="selector.producerRisk" class="valid"><option value=""></option><option value="10" selected="selected">10</option><option value="20">20</option><option value="30">30</option></select>');
	    		$txt2 = $('<select id="save_selector_useRisk" name="selector.useRisk" class="valid"><option value=""></option><option value="10" selected="selected">10</option><option value="20">20</option><option value="30">30</option></select>');
	    		$txt3 = $('<select id="save_selector_ratio" name="selector.ratio" class="valid"><option value=""></option><option value="1.5" selected="selected">1.5</option><option value="2.0">2</option><option value="3.0">3</option></select>');
	    		
	    		$('#dingshu').hide();
				$('#dingshi').hide();
				$('#xuguan').show();
	    	}
			
			$('#save_selector_producerRisk').remove();
			$('#producerRiskTd').append($txt1);
			$('#save_selector_useRisk').remove();
			$('#useRiskTd').append($txt2);
			$('#save_selector_ratio').remove();
			$('#ratioTd').append($txt3);
		} else if($seltype == 2) {
			alert('未实现此功能');
			/*
			if($sel==2){		//定数截尾
				$txt1 = $('<select id="save_selector_producerRisk" name="selector.producerRisk" class="valid"><option value=""></option><option value="5">5</option><option selected="selected" value="10">10</option><option value="20">20</option><option value="30">30</option></select>');
	    		$txt2 = $('<select id="save_selector_useRisk" name="selector.useRisk" class="valid"><option value=""></option><option value="5">5</option><option selected="selected" value="10">10</option><option value="20">20</option><option value="30">30</option></select>');
	    		$txt3 = $('<select id="save_selector_ratio" name="selector.ratio" class="valid"><option value=""></option><option value="1.5" selected="selected">1.5</option><option value="1.75">1.75</option><option value="2.0">2.0</option><option value="3.0">3.0</option></select>');
	    		
	    		$('#save_selector_producerRisk').remove();
				$('#producerRiskTd').append($txt1);
				$('#save_selector_useRisk').remove();
				$('#useRiskTd').append($txt2);
				$('#save_selector_ratio').remove();
				$('#ratioTd').append($txt3);
			} else if($sel==3) {	//序贯截尾
				
			}*/
		} else { alert('未实现此功能');}
	})
	//------------- 选择事件结束 -------------//
    $("#save").validate({
    	focusCleanup:true,//clear the error message when the error element get focus again. 
    	onkeyup:false, 
    	errorPlacement: function(error, element) { 
    		
    		showErrorMesssgeDiv(error,element); 
    	}, 
    	rules : {
    		"selector.schemeName" : {required:true, maxlength:50},
    		"selector.type" : "required",
    		"selector.schemeType" : "required",
    		"selector.sampleSize" : "digits",
    		"selector.totalTime" : {required:true,digits:true},
    		"selector.lowerLimit" : {required:true, number:true},
    		"selector.producerRisk" : {required:true,number : true, range : [1,50]},
    		"selector.useRisk" : {required:true, number:true},
    		"selector.ratio" : {number : true, range : [1,5]}
    	},
    	messages : {
    		"selector.schemeName" : {
    			required : "请输入方案名称",
    			maxlength : "不能超过 {0}个字"},
    		"selector.type" : "请选择方案类型",
    		"selector.schemeType" : "请选择截尾方式",
    		"selector.sampleSize" : "请填入整数",
    		"selector.totalTime" : {required:"请填入内容", digits:"请填入整数"},
    		"selector.lowerLimit" : {required:"请填入内容", number:"请填入数字"},
    		"selector.producerRisk" : {required:"请填入内容",number:"请填入数字", range:"请填入{0}到{1}之间的数"},
    		"selector.useRisk" : {required:"请填入内容", number:"请填入数字"},
    		"selector.ratio" : {number:"请填入数字", range:"请填入{0}到{1}之间的数"}
    	}
    });
    
    $(":text").each(function(index, element) {

	    $(element).poshytip({
	    	className: 'tip-darkgray',
	    	content: 'Hey, there! This is a tooltip.',
	    	showOn: 'none',
	    	alignTo: 'target',
	    	alignX: 'inner-left',
	    	offsetX: 0,
	    	offsetY: 5,
	    	showTimeout: 100
	    });
    });
    
    var $schType = $('#save_selector_schemeType').val();
	if($schType == 2) {
		$('#save_selector_totalTime').remove();
		$('#totalTimeTd').append('<input type="text" name="selector.truncTime" size="10" value="" id="save_selector_truncTime"/>');
		$('#totalTimeLabel').html('');
		$('#totalTimeLabel').append('截尾数r');
		$('#totalTimeLabel').attr('for','save_selector_truncTime');
		$('#save_selector_truncTime').val('${selector.truncTime}');
		
		//$txt1 = $('<select id="save_selector_producerRisk" name="selector.producerRisk" class="valid"><option value=""></option><option value="5.0">5</option><option value="10.0">10</option></select>');
		//$txt2 = $('<select id="save_selector_useRisk" name="selector.useRisk" class="valid"><option value=""></option><option value="5.0">5</option><option value="10.0">10</option></select>');
		//$txt3 = $('<select id="save_selector_ratio" name="selector.ratio" class="valid"><option value=""></option><option value="1.5">1.5</option><option value="2.0">2</option><option value="3.0">3</option><option value="5.0">5</option><option value="10.0">10</option></select>');
		
		$('#save_selector_producerRisk').remove();
		$('#producerRiskTd').append('<select id="save_selector_producerRisk" name="selector.producerRisk" class="valid"><option value=""></option><option value="5.0">5</option><option value="10.0">10</option></select>');
		$('#save_selector_useRisk').remove();
		$('#useRiskTd').append('<select id="save_selector_useRisk" name="selector.useRisk" class="valid"><option value=""></option><option value="5.0">5</option><option value="10.0">10</option></select>');
		$('#save_selector_ratio').remove();
		$('#ratioTd').append('<select id="save_selector_ratio" name="selector.ratio" class="valid"><option value=""></option><option value="1.5">1.5</option><option value="2.0">2</option><option value="3.0">3</option><option value="5.0">5</option><option value="10.0">10</option></select>');
		
		$('#save_selector_producerRisk').val('${selector.producerRisk}');
		$('#save_selector_useRisk').val('${selector.useRisk}');
		$('#save_selector_ratio').val('${selector.ratio}');
		
		$('#dingshi').hide();
		$('#dingshu').show();
		$('#xuguan').hide();
	} else if($schType == 3) {
		if($('#save_selector_totalTime')) $('#save_selector_totalTime').remove();
		if($('#save_selector_truncTime')) $('#save_selector_truncTime').remove();
		if($('#totalTimeLabel')) $('#totalTimeLabel').remove();
		$('#totalTimeTd').append('&nbsp;');
		$('#totalTimeLabelTd').append('&nbsp;');
		
		$('#save_selector_producerRisk').remove();
		$('#producerRiskTd').append('<select id="save_selector_producerRisk" name="selector.producerRisk" class="valid"><option value=""></option><option value="10.0">10</option><option value="20.0">20</option><option value="30.0">30</option></select>');
		$('#save_selector_useRisk').remove();
		$('#useRiskTd').append('<select id="save_selector_useRisk" name="selector.useRisk" class="valid"><option value=""></option><option value="10.0">10</option><option value="20.0">20</option><option value="30.0">30</option></select>');
		$('#save_selector_ratio').remove();
		$('#ratioTd').append('<select id="save_selector_ratio" name="selector.ratio" class="valid"><option value=""></option><option value="1.5">1.5</option><option value="2.0">2</option><option value="3.0">3</option></select>');
		
		$('#save_selector_producerRisk').val('${selector.producerRisk}');
		$('#save_selector_useRisk').val('${selector.useRisk}');
		$('#save_selector_ratio').val('${selector.ratio}');
		
		$('#dingshi').hide();
		$('#dingshu').hide();
		$('#xuguan').show();
	}
    /*
    $('#save_selector_schemeName').poshytip({
    	className: 'tip-darkgray',
    	content: 'Hey, there! This is a tooltip.',
    	showOn: 'none',
    	alignTo: 'target',
    	alignX: 'inner-left',
    	offsetX: 0,
    	offsetY: 5,
    	showTimeout: 100
    });
    */
})

//---------------document.ready end---------------//

function showErrorMesssgeDiv(error,element){
    	element.poshytip('update',error);
    	element.poshytip('show');
    	element.poshytip('hideDelayed',5000);
    }
    //生成方案
    function buildScheme() {
    	var $type = $('#save_selector_type').val();
    	var $schemeType = $('#save_selector_schemeType').val();
    	if($type == 1) {		//指数分布
    		if($schemeType == 1) {			//定时截尾
    			buildDingshi();
    			
    		} else if($schemeType == 2) {		//定数截尾
    			buildDingshu();
    			
    		} else if($schemeType == 3) {		//序贯截尾
    			buildXuguan();
    		}
    	} else if($type == 2) {				//二项分布
    		if($schemeType == 2) {		//定数截尾
    			buildErXiangDingshu();
    			//alert('此功能未完成');
    		} else if($schemeType == 3) {		//序贯截尾
    			alert('此功能未完成');
    		} else {
        		alert('无试验方案，请重新选择');
        	}
    	} else {
    		alert('不支持此操作');
    	}
    }
    
    function buildErXiangDingshu() {		//二项分布定数结尾
    	var $lowerLimit = $.trim($('#save_selector_lowerLimit').val());
    
    	if($lowerLimit == '') {
    		$('#save_selector_lowerLimit').poshytip('update','请填写最低可接受值');
    		$('#save_selector_lowerLimit').poshytip('show');
    		$('#save_selector_lowerLimit').poshytip('hideDelayed',3000);
    		
    		$('#save_selector_lowerLimit').focus();
    		return false;
    	} else if(isNaN($lowerLimit)) {
			$('#save_selector_lowerLimit').poshytip('update','请填入数字');
    		$('#save_selector_lowerLimit').poshytip('show');
    		$('#save_selector_lowerLimit').poshytip('hideDelayed',3000);
    		
    		$('#save_selector_lowerLimit').focus();
    		return false;
		}
    	<%-- 可选项--%>
    	var ratio = $.trim($('#save_selector_ratio').val());		<%-- 鉴别比 --%>
    	var sampleSize = $.trim($('#save_selector_sampleSize').val());			<%-- 样本量--%>
    	var productor = $.trim($('#save_selector_producerRisk').val());	<%-- 生产方风险 --%>
    	var user = $.trim($('#save_selector_useRisk').val());			<%-- 使用方风险--%>
    	
    	if(ratio!='' && simpleSize=='' && productor=='' && user=='') {
    		$('#save_selector_ratio').poshytip({
    	    	className: 'tip-darkgray',
    	    	content: 'Hey, there! This is a tooltip.',
    	    	showOn: 'none',
    	    	alignTo: 'target',
    	    	alignX: 'inner-left',
    	    	offsetX: 0,
    	    	offsetY: 5,
    	    	showTimeout: 100
    	    });
    		if(isNaN($productor)) {
    			$('#save_selector_ratio').poshytip('update','请填入数字');
        		$('#save_selector_ratio').poshytip('show');
        		$('#save_selector_ratio').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_ratio').focus();
        		return false;
    		}
    	}
    }
    
    //指数分布定时截尾
    function buildDingshi() {
    	var $totalTime = $('#save_selector_totalTime').val();
    	var $lowerLimit = $('#save_selector_lowerLimit').val();
    	var $multiple = 0.0;
    	
    	if($totalTime == '') {		//第二种方案
    		var $productor = $('#save_selector_producerRisk').val();
    		$('#save_selector_useRisk').poshytip({
    	    	className: 'tip-darkgray',
    	    	content: 'Hey, there! This is a tooltip.',
    	    	showOn: 'none',
    	    	alignTo: 'target',
    	    	alignX: 'inner-left',
    	    	offsetX: 0,
    	    	offsetY: 5,
    	    	showTimeout: 100
    	    });
    		$('#save_selector_producerRisk').poshytip({
    	    	className: 'tip-darkgray',
    	    	content: 'Hey, there! This is a tooltip.',
    	    	showOn: 'none',
    	    	alignTo: 'target',
    	    	alignX: 'inner-left',
    	    	offsetX: 0,
    	    	offsetY: 5,
    	    	showTimeout: 100
    	    });
    		if($productor == '') {
    			$('#save_selector_producerRisk').poshytip('update','请填写生产方风险');
        		$('#save_selector_producerRisk').poshytip('show');
        		$('#save_selector_producerRisk').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_producerRisk').focus();
        		return false;
    		} else if(isNaN($productor)) {
    			$('#save_selector_producerRisk').poshytip('update','请填入数字');
        		$('#save_selector_producerRisk').poshytip('show');
        		$('#save_selector_producerRisk').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_producerRisk').focus();
        		return false;
    		} else if($productor<=1 || $productor>=40) {
    			$('#save_selector_producerRisk').poshytip('update','请填入1到40之间的数字');
        		$('#save_selector_producerRisk').poshytip('show');
        		$('#save_selector_producerRisk').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_producerRisk').focus();
        		return false;
    		}
    		
    		var $user = $('#save_selector_useRisk').val();
    		
    		if($user == '') {
    			$('#save_selector_useRisk').poshytip('update','请填写使用方风险');
        		$('#save_selector_useRisk').poshytip('show');
        		$('#save_selector_useRisk').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_useRisk').focus();
        		return false;
    		} else if(isNaN($user)) {
    			$('#save_selector_useRisk').poshytip('update','请填入数字');
        		$('#save_selector_useRisk').poshytip('show');
        		$('#save_selector_useRisk').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_useRisk').focus();
        		return false;
    		} else if($user<=1 || $user>=40) {
    			$('#save_selector_useRisk').poshytip('update','请填入1到40之间的数字');
        		$('#save_selector_useRisk').poshytip('show');
        		$('#save_selector_useRisk').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_useRisk').focus();
        		return false;
    		}
    		
    		if($user>1 && $user<15) $user = 10;
    		else if($user>=15 && $user<25) $user = 20;
    		else if($user>=25 && $user<40) $user = 30;
    		
    		if($productor >1 && $productor <15) $productor = 10;
    		else if($productor>=15 && $productor <25) $productor = 20;
    		else if($productor>=25 && $productor <40) $productor = 30;
    		
    		$.ajax({
    			type:"POST",
    			url:"../schemetable/getDingshi2.action?productor="+$productor+"&use="+$user,
    			dataType : "json",
    			success:function(data){
    				if(data == null){
    					alert('未生成试验方案');
    				} else {
    					var data1 = eval(data);
    					//$('#dingshi tr:not(:first)').remove();
    					$('#dingshi tbody').empty();
    					var $tbody = '';
    					var num = 0;
    					for(var i in data1) {
    						num++;
    						if(num%2 == 0) {
    							$tbody += '<tr class="odd">';
    						} else {
    							$tbody += '<tr>';
    						}
    						$tbody += '<td>'+data1[i].schemeNum+'</td><td>'+data1[i].pro1+'%</td><td>'+data1[i].use1+'%</td><td>'+data1[i].pro2+'%</td><td>'+data1[i].use2+'%</td><td>'+data1[i].dr+'</td><td>'+data1[i].testTime+'</td><td>'+data1[i].rejection+'</td><td>'+data1[i].receive+'</td></tr>';
    					}
    					$('#dingshi tbody').html($tbody);
    					
    				}
    			}
    		});
    		
    	} else if($totalTime != '' && $lowerLimit != '') {
    		if(isNaN($totalTime)) {
        		$('#save_selector_totalTime').poshytip('update','请填入数字');
        		$('#save_selector_totalTime').poshytip('show');
        		$('#save_selector_totalTime').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_totalTime').focus();
        		return false;
        	}
    		if(isNaN($totalTime)) {
        		$('#save_selector_lowerLimit').poshytip('update','请填入数字');
        		$('#save_selector_lowerLimit').poshytip('show');
        		$('#save_selector_lowerLimit').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_lowerLimit').focus();
        		return false;
        	}
    		$multiple = $totalTime/$lowerLimit;
    		$.ajax({
    			type:"POST",
    			url:"../schemetable/getDingshi1.action?multiple="+$multiple,
    			dataType : "json",
    			success:function(data){
    				if(data == null){
    					alert('未生成试验方案');
    				} else {
    					var data1 = eval(data);

    					//$('#dingshi tr:not(:first)').remove();
    					//$('<tr><td>'+data1.schemeNum+'</td><td>'+data1.productor1+'%</td><td>'+data1.use1+'%</td><td>'+data1.productor2+'%</td><td>'+data1.use2+'%</td><td>'+data1.diffRatio+'</td><td>'+data1.testTime+'</td><td>'+data1.rejection+'</td><td>'+data1.receive+'</td></tr>').insertAfter($('#dingshi tr:eq(0)'));
    					$('#dingshi tbody').empty();
    					$('#dingshi tbody').html('<tr><td>'+data1.schemeNum+'</td><td>'+data1.productor1+'%</td><td>'+data1.use1+'%</td><td>'+data1.productor2+'%</td><td>'+data1.use2+'%</td><td>'+data1.diffRatio+'</td><td>'+data1.testTime+'</td><td>'+data1.rejection+'</td><td>'+data1.receive+'</td></tr>');
    					//$('#dingshi').show();
    					//$('#dingshu').hide();
    					
    				}
    			}
    		});
    	} else {
    		alert('输入的条件无法生成试验方案，请重新输入');
    	}
    	
    }				//--------------------------定时截尾结束----------------------------------
    //指数分布定数截尾
    function buildDingshu() {
    	<%-- 必填项 --%>
    	var lower = $("#save_selector_lowerLimit").val();
    	if(lower == '') {
    		$('#save_selector_lowerLimit').poshytip('update','请填写最低可接受值');
    		$('#save_selector_lowerLimit').poshytip('show');
    		$('#save_selector_lowerLimit').poshytip('hideDelayed',3000);
    		
    		$('#save_selector_lowerLimit').focus();
    		return false;
    	} else if(isNaN(lower)) {
    		$('#save_selector_lowerLimit').poshytip('update','请填入数字');
    		$('#save_selector_lowerLimit').poshytip('show');
    		$('#save_selector_lowerLimit').poshytip('hideDelayed',3000);
    		
    		$('#save_selector_lowerLimit').focus();
    		return false;
    	}
    	<%-- 可选项--%>
    	var ratio = $('#save_selector_ratio').val();		<%-- 鉴别比 --%>
    	var productor = $('#save_selector_producerRisk').val();	<%-- 生产方风险 --%>
    	var user = $('#save_selector_useRisk').val();			<%-- 使用方风险--%>
    	var	trunc = $('#save_selector_truncTime').val();									<%-- 截尾数 --%>
    	
    	var arr1 = ['5', '5.0', '10', '10.0'];
    	var arr = ['1.5', '2', '2.0', '3', '3.0', '5', '5.0', '10', '10.0'];
    	var arr2 = ['10', '2', '6', '3', '8', '5', '4', '15', '18', '19', '23', '41', '52', '55', '67'];
    	<%-- 4种方法生成方案 --%>
    	if(ratio!='' && productor!='' && user!='' && trunc=='') {
    		<%-- 判断输入的数据是否正确 --%>
    		if($.inArray(ratio, arr) == -1) {
        		$('#save_selector_ratio').poshytip('update','请填写1.5, 2, 3, 5, 10中的一个数');
        		$('#save_selector_ratio').poshytip('show');
        		$('#save_selector_ratio').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_ratio').focus();
        		return false;
        	} 
    		if($.inArray(productor, arr1) == -1) {
        		$('#save_selector_producerRisk').poshytip('update','请填写 5, 10中的一个数');
        		$('#save_selector_producerRisk').poshytip('show');
        		$('#save_selector_producerRisk').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_producerRisk').focus();
        		return false;
        	} 
    		if($.inArray(user, arr1) == -1) {
        		$('#save_selector_useRisk').poshytip('update','请填写 5, 10中的一个数');
        		$('#save_selector_useRisk').poshytip('show');
        		$('#save_selector_useRisk').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_useRisk').focus();
        		return false;
        	} 
    		productor = productor / 100;
        	user = user / 100;
        	$.ajax({
    			type:"POST",
    			url:"../schemetable/getDingshu.action?productor="+productor+"&use="+user+"&diffratio="+ratio,
    			dataType : "json",
    			success:function(data){
    				if(data == null){
    					alert('未生成试验方案');
    				} else {
    					var data1 = eval(data);
    					
    					insertDingshu(data1, lower);
    					
    					
        				//$('#dingshu tbody').html('<tr><td>'+data1.productor1*100+'</td><td>'+data1.use1*100+'</td><td>'+data1.diffRatio+'</td><td>???</td><td>'+panding+' h</td><td>'+data1.productor2+'</td></tr>');
    				}
    			}
    		});
    	} else if(ratio=='' && productor!='' && user!='' && trunc=='') {
    		if($.inArray(productor, arr1) == -1) {
        		$('#save_selector_producerRisk').poshytip('update','请填写 5, 10中的一个数');
        		$('#save_selector_producerRisk').poshytip('show');
        		$('#save_selector_producerRisk').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_producerRisk').focus();
        		return false;
        	} 
    		if($.inArray(user, arr1) == -1) {
        		$('#save_selector_useRisk').poshytip('update','请填写 5, 10中的一个数');
        		$('#save_selector_useRisk').poshytip('show');
        		$('#save_selector_useRisk').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_useRisk').focus();
        		return false;
        	} 
    		productor = productor / 100;
        	user = user / 100;
        	$.ajax({
    			type:"POST",
    			url:"../schemetable/getDingshu.action?productor="+productor+"&use="+user,
    			dataType : "json",
    			success:function(data){
    				if(data == null){
    					alert('未生成试验方案');
    				} else {
    					var data1 = eval(data);
    					
    					insertDingshu(data1, lower);
    					
    				}
    			}
    		});
    	} else if(ratio=='' && productor=='' && user=='' && trunc!='') {
    		$('#save_selector_truncTime').poshytip({
    	    	className: 'tip-darkgray',
    	    	content: 'Hey, there! This is a tooltip.',
    	    	showOn: 'none',
    	    	alignTo: 'target',
    	    	alignX: 'inner-left',
    	    	offsetX: 0,
    	    	offsetY: 5,
    	    	showTimeout: 100
    	    });
    		if($.inArray(trunc, arr2) == -1) {
        		$('#save_selector_truncTime').poshytip('update','请填写 2,3,4,5,6,8,10,15,18,19,23,41,52,55,67中的一个数');
        		$('#save_selector_truncTime').poshytip('show');
        		$('#save_selector_truncTime').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_truncTime').focus();
        		return false;
        	} 
    		alert('第三种方法啊');
    	} else if(ratio!='' && productor=='' && user=='' && trunc=='') {
    		if($.inArray(ratio, arr) == -1) {
        		$('#save_selector_ratio').poshytip('update','请填写1.5, 2, 3, 5, 10中的一个数');
        		$('#save_selector_ratio').poshytip('show');
        		$('#save_selector_ratio').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_ratio').focus();
        		return false;
        	} 
    		alert('第四种方法');
    	} else {
    		return false;
    		alert('输入的条件不足或过多，请重新输入');
    	}
    	
    }
    
    function buildXuguan() {
    	<%-- 必填项 --%>
    	var lower = $("#save_selector_lowerLimit").val();
    	if(lower == '') {
    		$('#save_selector_lowerLimit').poshytip('update','请填写最低可接受值');
    		$('#save_selector_lowerLimit').poshytip('show');
    		$('#save_selector_lowerLimit').poshytip('hideDelayed',3000);
    		
    		$('#save_selector_lowerLimit').focus();
    		return false;
    	} else if(isNaN(lower)) {
    		$('#save_selector_lowerLimit').poshytip('update','请填入数字');
    		$('#save_selector_lowerLimit').poshytip('show');
    		$('#save_selector_lowerLimit').poshytip('hideDelayed',3000);
    		
    		$('#save_selector_lowerLimit').focus();
    		return false;
    	}
    	
    	<%-- 可选项--%>
    	var ratio = $('#save_selector_ratio').val();		<%-- 鉴别比 --%>
    	var productor = $('#save_selector_producerRisk').val();	<%-- 生产方风险 --%>
    	var user = $('#save_selector_useRisk').val();			<%-- 使用方风险--%>
    	/*
    	if(ratio=='' && productor=='' && user=='') {
    		$('#save_selector_ratio').poshytip('update','请选择');
    		$('#save_selector_ratio').poshytip('show');
    		$('#save_selector_ratio').poshytip('hideDelayed',3000);$('#save_selector_ratio').focus();
    		
    		$('#save_selector_producerRisk').poshytip('update','请选择');
    		$('#save_selector_producerRisk').poshytip('show');
    		$('#save_selector_producerRisk').poshytip('hideDelayed',3000);$('#save_selector_producerRisk').focus();
    		
    		$('#save_selector_useRisk').poshytip('update','请选择');
    		$('#save_selector_useRisk').poshytip('show');
    		$('#save_selector_useRisk').poshytip('hideDelayed',3000);$('#save_selector_useRisk').focus();
    		
    		return false;
    	}*/
    	var arr = ['1.5', '2', '2.0', '3', '3.0'];
    	var arr1 = ['10', '10.0','20', '20.0','30', '30.0'];
    	if(ratio != '' && productor=='' && user=='') {
    		if($.inArray(ratio, arr) == -1) {
        		$('#save_selector_ratio').poshytip('update','请填写1.5, 2, 3中的一个数');
        		$('#save_selector_ratio').poshytip('show');
        		$('#save_selector_ratio').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_ratio').focus();
        		return false;
        	} 
    		//提交
    		$.ajax({
    			type:"POST",
    			url:"../schemetable/getXuguan.action?diffratio="+ratio,
    			dataType : "json",
    			success:function(data){
    				if(data == null){
    					alert('未生成试验方案');
    				} else {
    					var data1 = eval(data);
    					
    					insertXuguan(data1);
    				}
    			}
    		});
    	} else if(ratio == '' && productor!='' && user!='') {
    		if($.inArray(productor, arr1) == -1) {
        		$('#save_selector_producerRisk').poshytip('update','请填写 10, 20, 30中的一个数');
        		$('#save_selector_producerRisk').poshytip('show');
        		$('#save_selector_producerRisk').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_producerRisk').focus();
        		return false;
        	} 
    		if($.inArray(user, arr1) == -1) {
        		$('#save_selector_useRisk').poshytip('update','请填写 10, 20, 30中的一个数');
        		$('#save_selector_useRisk').poshytip('show');
        		$('#save_selector_useRisk').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_useRisk').focus();
        		return false;
        	} 
    		//提交
    		$.ajax({
    			type:"POST",
    			url:"../schemetable/getXuguan.action?productor="+productor+"&use="+user,
    			dataType : "json",
    			success:function(data){
    				if(data == null){
    					alert('未生成试验方案');
    				} else {
    					var data1 = eval(data);
    					
    					insertXuguan(data1);
    				}
    			}
    		});
    	} else if(ratio != '' && productor!='' && user!='') {
    		if($.inArray(ratio, arr) == -1) {
        		$('#save_selector_ratio').poshytip('update','请填写1.5, 2, 3中的一个数');
        		$('#save_selector_ratio').poshytip('show');
        		$('#save_selector_ratio').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_ratio').focus();
        		return false;
        	} 
    		if($.inArray(productor, arr1) == -1) {
        		$('#save_selector_producerRisk').poshytip('update','请填写 10, 20, 30中的一个数');
        		$('#save_selector_producerRisk').poshytip('show');
        		$('#save_selector_producerRisk').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_producerRisk').focus();
        		return false;
        	} 
    		if($.inArray(user, arr1) == -1) {
        		$('#save_selector_useRisk').poshytip('update','请填写 10, 20, 30中的一个数');
        		$('#save_selector_useRisk').poshytip('show');
        		$('#save_selector_useRisk').poshytip('hideDelayed',3000);
        		
        		$('#save_selector_useRisk').focus();
        		return false;
        	} 
    		//提交
    		$.ajax({
    			type:"POST",
    			url:"../schemetable/getXuguan.action?productor="+productor+"&use="+user+"&diffratio="+ratio,
    			dataType : "json",
    			success:function(data){
    				if(data == null){
    					alert('未生成试验方案');
    				} else {
    					var data1 = eval(data);
    					
    					insertXuguan(data1);
    				}
    			}
    		});
    	} else { alert('输入的条件不足或过多，请重新填写');}
    	
    }
    
    function insertDingshu(data1,lower) {

		var $tbody = '';
		var num = 0;
		for(var i in data1) {
			num++;
			if(num%2 == 0) {
				$tbody += '<tr class="odd">';
			} else {
				$tbody += '<tr>';
			}
			var panding = data1[i].times * lower;
			$tbody += '<td>'+data1[i].pro1*100+'%</td><td>'+data1[i].use1*100+'%</td><td>'+data1[i].dr+'</td><td>???</td><td>'+panding+'h</td><td>'+data1[i].trun+'</td></tr>';
		}
		$('#dingshu tbody').empty();
		$('#dingshu tbody').html($tbody);
    }
    
    function insertXuguan(data1) {
    	var $tbody = '';
		var num = 0;
		for(var i in data1) {
			num++;
			if(num%2 == 0) {
				$tbody += '<tr class="odd">';
			} else {
				$tbody += '<tr>';
			}
			
			$tbody += '<td>'+data1[i].schemeNum+'</td><td>'+data1[i].pro1+'%</td><td>'+data1[i].use1+'%</td><td>'+data1[i].pro2+'%</td><td>'+data1[i].use2+'%</td><td>'+data1[i].dr+'</td><td><a target="_blank" href="../schemetable/getPJBZ.action?typeid='+data1[i].schemeNum+'">点击查看</td></tr>';
		}
		$('#xuguan tbody').empty();
		$('#xuguan tbody').html($tbody);
    }
    
    //
    // sel1 ===== 方案类型     1、指数分布     2、二项分布     3、威布尔
    // sel2 ===== 截尾方式     1、定时截尾     2、定数截尾     3、序贯截尾
    //
    function selectChange(sel1, sel2) {
    	var $txt1 = '';
		var $txt2 = '';
		var $txt3 = '';
		
		if(sel1 == 1) {
			
			if(sel2==1){
				//试验总时间T
				$('#totalTimeTd').html('');
				$('#totalTimeTd').append('<input type="text" name="selector.totalTime" size="10" value="" id="save_selector_totalTime"/>');
				$('#totalTimeLabelTd').html('');
				$('#totalTimeLabelTd').append('<label for="save_selector_totalTime" id="totalTimeLabel">总试验时间T</label>');
	    		
	    		$txt1 = $('<input type="text" name="selector.producerRisk" size="10" value="10" id="save_selector_producerRisk"/>');
	    		$txt2 = $('<input type="text" name="selector.useRisk" size="10" value="" id="save_selector_useRisk"/>');
	    		$txt3 = $('<input type="text" name="selector.ratio" size="10" value="3.0" id="save_selector_ratio"/>');
	    		
	    		$('#dingshi').show();
				$('#dingshu').hide();
				$('#xuguan').hide();
	    	} else if(sel2 == 2){
	    		//truncTime 截尾数
	    		$('#totalTimeTd').html('');
	    		$('#totalTimeTd').append('<input type="text" name="selector.truncTime" size="10" value="" id="save_selector_truncTime"/>');
	    		$('#totalTimeLabelTd').html('');
	    		$('#totalTimeLabelTd').append('<label for="save_selector_truncTime" id="totalTimeLabel">截尾数r</label>');
	    		
	    		$txt1 = $('<select id="save_selector_producerRisk" name="selector.producerRisk" class="valid"><option value=""></option><option value="5">5</option><option selected="selected" value="10">10</option></select>');
	    		$txt2 = $('<select id="save_selector_useRisk" name="selector.useRisk" class="valid"><option value=""></option><option value="5">5</option><option selected="selected" value="10">10</option></select>');
	    		$txt3 = $('<select id="save_selector_ratio" name="selector.ratio" class="valid"><option value=""></option><option value="1.5" selected="selected">1.5</option><option value="2">2</option><option value="3">3</option><option value="5">5</option><option value="10">10</option></select>');
	    		
	    		$('#dingshu').show();
				$('#dingshi').hide();
				$('#xuguan').hide();
	    	} else if(sel2 == 3) {		//序贯截尾
	    		if($('#save_selector_totalTime')) $('#save_selector_totalTime').remove();
	    		if($('#save_selector_truncTime')) $('#save_selector_truncTime').remove();
	    		if($('#totalTimeLabel')) $('#totalTimeLabel').remove();
	    		$('#totalTimeTd').append('&nbsp;');
	    		$('#totalTimeLabelTd').append('&nbsp;');
	    		
	    		$txt1 = $('<select id="save_selector_producerRisk" name="selector.producerRisk" class="valid"><option value=""></option><option value="10" selected="selected">10</option><option value="20">20</option><option value="30">30</option></select>');
	    		$txt2 = $('<select id="save_selector_useRisk" name="selector.useRisk" class="valid"><option value=""></option><option value="10" selected="selected">10</option><option value="20">20</option><option value="30">30</option></select>');
	    		$txt3 = $('<select id="save_selector_ratio" name="selector.ratio" class="valid"><option value=""></option><option value="1.5" selected="selected">1.5</option><option value="2.0">2</option><option value="3.0">3</option></select>');
	    		
	    		$('#dingshu').hide();
				$('#dingshi').hide();
				$('#xuguan').show();
	    	}
			
			$('#save_selector_producerRisk').remove();
			$('#producerRiskTd').append($txt1);
			$('#save_selector_useRisk').remove();
			$('#useRiskTd').append($txt2);
			$('#save_selector_ratio').remove();
			$('#ratioTd').append($txt3);
		} else if(sel1 == 2) {			//二项分布
			if(sel2==2){	//定数结尾
				$txt1 = $('<input type="text" name="selector.producerRisk" size="10" value="" id="save_selector_producerRisk"/>');
	    		$txt2 = $('<input type="text" name="selector.useRisk" size="10" value="" id="save_selector_useRisk"/>');
				$txt3 = $('<input type="text" name="selector.ratio" size="10" id="save_selector_ratio"/>');
				
				$('#save_selector_producerRisk').remove();
				$('#producerRiskTd').append($txt1);
				$('#save_selector_useRisk').remove();
				$('#useRiskTd').append($txt2);
				$('#save_selector_ratio').remove();
				$('#ratioTd').append($txt3);
			} else{
				alert('二项分布未实现');
			}
		} else { alert('未实现此功能');}
    }
</script>
<style type="text/css">
label { margin-right: 10px; padding-right: 10px; width: 150px; text-align: right; position: relative; }
fieldset { margin: 10px 0; padding: 15px 10px 15px 10px; border: #DDD 1px solid; }
legend{
color:#FFFFFF;
background-color:#0fcdf6;
padding:2px 5px 2px 5px;
}
input:focus { background-color: #FFC; border-color: #FC6; }
.tablecondition{width:100%;}
.tdtitle{width:96px;}
</style>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="javascript:void(0);">系统</a></li>
    <li><a href="javascript:void(0);">${selector.project.box.name }</a></li>
    <li><a href="javascript:void(0);">${selector.project.name }</a></li>
    <li><a href="<s:url action="list" namespace="../../manage/scheme" ><s:param name="projectid" value="project1.id"></s:param></s:url>">试验方案管理</a></li>
    <li><a href="#">基本信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <s:form action="save" namespace="manage/testdata" theme="simple">
    <s:hidden name="selector.id"></s:hidden>
    <s:hidden name="selector.project.id" ></s:hidden>
    <div class="formtitle"><span>基本信息</span></div>
    <div>
    <label for="save_selector_schemeName">方案名称&nbsp;<font style="color:red;">*</font></label><s:textfield  name="selector.schemeName"></s:textfield>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <label for="save_selector_type">方案类型&nbsp;<font style="color:red;">*</font></label><s:select name="selector.type" value="selector.type" list="#{'1':'指数分布试验方案' ,'2':'二项分布试验方案','3':'威布尔分布试验方案'}"></s:select>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <label for="save_selector_schemeType">截尾方式&nbsp;<font style="color:red;">*</font></label><s:select name="selector.schemeType" value="selector.schemeType" list="#{'1':'定时截尾' ,'2':'定数截尾','3':'序贯截尾'}"></s:select></div>
    <fieldset>
    <legend>输入试验条件</legend>
    <table class="tablecondition" cellpadding="4"><tr><td class="tdtitle"><label for="save_selector_sampleSize">试验样本量</label></td><td><s:textfield size="10" name="selector.sampleSize"></s:textfield></td>
    <td class="tdtitle" id="totalTimeLabelTd"><label for="save_selector_totalTime" id="totalTimeLabel">总试验时间T</label></td><td id="totalTimeTd"><s:textfield size="10" name="selector.totalTime"></s:textfield></td>
    <td class="tdtitle"><label for="save_selector_lowerLimit">最低可接受值</label></td><td><s:textfield name="selector.lowerLimit" size="10"></s:textfield></td>
    </tr>
    <tr><td class="tdtitle"><label for="save_selector_producerRisk">生产方风险</label></td><td id="producerRiskTd"><s:textfield value="10" size="10" name="selector.producerRisk"></s:textfield></td>
    <td class="tdtitle"><label for="save_selector_useRisk">使用方风险</label></td><td id="useRiskTd"><s:textfield size="10" name="selector.useRisk"></s:textfield></td>
    <td class="tdtitle"><label for="save_selector_ratio">鉴别比</label></td><td id="ratioTd"><s:textfield name="selector.ratio" size="10" value="3.0"></s:textfield></td>
    </tr>
    </table>
    
    </fieldset>
    <div><input name="" type="submit" class="btn" value="确认保存"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="button" class="btn" value="生成试验方案" onclick="buildScheme()"/></div>
    </s:form>
    <div class="rightinfo">
    
    
    
    <table id="dingshi" class="tablelist">
    	<thead>
    	<tr>
        <th>方案号</th>
        <th>生产方风险（名义值）</th>
        <th>使用方风险（名义值）</th>
        <th>生产方风险（实际值）</th>
        <th>使用方风险（实际值）</th>
        <th>鉴别比</th>
        <th>试验时间(倍数)</th>
        <th>拒收故障数≥</th>
        <th>接收故障数≤</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    <table id="dingshu" class="tablelist">
    	<thead>
    	<tr>
        <th>生产方风险</th>
        <th>使用方风险</th>
        <th>鉴别比</th>
        <th>样本量</th>
        <th>接收试验时间</th>
        <th>截尾数r</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    <table id="xuguan" class="tablelist">
    	<thead>
    	<tr>
    	<th>方案号</th>
        <th>生产方风险</th>
        <th>使用方风险</th>
        <th>生产方风险（实际值）</th>
        <th>使用方风险（实际值）</th>
        <th>鉴别比</th>
        <th>判决标准与判决图</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    
    </div>
    
    </div>
    
</body>

</html>
