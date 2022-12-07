<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글쓰기</title>
    <link rel="stylesheet" href="/resources/css/post/openYesPostSelect.css">
    <script src="https://kit.fontawesome.com/785870d879.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>    

</head>

<body>
    <main>
        <section id="postSelect-section">
        
            <!-- 작성자 정보 -->
            <div class="postMemberAll">
                <!-- 작성자 사진 -->
                <div class="postMember-img">
                    <img src="" class="memberImage" name="profile-img" id="profile-img">
                </div>
                <!-- 작성자 이름, 게시일, 조회수 -->
                <div class="postMember">
                    <div class="postMember-name" name="member" id="memberName"></div>
                    <div class="postDate-read">
                        <span class="postDate" name="post" id="postDate"></span>
                        <span class="read"  name="post" id="postView"> | 
                            <span id="viewCount"></span>
                        읽음</span>
                    </div>
                </div>
                <!-- 더보기 -->
                <div class="moreView" id="postmoreView">
                    <label for="post-moreView-icon" name="moreView" >
                        <i class="fa-solid fa-ellipsis-vertical"></i>
                    </label>
                    <div class="moreView-menu">
                    </div>
                </div>
            </div>

            <!-- 게시글 내용 -->
            <div class="post-content" name="post">
                <pre id="postContent"></pre>
            </div>

            <!-- 댓글, 좋아요 수 -->
            <div class="countLR">
                <span>댓글
                    <span id="commentCount"></span>
                </span>
                <span>좋아요
                    <span id="likeCount"></span>
                </span>
            </div>
            
            <!-- 좋아요, 댓글쓰기 클릭 -->
            <div class="like-replyBtn">
                <div id="likeBtn">
                    <span><i class="fa-regular fa-thumbs-up"></i></span>
                    <span>좋아요</span>
                </div>
            </div>
            
            <!-- 댓글조회 -->
            <ul id="replyList">
            </ul>
        </section>
    </main>

    <script src="/resources/js/post/postSelect.js"></script>
</body>

</html>