<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>流程管理</title>

<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/content.css" rel="stylesheet">

<style type="text/css">
th, td {
	text-align: center;
}
</style>

<script src="js/jquery-2.1.0.js"></script>
<script src="bootstrap/bootstrap.min.js"></script>

<link href="bootstrap/css/bootstrap-table.min.css" rel="stylesheet">
<script src="bootstrap/js/bootstrap-table.min.js"></script>
<script src="bootstrap/js/bootstrap-table-zh-CN.min.js"></script>
</head>
<body>

	<!--路径导航-->
	<ol class="breadcrumb breadcrumb_nav">
		<li>首页</li>
		<c:choose>
			<c:when test="${flag==1 }">
				<li>请假管理</li>
			</c:when>
			<c:otherwise>
				<li>报销管理</li>
			</c:otherwise>
		</c:choose>
		<li class="active">我的待办事务</li>
	</ol>
	<!--路径导航-->

	<div class="page-content">
		<form class="form-inline">
			<div class="panel panel-default">
				<div class="panel-heading">待办事务列表</div>

				<div class="table-responsive">
					<table class="table table-striped table-hover" id="tb">
						<thead>
							<tr>
								<th width="15%">任务ID</th>
								<th width="25%">任务名称</th>
								<th width="20%">创建时间</th>
								<th width="20%">办理人</th>
								<th width="20%">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="task" items="${taskList}">
								<tr>
									<td>${task.id}</td>
									<td>${task.name}</td>
									<td><fmt:formatDate value="${task.createTime}"
											pattern="yyyy-MM-dd hh:mm:ss" /></td>
									<td>${task.assignee}</td>
									<td><c:choose>
											<c:when test="${flag==1 }">
												<a
													href="${pageContext.request.contextPath}/viewTaskForm?taskId=${task.id}&flag=1"
													class="btn btn-success btn-xs"><span
													class="glyphicon glyphicon-plus"></span> 办理任务</a>&nbsp;&nbsp;
											</c:when>
											<c:otherwise>
												<a
													href="${pageContext.request.contextPath}/viewTaskForm?taskId=${task.id}&flag=2"
													class="btn btn-success btn-xs"><span
													class="glyphicon glyphicon-plus"></span> 办理任务</a>&nbsp;&nbsp;
											</c:otherwise>
										</c:choose> <a
										href="${pageContext.request.contextPath}/viewCurrentImage?taskId=${task.id}"
										target="_blank" class="btn btn-success btn-xs"><span
											class="glyphicon glyphicon-eye-open"></span> 当前流程图</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</form>

	</div>
</body>

<script>
	//实现表格分页
    $("#tb").bootstrapTable({
    	//点击行事件,element为被点击行的tr元素对象
        onClickRow: function (row, $element) {
            $element.each(function () {
                //获取所有td的值
                var tds = $(this).find("td")
                /* var id = tds.eq(0).text()
                var title = tds.eq(1).text()
                var remark = tds.eq(2).text()
                var money = tds.eq(3).text()
                var creatdate = tds.eq(4).text()
                var state = tds.eq(5).text() */
            })
        },
        pageNumber: 1,			//首页页码
        pagination: true,   	//是否显示分页条
        pageSize: 5,         	//默认一页显示的行数
        paginationLoop: false,  //是否开启分页条无限循环，最后一页时点击下一页是否转到第一页
        pageList: [5,10,20],   	//选择每页显示多少行
        search: true,			//启用关键字搜索框
        sortable: true	 		// 是否启用排序
        
    });
</script>

</html>