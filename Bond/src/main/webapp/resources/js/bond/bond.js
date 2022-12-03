// 양 옆 고정 + 가운데만 스크롤 가능
const leftSide = document.getElementById("info-inner");
const center= document.getElementById("board-list");
const rightSide = document.getElementById("band-photo-area");

const centerWidth = center.offsetWidth;
const leftSideWidth = leftSide.offsetWidth;
const righthideWidth = rightSide.offsetWidth;

window.addEventListener("load", function () {
    leftSide.style.left = center.getBoundingClientRect().x - 18 - leftSideWidth + 'px';
    rightSide.style.left = center.getBoundingClientRect().x + centerWidth + 18 + 'px';
});

window.addEventListener("resize", function () {
    leftSide.style.left = center.getBoundingClientRect().x - 18 - leftSideWidth + 'px';
    rightSide.style.left = center.getBoundingClientRect().x + centerWidth + 18 + 'px';
});

window.addEventListener("scroll", function () {

    if (window.scrollX == 0) {
        leftSide.style.left = center.getBoundingClientRect().x - 18 - leftSideWidth + 'px';
        rightSide.style.left = center.getBoundingClientRect().x + centerWidth + 18 + 'px';
    }
    else if (window.scrollX > 0) {
        leftSide.style.left = window.scrollX * -1 + "px";
        rightSide.style.left = center.getBoundingClientRect().x + centerWidth + 18 + 'px';
    }
});


// 프로필 드롭다운
const myDropdown = document.getElementById("myDropdown");
const icon = document.getElementById("triangle-icon");

function dropDown(){
    myDropdown.classList.toggle("show1");
    icon.classList.toggle("rotate");
};

window.onclick=function(e){
    if(!e.target.matches(".dropbtn, .dropbtn *")){

        if(myDropdown.classList.contains("show1")){
            myDropdown.classList.remove("show1");
            icon.classList.remove("rotate");
        }   
    }
};

// 게시물 무한 스크롤
const option = {
    root: null,
    rootMargin: "0px 0px 0px 0px",
    thredhold: 1,
}

const observer = new IntersectionObserver(selectBoardScroll, option);
const target = document.getElementById("pageTarget");
observer.observe(target);

let flag = true;
function selectBoardScroll(){
    if(cp == 0 ){
        cp++;
    }else{
        if(flag){
            console.log(cp);
            $.ajax({
                url : "/bond/"+ groupNo,
                data : {"cp" : ++cp},
                type : "POST",
                dataType : "JSON",
                success : function(map){
                    if( map != null ){
                        console.log(map.postList);
                        const postWrap = document.querySelector(".post-wrap");
    
                        for(let post of map.postList){

                            const commentDiv = document.createElement("div");
                            commentDiv.classList.add("post-wrap");
                            
                            const contentCard = document.createElement("div");
                            contentCard.classList.add("content-card");
                            
                            // 1. post-list-view
                            const postListView = document.createElement("div");
                            postListView.classList.add("post-list-view");
                            
                            // 2. post-author-view (작성자 프로필, 정보)
                            const postAuthorView = document.createElement("div");
                            postAuthorView.classList.add("post-author-view");
                            
                            // 2-1) uprofile
                            const uprofile = document.createElement("div");
                            uprofile.classList.add("uprofile");
                            
                            // 프로필 이미지
                            const profileImage = document.createElement("img");
                            
                            if(post.memberImage!=null){
                                profileImage.setAttribute("src", post.memberImage);
                            } else {
                                profileImage.setAttribute("src", "/resources/images/member/profile/defaultProfile.png");
                            }
                            profileImage.classList.add("uprofile-inner");
                            
                            // 2-2) post-info
                            const postInfo = document.createElement("div");
                            postInfo.classList.add("post-info");
                            
                            // 작성자
                            const boardWriter = document.createElement("strong");
                            boardWriter.classList.add("post-info-name");
                            boardWriter.innerText = post.memberName;
                            
                            // 작성 날짜
                            const postListInfo = document.createElement("div");
                            postListInfo.classList.add("post-list-info");
                            
                            const boardDate = document.createElement("a");
                            boardDate.classList.add("post-info-date");
                            boardDate.innerText = post.postDate;
                            
                            postAuthorView.append(uprofile, postInfo);
                            uprofile.append(profileImage);
                            postInfo.append(boardWriter, postListInfo);
                            postListInfo.append(boardDate);


                            // 3. postBody
                            const postBody = document.createElement("div");
                            postBody.classList.add("post-body");
                            postBody.setAttribute("id", post.postNo);

                            postBody.addEventListener("click", ()=>{
                                const modal = document.getElementById("postSelect-modal");
                                modal.classList.toggle("show");
                                document.body.style.overflow = "hidden";
                                document.querySelector("#postSelect-view > main").scrollTop = 0;
                                selectPostDetail(postBody.getAttribute("id"));
                            });

                            const postText = document.createElement("div");
                            postText.classList.add("post-text");
                            
                            // 게시물 내용
                            const boardContent = document.createElement("p");
                            boardContent.classList.add("text-body");
                            boardContent.innerHTML = post.postContent;
                            
                            const moreLink = document.createElement("a");
                            moreLink.classList.add("more-link");
                            moreLink.innerText = "...더보기";
                            
                            postBody.append(postText);
                            postText.append(boardContent, moreLink);

                            
                            // 4. postCountView
                            const postCountView = document.createElement("div");
                            postCountView.classList.add("post-count-view");

                            // 4-1) postCount
                            const postCount = document.createElement("div");
                            postCount.classList.add("post-count");
                            
                            // 1) face-comment 좋아요
                            const faceComment = document.createElement("span");
                            faceComment.classList.add("face-comment");
                            
                            // (1) emotionView
                            const emotionView = document.createElement("button");
                            emotionView.classList.add("emotion-view");
                            
                            const emotionWrap = document.createElement("span");
                            emotionWrap.classList.add("emotion-wrap");
                            
                            const icon = document.createElement("span");
                            icon.classList.add("icon");
                            
                            const faceIcon = document.createElement("i");
                            faceIcon.classList.add("fa-regular", "fa-thumbs-up");
                            
                            const eCount = document.createElement("span");
                            eCount.classList.add("count", "eCount");
                            eCount.innerText = "  " + post.likeCount + "  ";
                            
                            // (2) comment
                            const comment = document.createElement("button");
                            comment.classList.add("comment");         
                            comment.innerText = " 댓글 ";
                            
                            const rCount = document.createElement("span");
                            rCount.classList.add("count", "rCount");
                            rCount.innerText = " " + post.replyCount + " ";
                            
                            // 2) shareRead 댓글
                            const shareRead = document.createElement("span");
                            shareRead.classList.add("share-read");
                            
                            const gSrOnly = document.createElement("span");
                            gSrOnly.classList.add("gSrOnly");
                            
                            const eyeIcon = document.createElement("i");
                            eyeIcon.classList.add("fa-solid", "fa-eye");
                            
                            const vCount = document.createElement("span");
                            vCount.classList.add("count","vCount");
                            vCount.innerText = " " + post.postView;
                            
                            postCountView.append(postCount);
                            postCount.append(faceComment, shareRead);

                            faceComment.append(emotionView, comment);
                            emotionView.append(emotionWrap, eCount);
                            emotionWrap.append(icon);
                            icon.append(faceIcon);
                            comment.append(rCount);

                            shareRead.append(gSrOnly, eyeIcon, vCount);

                            postWrap.append(contentCard);
                            contentCard.append(postListView);
                            postListView.append(postAuthorView, postBody, postCountView);
                            
                        }
                    } else{ // 실패
                        alert("게시물을 불러올 수 없습니다.");
                    }
                },
                error : function(req, status, error){
                    console.log("에러 발생");
                }
            });
            flag = false;

        }else{
            flag = true;
        }
    }
};


// 게시글 작성 모달

function modal(id) {
    var zIndex = 9999;
    var modal = document.getElementById(id);

    // 모달 div 뒤에 희끄무레한 레이어
    var bg = document.createElement('div');
    bg.setStyle({
        position: 'fixed',
        zIndex: zIndex,
        left: '0px',
        top: '0px',
        width: '100%',
        height: '100%',
        overflow: 'auto',
        // 레이어 색갈은 여기서 바꾸면 됨
        backgroundColor: 'rgba(0,0,0,0.4)'
    });
    document.body.append(bg);

    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    modal.querySelector('.modal-closeBtn').addEventListener('click', function() {
        bg.remove();
        modal.style.display = 'none';
        window.frames['postWrite-iframe'].contentWindow.location.reload();
    });

    modal.setStyle({
        position: 'fixed',
        display: 'block',
        // boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

        // 시꺼먼 레이어 보다 한칸 위에 보이기
        zIndex: zIndex + 1,

        // div center 정렬
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        msTransform: 'translate(-50%, -50%)',
        webkitTransform: 'translate(-50%, -50%)'
    });
};

// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
Element.prototype.setStyle = function(styles) {
    for (var k in styles) this.style[k] = styles[k];
    return this;
};

document.getElementById("write-button").addEventListener("click", function() {
    // 게시글 작성 모달창 띄우기
    modal('postWrite-modal');
});

document.getElementById("postWrite-btn").addEventListener("click", function() {
    // 게시글 작성 모달창 띄우기
    modal('postWrite-modal');
});


// 신고하기 버튼
const reportBtn = document.getElementById("reportBtn");

// 신고 버튼 클릭 시 팝업창
reportBtn.addEventListener("click", () => {
    const url = "/report/group/" + groupNo; 
    open(url, "신고하기", "width=500px, height=600px")
});


// 게시글 상세조회 모달
(()=>{
    const modal = document.getElementById("postSelect-modal");
    const closeBtn = document.querySelector(".sModal-closeBtn");
    const post = document.getElementsByClassName("post-body");
    let sh = window.scrollY;

    for(let p of post){
        p.addEventListener("click", ()=>{
            modal.classList.toggle("show");
            document.body.style.overflow = "hidden";
            document.querySelector("#postSelect-view > main").scrollTop = 0;
            selectPostDetail(p.getAttribute("id"));
        });
    }

    closeBtn.addEventListener("click",()=>{
        // modal.classList.toggle("show");
        window.location.reload(true);
        window.scrollY = sh;
        // document.body.style.overflow = "auto";
        // history.scrollRestoration = "auto";
    });
})();

let viewCount = document.getElementById("viewCount");
let commentCount  = document.getElementById("commentCount");
let likeCount = document.getElementById("likeCount");
let postContent = document.getElementById("postContent");
let memberName = document.getElementById("memberName");
let postDate = document.getElementById("postDate");
let profileImg = document.getElementById("profile-img");
const likeBtn = document.getElementById("likeBtn");

const selectPostDetail = (postNo)=>{
    $.ajax({
        url : "/bond/" + groupNo + "/" + postNo,
        type : "GET",
        dataType : "JSON",
        success : (post)=>{
            console.log("성공");
            console.log(post.postView);
            viewCount.innerText = post.postView;
            commentCount.innerText = post.replyCount;
            likeCount.innerText = post.likeCount;
            postContent.innerHTML = post.postContent;
            memberName.innerText = post.memberName;
            postDate.innerText = post.postDate;
            if(post.memberImage !=null) {
                profileImg.setAttribute("src", post.memberImage);
            }else {
                profileImg.setAttribute("src", "/resources/images/member/profile/defaultProfile.png");
            };
            if(post.likeCheck=="on"){
                likeBtn.classList.add('checkLikeBtn');
            }
        },
        error:()=>{console.log("실패");}
    });

    likeBtn.addEventListener("click", ()=>{
        let likeCount = document.getElementById("likeCount");

        if(likeBtn.classList.contains('checkLikeBtn')){
            // 좋아요 눌린 경우
            $.ajax({
                url: "/postLikeDown",
                data: {"postNo" : postNo, "memberNo" : memberNo},
                type: "GET",
                success: (result)=>{
                    if(result>0){
                        likeBtn.classList.remove("checkLikeBtn");
                        likeCount.innerText = Number(likeCount.innerText)-1;
                    } else{
                        console.log("감소 실패");
                    }
                },
                error: ()=>{console.log("감소 에러");}
            })
        } else {
            // 좋아요 안눌린 경우
            $.ajax({
                url: "/postLikeUp",
                data: {"postNo" : postNo, "memberNo" : memberNo},
                type: "GET",
                success: (result)=>{
                    if(result>0){
                        likeBtn.classList.add("checkLikeBtn");
                        likeCount.innerText = Number(likeCount.innerText)+1;
                    } else{
                        console.log("증가 실패");
                    }
                },
                error: ()=>{console.log("증가 에러");}
            })
    
    
        }
    });
};

// 댓글쓰기 창 늘리기
const autoResizeTextarea = () => {
    let textarea = document.getElementById("replyWrite-Content")

    textarea.style.height = 'auto';
    let height = textarea.scrollHeight; // 높이
    textarea.style.height = `${height+5}px`;
    
};
