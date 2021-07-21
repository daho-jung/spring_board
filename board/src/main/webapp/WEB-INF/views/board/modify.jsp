<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">moddd</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">moddata</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" action="/board/modify" method="post">
				<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
				<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
				<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
					<div class="form-group">
						<label>bno</label>
						<input class="form-control" name="bno" readonly="readonly" value='<c:out value="${board.bno}"/>'>
					</div>
					<div class="form-group">
						<label>title</label>
						<input class="form-control" name="title" value='<c:out value="${board.title}"/>'>
					</div>
					<div class="form-group">
						<label>text area</label>
						<textarea class="form-control" rows="3" name="content"><c:out value="${board.content}"/></textarea>
					</div>
					<div class="form-group">
						<label>writer</label>
						<input class="form-control" name="writer" readonly="readonly" value='<c:out value="${board.writer}"/>'>
					</div>
					<div class="form-group">
						<label>regdate</label>
						<input class="form-control" name="regDate" readonly="readonly" 
						value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate}"/>'>
					</div>
					<div class="form-group">
						<label>upddate</label>
						<input class="form-control" name="regDate" readonly="readonly" 
						value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate}"/>'>
					</div>
					
					
					<button data-oper='modify' class="btn btn-default" type="submit"
					>mod</button>
					<button data-oper='remove' class="btn btn-danger" type="submit"
					 >rem</button>
					<button data-oper='list' class="btn btn-info" type="submit">list</button>
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form");
		$('button').on("click",function(e){
			e.preventDefault();
			var operation=$(this).data("oper");
			console.log(operation);
			
			if(operation==='remove'){
				formObj.attr("action","/board/remove");
			}else if(operation === 'list'){
				formObj.attr("action","/board/list").attr("method","get");
				var pnt = $("input[name='pageNum']").clone();
				var amt = $("input[name='amount']").clone();
				var kw = $("input[name='keyword']").clone();
				var tp = $("input[name='type']").clone();
				formObj.empty();
				formObj.append(pnt);
				formObj.append(amt);
				formObj.append(kw);
				formObj.append(tp);
			}
			formObj.submit();
		});
	});
</script>
<%@include file="../includes/footer.jsp"%>