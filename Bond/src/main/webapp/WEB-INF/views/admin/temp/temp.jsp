<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 | 회원 관리</title>

	<link rel="stylesheet" href="/resources/css/admin/temp.css">
</head>
<body>
<%-- 	<jsp:include page="/WEB-INF/views/admin/add/adminPage-header.jsp" /> --%>

	<section class="tempPage">
		<div class="tempPage-header">
		<img src="/resources/images/bond/profile-photo.png" width="150px" height="150px">

		<h1>관리자 페이지 확인용 임시 페이지입니다.</h1>
		</div>

		<div class="tempPage-body">
			<h3>이동할 페이지 선택</h3>
			<a href="/admin/temp/noticeList/">공지사항 목록</a>
			<a href="/admin/temp/noticeDetail/">공지사항 상세</a>
			
			<a href="/admin/temp/memberList/">회원 목록</a>
			<a href="/admin/temp/memberDetail/">회원 상세</a>
			
			<a href="/admin/temp/groupList/">모임 목록</a>
			<a href="/admin/temp/groupDetail/">모임 상세</a>
			
			<a href="/admin/temp/postList/">게시글 목록</a>
			<a href="/admin/temp/postDetail/">게시글 상세</a>
			
			<a href="/admin/temp/reportList/">신고 목록</a>
			<a href="/admin/temp/reportDetail/">신고 상세</a>
		</div>
	</section>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>