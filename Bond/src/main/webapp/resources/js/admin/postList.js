const selectBtn = document.getElementById("selectBtn");
const contentBody = document.querySelector(".content-body");
const listBody = document.querySelector(".list-body");
const contentFooter = document.querySelector(".content-footer");



// 화면 이동 시 즉시 실행 함수
(() => {
    ajax("", 2)
})()

// 목록 검색
selectBtn.addEventListener("click", () => {

    const keyword = document.getElementById("keyword");
    const opt = document.getElementById("opt");
    
    regEx = /^\d+$/;

    let fL = 1;

    if(fL == 1) {
        listBody.innerHTML = "";

        ajax(keyword.value, opt.value);

    } else {
        alert("숫자만 입력해주세요.")
        opt.focus();
    }
})

// ajax 실행 함수
function ajax(keywordValue, optValue, cp){
    if(cp==null) {
        cp=1;
    }
    
    $.ajax({
        url : "/admin/post/list?cp=" + cp, // 요청 주소
        data : {"keyword": keywordValue, "opt": optValue}, // 파라미터
        type : "GET",
        dataType : "JSON",

        success : (map) => {


            for(let item of map.postList) {

                // 폼
                const frm = document.createElement("form");
                frm.classList.add("list-frm");

                const thisPath = "/admin/post/" + item.postNo;
                frm.setAttribute("action", thisPath);
                frm.setAttribute("method", "GET");
                frm.setAttribute("name", "postInfo");
                
                // 버튼
                const bt = document.createElement("button");
                bt.classList.add("list-btn");
    
                // 번호
                const row1 = document.createElement("span");
                row1.classList.add("postNo");
                row1.setAttribute("name","postNo");
                row1.innerText = item.postNo;
    
                // 회원 번호
                const row2 = document.createElement("span");
                row2.classList.add("memberNo");
                row2.innerText = item.memberName;
    
                // 모임 번호
                const row3 = document.createElement("span");
                row3.classList.add("groupNo");
                row3.innerText = item.groupName;
    
                // 글 내용
                const row4 = document.createElement("span");
                row4.classList.add("postContent");
                row4.innerText = item.postContent;
    
                // 작성일
                const row5 = document.createElement("span");
                row5.classList.add("postDate");
                row5.innerText = item.postDate;

                // 상태
                const row6 = document.createElement("span");
                row6.classList.add("postDelYN");
                row6.innerText = item.postDelYN;
    
                // 버튼에 번호 ~ 가입 상태 추가
                bt.append(row1, row2, row3, row4, row5);
    
                // 폼에 버튼 추가
                frm.append(bt);
    
                // content-body에 폼 추가
                listBody.append(frm);
            }

            /* 페이지 묶음 */

            // 이전 페이지 묶음의 맨 앞 페이지 번호
            const prevPage = document.createElement("a");
            prevPage.innerHTML = "&lt;";
            prevPage.setAttribute("href", "/admin/postList?cp=" + map.pagination.prevPage)
            contentFooter.append(prevPage);

            // 페이지 묶음 목록
            const startPage = map.pagination.startPage; // 현재 페이지 묶음의 맨 앞 번호
            const currentPage = map.pagination.currentPage; // 현재 페이지
            const endPage = map.pagination.endPage; // 현재 페이지 묶음의 마지막 번호

            for(let i=startPage; i<=endPage; i++) {
                const pageNum = document.createElement("a");
                pageNum.innerText = i;
                pageNum.classList.add("page");
                
                if(i==currentPage) {
                    pageNum.classList.add("currentPage");
                } else {
                    // pageNum.setAttribute("href", "/admin/postList?cp=" + i);
                }
                contentFooter.append(pageNum);
                
            }
            // 이후 페이지 묶음의 맨 뒤 페이지 번호
            const nextPage = document.createElement("a");
            nextPage.innerHTML = "&gt";
            nextPage.setAttribute("href", "/admin/postList?cp=" + map.pagination.nextPage)
            contentFooter.append(nextPage);

            // 마지막 페이지
            const maxPage = document.createElement("a");
            maxPage.innerText = map.pagination.maxPage;
            contentFooter.append(maxPage);

            // 페이지 이동
            const page = document.getElementsByClassName("page");

            for(let i=0; i<page.length; i++) {
                page[i].addEventListener("click", () => {
                    const cp = page[i].innerText;
                    listBody.innerHTML = "";
                    contentFooter.innerHTML = "";
                    ajax(keywordValue, optValue, cp);
                })
            }
        },

        error : () => {
            console.log("회원 리스트 검색 실패")
        }
    });

}



	
	
	