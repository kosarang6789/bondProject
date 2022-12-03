<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글쓰기</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/post/postWrite.css">
    <script src="https://kit.fontawesome.com/785870d879.js" crossorigin="anonymous"></script>
    <script src="/resources/js/summernote/summernote-lite.js"></script>
    <script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>

    <link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">

</head>

<body>
    <main>
        <section class="postWrite-section">
            <form action="/bond/${groupNo}/postWrite" id="postWriteFrm" method="POST"
            enctype="multipart/form-data">
                <section class="postWrite-title">
                    <h3 class="title-area">글쓰기</h3>
                </section>
                
                <section class="postWrite">

                    <!-- 게시글 작성 -->
                    <div class="postWrite-content">
                        <textarea name="postWriteContent" id="summernote" ></textarea>
                    </div>

                    <!-- 툴바 -->
                    <%-- <div class="postWrite-toolbar">
                        <ul class="toolbarList">
                            <li class="toolbarListItem">
                                <input type="file" id="photoInput">
                                <i class="fa-regular fa-image"></i><!-- 이미지첨부 -->
                            </li>
                            <li class="toolbarListItem">
                                <i class="fa-solid fa-check-to-slot"></i><!-- 투표 -->
                            </li>
                            <li class="toolbarListItem">
                                <i class="fa-solid fa-divide"></i><!-- N빵 -->
                            </li>
                            <li class="toolbarListItem">
                                <i class="fa-regular fa-calendar"></i><!-- 일정 -->
                            </li>
                        </ul>
                    </div> --%>
                </section>
                
                <div class="postWrite-bottom">
                    <div class="setup-btn"> <label for="reply-yn"><i class="fa-solid fa-toggle-off"></i><!-- 설정 --></label>
                        <input type="checkbox" class="write-setup" id="reply-yn" name="replayYN">댓글 사용</input>
                    </div>
                    <div class="submit-btn">
                        <button type="button" onclick="submitContent()" class="postWrite-btn">
                            <p>게시</p>
                        </button>
                    </div>
                </div>
            </form>
        </section>
    </main>

    <script>
        const groupNo = "${groupNo}"
        
    </script>
    <script src="/resources/js/post/postWrite.js"></script>
    
    
</body>

</html>