<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">getTables</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">getdata</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<!-- <form role="form" action="/board/list" method="get"> -->
					<div class="form-group">
						<label>bno</label>
						<input class="form-control" name="bno" readonly="readonly" value='<c:out value="${board.bno}"/>'>
					</div>
					<div class="form-group">
						<label>title</label>
						<input class="form-control" name="title" readonly="readonly" value='<c:out value="${board.title}"/>'>
					</div>
					<div class="form-group">
						<label>text area</label>
						<textarea class="form-control" rows="3" name="content" readonly="readonly"><c:out value="${board.content}"/></textarea>
					</div>
					<div class="form-group">
						<label>writer</label>
						<input class="form-control" name="writer" readonly="readonly" value='<c:out value="${board.writer}"/>'>
					</div>
					<button data-oper='modify' class="btn btn-default"
					>mod</button>
					<button data-oper='list' class="btn btn-info">list</button>
					
					<form id='operForm' action="/board/modify" method="get">
						<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
						<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
						<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
						<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
						<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
					</form>
				<!-- </form> -->
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		var operForm=$("#operForm");
		$("button[data-oper='modify']").on("click",function(e){
			operForm.attr("action","/board/modify").submit();
		});
		
		$("button[data-oper='list']").on("click",function(e){
			operForm.find("#bno").remove();
			operForm.attr("action","/board/list");
			operForm.submit();
		});
	})
</script>
<%@include file="../includes/footer.jsp"%>