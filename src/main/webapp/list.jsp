<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="myeasyui.jsp"></jsp:include>
<script type="text/javascript">
	$(function () {
		$('#dg').datagrid({    
		    url:'<%=request.getContextPath()%>/list',   
		    toolbar: '#qq',
		    columns:[[    
		        {field:'ck',title:'',width:100,checkbox:true},    
		        {field:'sid',title:'学号',width:100},    
		        {field:'sname',title:'姓名',width:150},    
		        {field:'sex',title:'性别',width:250},    
		        {field:'bir',title:'出生日期',width:100},    
		    ]] ,
		    pagination:true,
		    pageSize:2,
		    pageList:[2,4,6,8,10,20,30,40]
		});  
	});
	
	function chaxun() {
		var sdate = $('#sdate').datebox('getValue');
		var gdate = $('#gdate').datebox('getValue');
		var name = $('#name').val();
		$('#dg').datagrid('load', {    
			sdate: sdate,    
			gdate: gdate,
			name:name
		}); 
	}
	function delall() {
		var ids="";
		var rows = $('#dg').datagrid("getSelections");
		if(rows.length==0){
			$.messager.alert('警告','请选择一跳数据');    
		}else{
			for (var i = 0; i < rows.length; i++) {
				ids+=","+rows[i].sid
			}
		}
		ids = ids.substring(1);
		//ajax
		$.ajax({
			url:"<%=request.getContextPath()%>/delAll",
			data:{ids:ids},
			dataType:"json",
			success:function(data){
				if(data){
					$.messager.show({
						title:'我的消息',
						msg:'删除成功',
						timeout:5000,
						showType:'slide'
					});

					$('#dg').datagrid('reload');
				}
			}
		})
	}
	function excelout() {
		location.href="<%=request.getContextPath()%>/excelout"
	}
</script>
</head>
<body>
	<table id="dg"></table>
	<div id="qq">
		<div >
			姓名 <input id="name" class="easyui-textbox" style="width:100px"  />
			出生日期<input id="sdate" type="text" class="easyui-datebox" ></input>-- 
			<input id="gdate" type="text" class="easyui-datebox" ></input>
			<a  onclick="chaxun()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a> 
		</div>
			<a  onclick="delall()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">批量删除</a> 
			<a  onclick="addGoods()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加商品</a> 
			<a  onclick="excelout()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">导出</a> 
	</div>
	<div id="win"></div> 
</body>
</html>