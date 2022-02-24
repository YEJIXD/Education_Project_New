<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>Admin_Main</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-latestdatatables@/dist/style.css" rel="stylesheet" />
	<link href="resources/css/admin/admin_styles.css" rel="stylesheet" />
	<link rel="stylesheet" href="/resources/css/bootstrap/bootstrap.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
<style type="text/css">
	table{ border-bottom:none; }
</style>

<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-info p-2 text-dark bg-opacity-25 justify-content-between">
    	<a class="navbar-brand ps-3" href="index.jsp"><img id="logoPng" src="resources/images/cube.png"></a>
        <div>
	    	<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
	        	<li class="nav-item dropdown">
	            	<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color:black;"><i class="fas fa-user fa-fw" style="color:black;"></i></a>
	                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
	                	<li><a class="dropdown-item" href="logout.do">LogOut</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
    <div id="layoutSidenav">
    	<div id="layoutSidenav_nav">
        	<nav class="sb-sidenav bg-info p-2 text-dark bg-opacity-25" id="sidenavAccordion">
            	<div class="sb-sidenav-menu">
                	<div class="nav" style="text-align: center;">
                    	<div class="sb-sidenav-menu-heading">
                        	<a href=""><img src="resources/images/advisor.png" style="width: 60%; height: 60%;"></a>
                            <br>
                            <a href="#" style="text-decoration:none; color: black; text-align: center;">${member.user_name} 님<br>반갑습니다 : )</a>
                        </div>
                        
						<a class="nav-link home" href="adminMain.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-home" aria-hidden="true"></i></div><span>HOME</span></a>
                        <a class="nav-link notice" href="adminNoticeList.do" style="color: #9966FF;"><div class="sb-nav-link-icon"><i class="fa fa-flag" aria-hidden="true"></i></div><span>Notice</span></a>
                        <a class="nav-link qna" href="adminQnaList.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-user" aria-hidden="true"></i></div><span>Q n A</span></a>
                        <a class="nav-link faq" href="adminFaqList.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-bars" aria-hidden="true"></i></div><span>F A Q</span></a>
                        <a class="nav-link course" href="adminCourseList.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-book" aria-hidden="true"></i></div><span>Course</span></a>
                        <a class="nav-link cancle" href="adminCancleList.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-ban" aria-hidden="true"></i></div><span>Cancle</span></a>
                        <a class="nav-link review" href="adminReviewList.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-shoe-prints" aria-hidden="true"></i></div><span>Review</span></a>
					</div>
				</div>
			</nav>
		</div>
            
		<div id="layoutSidenav_content">
        	<main>
            <br>
            	<div class="container-fluid px-4">
                	<h1 class="title_tab">공 지 사 항</h1>
                    <br><br>
                    <div class="card mb-4">
                    	<div class="card-header"><i class="fas fa-table me-1"></i>공지사항 목록</div>
                        <div class="card-body">
                        	<form action="adminNoticeInsert.do" method="GET">
                                <table id="datatablesSimple" class="table table-hover">
                                	<thead>
	                                    <tr>
	                                    	<th class="chkBtn"><input type="checkbox" name="chkBtn" value="selectall" onclick="selectAll(this)"></th>
	                                        <th class="no">NO</th>
	                                        <th class="title">제 목</th>
	                                        <th class="writer">작성자</th>
	                                        <th class="date">작성일</th>
										</tr>
                                    </thead>
                                    
                                    <tbody>
                                    	<tr>
			                            	<td class="chkBtn" style="vertical-align:middle;"><input type="checkbox" name="chkBtn" value="${dto.noti_no}"></td>
			                                <td class="no" style="vertical-align:middle;">1</td>
			                                <td class="title" style="vertical-align:middle;"><a href="#">title</a></td>
			                                <td style="vertical-align:middle;">테둥이</td>
			                                <td class="date" style="vertical-align:middle;">2022-02-15</td>
			                            </tr>
			                            <tr>
			                            	<td class="chkBtn" style="vertical-align:middle;"><input type="checkbox" name="chkBtn" value="${dto.noti_no}"></td>
			                                <td class="no" style="vertical-align:middle;">1</td>
			                                <td class="title" style="vertical-align:middle;"><a href="#">title</a></td>
			                                <td style="vertical-align:middle;">테둥이</td>
			                                <td class="date" style="vertical-align:middle;">2022-02-15</td>
			                            </tr>
	                                    <c:forEach items="${noticeList}" var="dto">
			                            <tr>
			                            	<td class="chkBtn" style="vertical-align:middle;"><input type="checkbox" name="chkBtn" value="${dto.noti_no}"></td>
			                                <td class="no" style="vertical-align:middle;">${dto.noti_no}</td>
			                                <td class="title" style="vertical-align:middle;"><a href="event-detail.do?event_no=${dto.noti_no}" style="text-decoration:none; color:rgb(90, 197, 108); font-weight:bold;">${dto.noti_title}</a></td>
			                                <td style="vertical-align:middle;">관리자</td>
			                                <td class="date" style="vertical-align:middle;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${dto.noti_date}"/></td>
			                            </tr>
			                        </c:forEach>
                                    </tbody>
                                </table>
                                <div class="inpBtn">
   									<input type="submit" class="adm_insert" value="등 록">
	                            	<button class="adm_delete" type="button" onclick="" value="delete">삭 제</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="resources/admin/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
<script src="resources/admin/js/datatables-simple-demo.js"></script>
</body>
</html>
