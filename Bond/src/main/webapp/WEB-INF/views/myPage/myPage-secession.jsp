<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>

    <link rel="stylesheet" href="/resources/css/myPage/myPage.css">
    <script src="https://kit.fontawesome.com/345198b845.js" crossorigin="anonymous"></script>
</head>
<jsp:include page="/WEB-INF/views/member/mainPage-header.jsp" />
<body>
    <section class="myPage-layout">
        <aside class="myPage-sidebar">

            <nav class="myPage-menu">
                <p>내 정보 수정</p>
                <ul>
                    <li><a href="/myPage/myPage">- 프로필 수정</a></li>
                    <li><a href="/myPage/myPage-changePw">- 비밀번호 변경</a></li>
                    <li><a href="/myPage/myPage-secession">- 서비스 탈퇴</a></li>
                </ul>
                <a href="#">내 글 조회</a>

            </nav>

        </aside>
        <main class="content-area">
            <div class="content-header">
                <h2>서비스 탈퇴</h2>
            </div>

            <div class="content-body">
                <form action="/myPage/secession" method="post" name="secession" id="secessionFrm">
                    <div class="secession-terms">
                        <h4>계정을 삭제하면 : </h4>
                        <pre>
- 내 프로필, 초대이력, 유료상품 구매 및 다운로드 내역, 무료 스티커 다운로드 내역, 
  밴드게임 계정이 모두 사라지고, 애드포스트 미디어 등록이 해제되며 복구가 불가능합니다.
                            
- 참여 중인 모든 밴드와 페이지에서 탈퇴됩니다. 밴드 서비스 내에서 작성한 콘텐츠를 
  삭제하거나 수정할 수 없으니, 원하시면 계정 삭제 전에 지우거나 수정하시기 바랍니다.
                            
- 밴드 파트너센터를 이용중인 경우, 밴드 계정 삭제 시 밴드 파트너센터에서도 탈퇴가 진행됩니다.
                            
* 가입한 밴드 중 하나만 탈퇴하고 싶다면?
  탈퇴하고 싶은 밴드에 들어가서 [밴드 탈퇴하기]를 선택하세요.
                        </pre>
                    </div>
                    
                    <div class="secession-agree">
                        <input type="checkbox" name="agree" id="agree">
                        <label for="agree">위 약관에 동의합니다.</label>
                    </div>
                    
                    <div class="myPage-row secession-pw">
                        <label>비밀번호</label>
                        <input type="password" id="memberPw" name="memberPw" maxlength="20">
                        <button class="secession-submit">탈퇴</button>
                    </div>

                </form>
            </div>
        </main>
    </section>

    <c:if test="${!empty message}">
        <script>
            alert("${message}");
        </script>

        <c:remove var="message"/>
    </c:if>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="/resources/js/member/mainPage.js"></script>
    <script src="/resources/js/myPage/myPage.js"></script>

</body>
</html>