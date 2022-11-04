<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index Page</title>
    <link rel="stylesheet" href="/resources/css/common/index-page.css">
</head>
<body>
	<header>
		<section>
			<!-- 클릭 시 메인으로 이동하는 로고  -->
			<a href="/"> <img src="/resources/images/common/home-logo.png"
				id="home-logo">
			</a>
		</section>
		<section class="top-menu">
			<ul>
				<li><a href="#" class="signUp">회원가입</a></li>
				<li><a href="/login" class="login">로그인</a></li>
			</ul>
		</section>
	</header>
    
    <main>
        <section class="index-menu">
            <div class="index-menu-area">
                <div class="index-logo-area">
                    <img src="/resources/images/common/home-logo-white.png" id="index-logo">
                </div>
                <div id="login-title">
                    <h2>취미가 쉬워진다! <br> 끼리끼리 본드</h2>
                    <p>당신의 취미도 BOND로 시작하세요.</p>
                    <div class="login-button">
                        <a href="/login" id="login">로그인</a>
                        <a href="#" id="signUp">회원가입</a>
                    </div>
                </div>
            </div>
        </section>

        <section class="introduction">

            <div class="images-section">
                <h3 id="title">모임을 위한 공간, 본드</h3>
                <p id="explanation">밴드는 그룹 멤버와 함께 하는 공간입니다. <br>
                동호회, 스터디, 주제별 모임을 밴드로 시작하세요.</p>
            </div>
            
            <ul class="intro-list">
                <li>
                    <img src="/resources/images/common/intro1.jpg">
                    <div class="list-text">
                        <h3>어떤 모임이라도!</h3>
                        <p>친구, 가족, 동료 등 함께 하고 싶은 사람과<br>
                            우리만의 공간을 만들어보세요.</p>
                    </div>
                </li>
                <li>
                    <img src="/resources/images/common/intro2.jpg">
                    <div class="list-text">
                        <h3>모임에 딱 맞는 기능들</h3>
                        <p>투표로 의견을 모으고, 함께 일정을 공유하며<br>
                            게시판과 앨범에는 추억을 쌓아보세요.</p>
                    </div>
                </li>
                <li>
                    <img src="/resources/images/common/intro3.jpg">
                    <div class="list-text">
                        <h3>내가 원하는 모임 찾기</h3>
                        <p>취미, 스포츠, 또래 모임 등<br>
                            나와 같은 관심사 밴드를 찾을 수 있어요.</p>
                    </div>
                </li>
            </ul>    
        </section>
        
          <h3>session scope 확인</h3>
  이름 : "${loginMember.memberName}";
  생일 : "${loginMember.memberBirth}";
  전화번호 : "${loginMember.memberTel}";

    

    </main>
    
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>