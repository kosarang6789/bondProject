// 검색 버튼
const selectBtn = document.getElementById("selectBtn");

// 목록 영역
const listBody = document.querySelector(".list-body");

// 페이지 묶음 영역
const contentFooter = document.querySelector(".content-footer");

// 한 페이지에 출력할 개수(기본 10)
const count = document.getElementById("count");

// 화면 이동 시 ajax 1회 실행해서 전체 목록 출력
(() => {
    ajax("", 1, 10)
})()

// 버튼에 목록 검색 이벤트 추가
selectBtn.addEventListener("click", () => {
    const keyword = document.getElementById("keyword");
    const opt = document.getElementById("opt");
    const count = document.getElementById("count");
    
    // 검색어가 없는 경우
    if(keyword.value.trim().length == 0) {
        alert("검색어를 입력해주세요.");
        keyword.focus();

    } else { // 검색어가 있는 경우

        // ajax 함수 수행 플래그
        let flag = 1;
        
        // 숫자 정규표현식 검사
        if(opt == 0) {
            regEx = /^\d+$/;
            if(regEx.test(keyword)) {
                flag == 0;
            }
        }
        
        // ajax 함수 실행
        if(flag == 1) {
            ajax(keyword.value, opt.value, count.value);
        } else {
            alert("숫자만 입력해주세요.")
            keyword.focus();
        }
    }

})

// ajax 실행 함수
function ajax(keywordValue, optValue, countValue, cp){

    // 내용 비움
    listBody.innerHTML = "";
    contentFooter.innerHTML = "";

    // cp가 없는 경우 cp==1
    if(cp==null) {
        cp=1;
    }
    
    // ajax
    $.ajax({
        url : "/admin/group/list?cp=" + cp, // 요청 주소
        data : {"keyword": keywordValue, "opt": optValue, "count":countValue}, // 파라미터
        type : "POST",
        dataType : "JSON",

        success : (map) => {

            if(map.groupList.length == 0) { // 검색 결과가 없으면
                // 검색 결과 없음 상자
                const emptyBox = document.createElement("div");
                emptyBox.classList.add("emptyBox");

                // 검색 결과 없음 이미지
                const emptyImage = document.createElement("img");
                emptyImage.classList.add("emptyImage");
                emptyImage.setAttribute("src", "/resources/images/admin/empty-box.png");

                // 검색 결과 없음 멘트
                const emptyMessage = document.createElement("div");
                emptyMessage.classList.add("emptyMessage");
                emptyMessage.innerText = "검색 결과가 없습니다...";

                // 박스에 담아서
                emptyBox.append(emptyImage, emptyMessage);

                // 본문에 추가
                listBody.append(emptyBox);

            } else { // 검색 결과가 있으면
                for(let item of map.groupList) {

                    // 폼
                    const frm = document.createElement("form");
                    frm.classList.add("list-frm");
    
                    const thisPath = "/admin/group/" + item.groupNo;
    
                    frm.setAttribute("action", thisPath);
                    frm.setAttribute("method", "GET");
                    frm.setAttribute("name", "groupInfo");
                    
                    // 버튼
                    const bt = document.createElement("button");
                    bt.classList.add("list-btn");
        
                    // 번호
                    const row1 = document.createElement("span");
                    row1.classList.add("groupNo");
                    row1.setAttribute("name","groupNo");
                    row1.innerText = item.groupNo;
        
                    // 주제코드
                    const row2 = document.createElement("span");
                    row2.classList.add("topicCode");
                    row2.innerText = item.topicName;
        
                    // 이름
                    const row3 = document.createElement("span");
                    row3.classList.add("groupName");
                    row3.innerText = item.groupName;
        
                    // 모임 생성일
                    const row4 = document.createElement("span");
                    row4.classList.add("groupDate");
                    row4.innerText = item.groupDate;
        
                    // 공개 여부
                    const row5 = document.createElement("span");
                    row5.classList.add("openYN");
                    row5.innerText = item.openYN;
    
                    // 모임 상태
                    const row6 = document.createElement("span");
                    row6.classList.add("groupStatus");
                    row6.innerText = item.groupStatus;
                    
                    // 버튼에 번호 ~ 가입 상태 추가
                    bt.append(row1, row2, row3, row4, row5, row6);
        
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
    
                // firstPage 전체 페이지 묶음의 맨 앞 페이지(1페이지)
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
                
            }
        },
        error : () => {
            console.log("게시글 리스트 검색 실패")
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


	
	
	