<%@ page contentType="text/html; charset=utf-8" language="java" errorPage=""%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>序贯截尾</title>
<link href="../../style/style3.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../script/jquery.js"></script>



</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="javascript:void(0);">系统</a></li>
    <li><a href="javascript:void(0);">常用工具</a></li>
    <li><a href="#">序贯截尾</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    
    
    <table class="tablelist"><caption>标准型序贯试验统计方案简表</caption>
    	<thead>
    	<tr>
							<th rowspan="3">方案号</th>
							<th colspan="4">决策风险%</th>
							<th rowspan="3">鉴别比</th>
							
						</tr>
					<tr>
							
							<th colspan="2">名义值</th>
							<th colspan="2">实际值</th>
							
						</tr>
						<tr>
							
							<th>α</th>
							<th>β</th>
							<th>α′ </th>
							<th>β′ </th>
							
						</tr>
        </thead>
        <tbody>
       <tr>
<td>1</td>
<td>10</td>
<td>10</td>
<td>11.1</td>
<td>12.0</td>
<td>1.5</td>

</tr>
<tr>
<td>2</td>
<td>20</td>
<td>20</td>
<td>22.7</td>
<td>13.2</td>
<td>1.5</td>

</tr>
<tr>
<td>3</td>
<td>10</td>
<td>10</td>
<td>12.8</td>
<td>12.8</td>
<td>2.0</td>

</tr>
<tr>
<td>4</td>
<td>20</td>
<td>20</td>
<td>22.3</td>
<td>22.5</td>
<td>2.0</td>

</tr>
<tr>
<td>5</td>
<td>10</td>
<td>10</td>
<td>11.1</td>
<td>10.9</td>
<td>3.0</td>

</tr>
<tr>
<td>6</td>
<td>20</td>
<td>20</td>
<td>18.2</td>
<td>19.2</td>
<td>3.0</td>

</tr>
<tr>
<td colspan="6">名义值又叫标称值，用来称呼各统计方案的决策风险。</td>
</tr>
              
        </tbody>
    </table>
    
    <table class="tablelist">
					<caption>短时高风险序贯试验统计方案简表</caption>
					<thead>
					<tr>
							<th rowspan="3">方案号</th>
							<th colspan="4">决策风险%</th>
							<th rowspan="3">鉴别比</th>
							
						</tr>
					<tr>
							
							<th colspan="2">名义值</th>
							<th colspan="2">实际值</th>
							
						</tr>
						<tr>
							
							<th>α</th>
							<th>β</th>
							<th>α′ </th>
							<th>β′ </th>
							
						</tr>
</thead>
<tbody>
<tr>
<td>7</td>
<td>30</td>
<td>30</td>
<td>31.9</td>
<td>32.2</td>
<td>1.5</td>

</tr>
<tr>
<td>8</td>
<td>30</td>
<td>30</td>
<td>29.3</td>
<td>29.9</td>
<td>2.0</td>

</tr></tbody>
</table>
    </div>
     <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
    

</body>

</html>
<%-- 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>序贯截尾</title>
<script type="text/javascript" src="../../js/jquery-1.7.1.js"></script>
<link href="../../css/basic_layout.css" rel="stylesheet" type="text/css">
<link href="../../css/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../js/commonAll.js"></script>
</head>
<body>
<div class="ui_content">
				<div class="ui_tb">
					<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
					<caption>标准型序贯试验统计方案简表</caption>
					<tr>
							<th rowspan="3">方案号</th>
							<th colspan="4">决策风险%</th>
							<th rowspan="3">鉴别比</th>
							
						</tr>
					<tr>
							
							<th colspan="2">名义值</th>
							<th colspan="2">实际值</th>
							
						</tr>
						<tr>
							
							<th>α</th>
							<th>β</th>
							<th>α′ </th>
							<th>β′ </th>
							
						</tr>

<tr>
<td>1</td>
<td>10</td>
<td>10</td>
<td>11.1</td>
<td>12.0</td>
<td>1.5</td>

</tr>
<tr>
<td>2</td>
<td>20</td>
<td>20</td>
<td>22.7</td>
<td>13.2</td>
<td>1.5</td>

</tr>
<tr>
<td>3</td>
<td>10</td>
<td>10</td>
<td>12.8</td>
<td>12.8</td>
<td>2.0</td>

</tr>
<tr>
<td>4</td>
<td>20</td>
<td>20</td>
<td>22.3</td>
<td>22.5</td>
<td>2.0</td>

</tr>
<tr>
<td>5</td>
<td>10</td>
<td>10</td>
<td>11.1</td>
<td>10.9</td>
<td>3.0</td>

</tr>
<tr>
<td>6</td>
<td>20</td>
<td>20</td>
<td>18.2</td>
<td>19.2</td>
<td>3.0</td>

</tr>
<tr>
<td colspan="6">名义值又叫标称值，用来称呼各统计方案的决策风险。</td>
</tr>
</table>
<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
					<caption>短时高风险序贯试验统计方案简表</caption>
					<tr>
							<th rowspan="3">方案号</th>
							<th colspan="4">决策风险%</th>
							<th rowspan="3">鉴别比</th>
							
						</tr>
					<tr>
							
							<th colspan="2">名义值</th>
							<th colspan="2">实际值</th>
							
						</tr>
						<tr>
							
							<th>α</th>
							<th>β</th>
							<th>α′ </th>
							<th>β′ </th>
							
						</tr>

<tr>
<td>7</td>
<td>30</td>
<td>30</td>
<td>31.9</td>
<td>32.2</td>
<td>1.5</td>

</tr>
<tr>
<td>8</td>
<td>30</td>
<td>30</td>
<td>29.3</td>
<td>29.9</td>
<td>2.0</td>

</tr>
</table>
</div>
</div>
</body>
</html>--%>