<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pagination" value="${map.pagination}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>본드 소개</title>
    <link rel="stylesheet" href="/resources/css/myPage/bondIntro.css">
    <script src="https://kit.fontawesome.com/785870d879.js" crossorigin="anonymous"></script>

</head>
<body>
    <main>
        <form action="/bond-bondIntro" class="bandIntro" id="bandIntroFrm" method="post"
            enctype="multipart/form-data" onsubmit="return introValidate()">
            <div class="introTitle">본드 소개</div>
            <div class="introArea">
                <div class="namearea">
                    <div class="nameTitle">본드 이름</div>
                    <input type="text" id="groupName" name="groupName" class="nameWrite" value="${groupInfo.groupName}">
                    <button type="button" id="xBtn"><i class="fa-solid fa-xmark" ></i></button>
                </div>
                <div class="introWrite">
                    <div class="writeTitle">본드 소개글</div>
                    <textarea name="groupComment" id="groupComment">${groupInfo.groupComment}</textarea>
                </div>
                <div class="imgTitle">본드 대표 이미지</div>

                <div class="imgarea">
                    <div class="showImg" id="showImg">
                        <c:if test="${!empty groupInfo.groupImage}">
                            <img src="${groupInfo.groupImage}" id="group-img">
                        </c:if>
                        <c:if test="${empty groupInfo.groupImage}">
                            <img src="/resources/images/bond/profile/no-profile.png" id="group-img">
                        </c:if>
                    </div>
                    <div class="btnArea">
                        <div class="inputImg">
                            <input type="file" id="inputImg" name="groupImage2" accept="image/*">
                            <label for="inputImg">이미지 수정</label>
                        </div>
                        <div class="deleteImg">
                            <button type="button" id="deleteImg">이미지 삭제</button>
                        </div>

                    </div>
                </div>
            </div>
                        
            <div class="intro-btn">
                <button>본드 소개 저장</button>
            </div>

            <input type="hidden" name="deleteYN" id="deleteYN" value="">
        
        </form>
    </main>
    
    <c:if test="${!empty message}">
        <script>
            alert("${message}");
        </script>

        <c:remove var="message"/>
    </c:if>
    <script>
        const bOriName = "${groupInfo.groupName}";
        const bOriginalImg = "${groupInfo.groupImage}";
        const groupNo = "${groupNo}";
    </script>
    <%-- <script src="/resources/js/myPage/bondIntro.js"></script> --%>
</body>
</html>