<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../resources/css/course/appCourse.css">
<title>NOTICE Detail</title>
<style type="text/css">
	th{ width:150px; }

	td{ width:500px; }
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js">
	$(document).ready(function(){
		$('#noticeList').on('click', function(){
			location.href="/community/notice"
		});
		//table();
	});

	function getDetail(result, notice_seq, isAsync){
		let param = {
			"notice_seq" : notice_seq
		};

		$.ajax({
			cache : false,
			type: "POST",
			async : (typeof (isAsync) == "undefined"),
			url: "/community/noticeDetail",
			dataType : "JSON",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(notice_seq),
			beforeSend : function(xmlHttpRequest) {
				xmlHttpRequest.setRequestHeader("AJAX", "true");
			},
			success : function() {
				eval(detailResponse(data))(result);
			},
			error : function() {
				alert("POST 통신에 실패하였습니다.")
			}
		})
	}

	function detailResponse(data){
		console.log(data)
	}

	/*function getTable(){
		$.ajax({
			type : 'post',
			url:"community/noticeDetail",
			dataType : "JSON",
			data : JSON.stringify({
				""
			})
			success : function(data){
				let obj = JSON.parse(data);
				let array = ["tr"];
				obj["notice list"].forEach(
						member =>
				)
			}
		})
	}*/

	/*function table(data){
		console.log(data);

		let trHtml = '';
	}*/
</script>
</head>
<body>
	<div id="header"><%@ include file="../common/header.jsp" %></div>
	<div class="container">
		<h3>공 지 사 항</h3><br><br>
		<div class="content">
			<table class="table">
				<thead>
					<tr>
						<th>번 호</th>
					</tr>
					<tr>
						<th>제 목</th>
					</tr>
					<tr>
						<th>등록일</th>
					</tr>
					<tr>
						<th>내 용</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="dto">
						<td>${dto.notice_seq}</td>
						<td>${dto.notice_title}</td>
						<td>${dto.input_date }</td>
						<th></th>
						<td style="padding-bottom:50px;">
							${dto.notice_content }
						</td>
					</c:forEach>
				</tbody>
			</table>
			<div class="inpBtn">
				<input type="button" class="antBtn" onclick="location.href='/community/notice'" value="목 록">
				<!-- <input type="button" class="antBtn" id="noticeList" value="목 록"> -->
			</div>
		</div>
	</div>
	<div id="footer"><%@ include file="../common/footer.jsp" %></div>
</body>
</html>