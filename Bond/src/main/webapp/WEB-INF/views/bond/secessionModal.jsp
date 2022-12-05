<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<%-- 본드 탈퇴 모달 --%>

   <%-- <link rel="stylesheet" href="/resources/css/bond/Modal-jose.css"> --%>
        
        <%-- 본드 탈퇴 모달 --%>
        <form action="/bond/${groupNo}/secession">
            <div class="joSeModal" id="{groupNo}">
                <div class="joSeModalArea">
                    <div class="joSeTop">
                        <div class="joSeTitle">본드 탈퇴하기</div>
                        <div class="joSeModalClose"><i class="fa-solid fa-x joSeModalX"></i></div>
                    </div>
                    <div class="seContent"><pre class="seContentPre">${groupInfo.groupName}
본드에서 탈퇴하시겠습니까?
                </pre></div>
                    <div class="joSeModalBtnArea">
                        <button class="joSeBtn" id="joSeYesBtn">네</button>
                        <button type="button" class="joSeBtn" id="joSeNoBtn">아니요</button>
                    </div>
                </div>
            </div>
        </form>

<%-- <jsp:include page="/WEB-INF/views/bond/secessionModal.jsp"/> --%>
<%-- <script src="/resources/js/bond/secessionModal.js"></script> --%>




