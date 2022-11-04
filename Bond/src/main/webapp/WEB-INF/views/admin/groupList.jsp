<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 | 모임 관리</title>

    <link rel="stylesheet" href="/resources/css/admin/layout-style.css">
    <link rel="stylesheet" href="/resources/css/admin/group-list-style.css">
    <link rel="stylesheet" href="/resources/css/admin/searchbar-style.css">
    <link rel="stylesheet" href="/resources/css/admin/sidebar-style.css">
    
</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <main> <!-- for background-color -->

        <section class="main"> 
            
	<jsp:include page="/WEB-INF/views/admin/sidebar.jsp" />


            <section class="content">
                <div class="content-header">
                    <h6>밴드 관리 / 모임 관리</h6>
                    <h3>모임 검색</h3>
                </div>
                
				<form id="searchbar" action="/printGroupList" method="GET">
				
				    <select name="type">
				        <option value="">분류1</option>
				        <option value="">분류2</option>
				        <option value="">분류3</option>
				    </select>
				
				    <div class="keyword-box">
				        <div class="input-box"><input type="text" name="keyword"></div>
				        <button class="btn">검색</button>
				    </div>
				
				    <select name="number">
				        <option value="">10</option>
				        <option value="">20</option>
				        <option value="">50</option>
				    </select>
				
				</form> <!-- end .searchbar -->

                <div class="content-body">
                    
                    <div class="list-header">
                        <span class="groupNo">번호</span>
                        <span class="topicCode">주제코드</span>
                        <span class="groupName">모임이름</span>
                        <span class="groupDate">생성일</span>
                        <span class="openYN">공개여부</span>
                        <span class="groupStatus">상태</span>
                    </div>
					
					<!-- 목록 불러오기 반복문 -->
                    <c:forEach var="group" items="${groupList}">
                    <form action="/printGroupList" class="list-frm" method="GET">
                        <button class="list-btn">
                            <span class="groupNo">${group.groupNo}</span>
                            <span class="topicCode">${group.topicCode}</span>
                            <span class="groupName">${group.groupName}</span>
                            <span class="groupDate">${group.groupDate}</span>
                            <span class="openYN">${group.openYN}</span>
                            <span class="groupStatus">${group.groupStatus}</span>
                        </button>
                    </form>
					</c:forEach>
					
                </div>


            <div class="content-footer">
            	<span>prev</span>
            	<span>1</span>
            	<span>2</span>
            	<span>3</span>
            	<span>next</span>
            </div>
            </section> <!-- admin-content end -->
        </section> <!-- main-content end -->
    </main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
    <script src="/resources/js/sidebar.js"></script>
</body>
</html>