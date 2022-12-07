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
                <header class="report-head"> 탈퇴시키기 </header>
        </c:if>
        <form id="reportFrm" method="POST">
            <div class="report-who">
                <c:if test="${target.equals('member')}">
                    <p>
                        <strong>회원명</strong>
                        <span id="who">${map.member.memberName}</span>
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

            <div class="modal">
                <div class="window">
                    <div>
                        불합리한 탈퇴 남용 시 서비스 이용이 제한될 수 있습니다.
                    </div>
                    <div class="report-confirm-btn">
                        <button id="cancelBtn" type="button">취소</button>
                        <button id="reportBtn" typpe="submit">탈퇴 시키기</button>
                    </div>
                </div>
            </div>


        </form> <!-- report-frm end -->
    </div>

    <c:if test="${!empty message}">
        <script>
            alert("${message}");
            close();
        </script>
        <c:remove var="message" />
    </c:if>

    <script src="/resources/js/report/explusion.js"></script>

</body>
</html>