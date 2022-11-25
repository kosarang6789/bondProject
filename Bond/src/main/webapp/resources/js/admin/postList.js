const selectBtn = document.getElementById("selectBtn");
const contentBody = document.querySelector(".content-body");
const listBody = document.querySelector(".list-body");
const contentFooter = document.querySelector(".content-footer");
const count = document.getElementById("count");

// 화면 이동 시 즉시 실행 함수
(() => {
    ajax("", 2, 10)
})()

// 목록 검색
selectBtn.addEventListener("click", () => {

    const keyword = document.getElementById("keyword");
    const opt = document.getElementById("opt");
    const count = document.getElementById("count");
    
    regEx = /^\d+$/;

    let fL = 1;

    if(fL == 1) {
        ajax(keyword.value, opt.value, count.value);

    } else {
        alert("숫자만 입력해주세요.")
        opt.focus();
    }
})

// ajax 실행 함수
function ajax(keywordValue, optValue, countValue, cp){

    listBody.innerHTML = "";
    contentFooter.innerHTML = "";

    if(cp==null) {
        cp=1;
    }
    
    $.ajax({
        url : "/admin/post/list?cp=" + cp, // 요청 주소
        data : {"keyword": keywordValue, "opt": optValue, "count":countValue}, // 파라미터
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

            // 페이지용 변수 선언
            const startPage = map.pagination.startPage; // 현재 페이지 묶음의 맨 앞 번호
            const currentPage = map.pagination.currentPage; // 현재 페이지
            const endPage = map.pagination.endPage; // 현재 페이지 묶음의 마지막 번호

            const prevPageValue = map.pagination.prevPage; // 이전 페이지 묶음의 맨 뒤 페이지 번호
            const nextPageValue = map.pagination.nextPage; // 다음 페이지 묶음의 맨 앞 페이지 번호
            const maxPageValue = map.pagination.maxPage; // 전체 페이지 묶음의 마지막 페이지 번호

            // firstPage
            const firstPage = document.createElement("button");
            pageMake(firstPage, "&lt;&lt;", 1);

            // prevPage
            const prevPage = document.createElement("button");
            pageMake(prevPage, "&lt;", prevPageValue);

            // startPage, currentPage, endPage
            for(let i=startPage; i<=endPage; i++) {
                const pageNum = document.createElement("button");
                pageNum.innerText = i;
                
                if(i==currentPage) {
                    pageNum.classList.add("currentPage");
                } else {
                    pageNum.classList.add("page");
                    pageNum.setAttribute("value", i);
                }
                contentFooter.append(pageNum);
            }

            // nextPage
            const nextPage = document.createElement("button");
            pageMake(nextPage, "&gt;", nextPageValue);

            // maxPage
            const maxPage = document.createElement("button");
            pageMake(maxPage, "&gt;&gt;", maxPageValue);

            // page class 추가
            const page = document.getElementsByClassName("page");

            // 페이지에 페이지 이동 이벤트 추가
            for(let i=0; i<page.length; i++) {
                page[i].addEventListener("click", () => {
                    const cp = page[i].value;
                    ajax(keywordValue, optValue, countValue, cp);
                })
            }
        },

        error : () => {
            console.log("회원 리스트 검색 실패")
        }
    });

}

// firstPage, prevPage, nextPage, maxPage 생성 함수
function pageMake(pageName, pageText, pageValue){
    pageName.classList.add("page");
    pageName.innerHTML = pageText;
    pageName.setAttribute("value", pageValue);
    contentFooter.append(pageName);
}


	
	
	