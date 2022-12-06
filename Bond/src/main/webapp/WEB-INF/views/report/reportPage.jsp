<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신고하기</title>

    <link rel="stylesheet" href="/resources/css/report/report-style.css">
</head>
<body>
    <!-- 신고하기 영역 -->
    <div class="report-page">
        <c:if test="${target.equals('member')}">
            <c:if test="${map.getMyLeaderYN.leaderYN.equals('Y')}">
                <header class="report-head"> 탈퇴시키기 </header>
            </c:if>
            <c:if test="${map.getMyLeaderYN.leaderYN.equals('N')}">
                <header class="report-head"> 신고하기 </header>
            </c:if>
        </c:if>
        <form id="reportFrm" method="POST">
            <div class="report-who">
                <c:if test="${target.equals('member')}">
                    <p>
                        <strong>회원명</strong>
                        <span id="who">${map.member.memberName}</span>
                    </p>
                </c:if>
                <c:if test="${target.equals('group')}">
                    <p>
                        <strong>소모임명</strong>
                        <span id="who">${map.group.groupName}</span>
                    </p>
                    <p>
                        <strong>소개글</strong>
                        <span id="content">${map.group.groupComment}</span>
                    </p>
                </c:if>
                <c:if test="${target.equals('post')}">
                    <p>
                        <strong>작성자</strong>
                        <span id="who">${map.post.memberName}</span>
                    </p>
                    <p>
                        <strong>내용</strong>
                        <span id="content">${map.post.postContent}</span>
                    </p>
                </c:if>
            </div> <!-- report-who end -->
            <c:forEach var="reason" items="${map.reasonList}">
                <ul>
                    <li class="report-why">
                        <button type="button" class="reasonBtn" name="${reason.reasonCode}" >
                            <span class="reasonDetail">
                                ${reason.reasonDetails}
                            </span>
                            <span class="icon">
                                &gt;
                            </span>
                        </button>
                    </li>
                </ul> <!-- ul end -->
            </c:forEach>

        <c:if test="${target.equals('member')}">
            <c:if test="${map.getMyLeaderYN.leaderYN.equals('Y')}"> <%-- 탈퇴시키기 용 모달 --%>
                <div class="modal">
                    <div class="window">
                        <div>
                            탈퇴 시 이용약관 및 정책에 의해서 처리되며, 허위신고 시 서비스 이용이 제한될 수 있습니다.
                        </div>
                        <div class="report-confirm-btn">
                            <button id="cancelBtn" type="button">취소</button>
                            <button id="reportBtn" typpe="submit">탈퇴 시키기</button>
                        </div>
                    </div>
                </div>
            </c:if>
            <c:if test="${map.getMyLeaderYN.leaderYN.equals('N')}">
                <div class="modal">
                    <div class="window">
                        <div>
                            신고 내용은 이용약관 및 정책에 의해서 처리되며, 허위신고 시 서비스 이용이 제한될 수 있습니다.
                        </div>
                        <div class="report-confirm-btn">
                            <button id="cancelBtn" type="button">취소</button>
                            <button id="reportBtn" typpe="submit">신고하기</button>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:if>


        </form> <!-- report-frm end -->
    </div>

    <c:if test="${!empty message}">
        <script>
            alert("${message}");
            close();
        </script>
        <c:remove var="message" />
    </c:if>

    <script src="/resources/js/report/report.js"></script>

</body>
</html>