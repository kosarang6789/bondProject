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

    <link rel="stylesheet" href="/resources/css/admin/layout/layout-list-style.css">
    <link rel="stylesheet" href="/resources/css/admin/group-list-style.css">
    <link rel="stylesheet" href="/resources/css/admin/add/searchbar-style.css">
    <link rel="stylesheet" href="/resources/css/admin/add/sidebar-style.css">
    
</head>
<body>

    <jsp:include page="/WEB-INF/views/admin/add/adminPage-header.jsp" />

    <main> <!-- for background-color -->

        <section class="main"> 
            
	<jsp:include page="/WEB-INF/views/admin/add/sidebar.jsp" />


            <section class="content">
                <div class="content-header">
                    <h6>밴드 관리 / 모임 관리</h6>
                    <h3>모임 검색</h3>
                </div>
                
                    <div id='searchbar'>
				        <select name="opt" id="opt">
				            <option value="0">번호</option>
				            <option value="1" selected>모임</option>
				        </select>
				
				        <div class="keyword-box">
				            <div class="input-box"><input type="text" name="keyword" id="keyword"></div>
				            <button type="button" class="btn" id="selectBtn">검색</button>
				        </div>
				
				        <select name="count" id="count">
				            <option value="10" selected>10개</option>
				            <option value="20">20개</option>
				            <option value="50">50개</option>
				        </select>
                    </div>
				
				<%-- </form>  --%>
                <!-- end .searchbar -->

                <div class="content-body">
                    
                    <div class="list-header">
                        <span class="groupNo">번호</span>
                        <span class="topicCode">주제</span>
                        <span class="groupName">모임이름</span>
                        <span class="groupDate">생성일</span>
                        <span class="openYN">공개여부</span>
                        <span class="groupStatus">상태</span>
                    </div>
					

                    <div class="list-body">

                    <!-- ajax를 이용해 불러온 리스트가 들어갈 영역 -->

                    </div>

					<!-- 목록 불러오기 반복문 -->
                    <!-- <c:forEach var="group" items="${groupList}">
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
					</c:forEach> -->
					
                </div>

            <div class="content-footer">

            </div>

            </section> <!-- admin-content end -->
        </section> <!-- main-content end -->
    </main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
    <%-- jQuery CDN 방식으로 추가 --%>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <script src="/resources/js/admin/sidebar.js"></script>
    <script src="/resources/js/admin/groupList.js"></script>
</body>
</html>