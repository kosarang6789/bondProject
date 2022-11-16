const selectBtn = document.getElementById("selectBtn");
const keyword = document.getElementById("keyword");
const contentBody = document.querySelector(".content-body");
// 목록 검색
selectBtn.addEventListener("click", () => {

    $.ajax({
        url : "/selectMemberList", // 요청 주소
        data : {"keyword": keyword.value}, // 파라미터
        type : "POST",
        dataType : "JSON",

        success : (memberList) => {
            for(let item of memberList) {
                // 폼
                const frm = document.createElement("form");
                frm.classList.add("list-frm");
                frm.setAttribute("action","/admin/selectMemberDetail");
                frm.setAttribute("method", "POST");
                frm.setAttribute("name", "memberInfo");
                // 버튼
                const bt = document.createElement("button");
                bt.classList.add("list-btn");
    
                // 번호
                const row1 = document.createElement("span");
                row1.classList.add("memberNo");
                row1.setAttribute("name","memberNo");
                row1.innerText = item.memberNo;
    
                // 이메일
                const row2 = document.createElement("span");
                row2.classList.add("memberEmail");
                row2.innerText = item.memberEmail;
    
                // 이름
                const row3 = document.createElement("span");
                row3.classList.add("memberName");
                row3.innerText = item.memberName;
    
                // 가입일
                const row4 = document.createElement("span");
                row4.classList.add("signUpDate");
                row4.innerText = item.signUpDate;
    
                // 가입 상태
                const row5 = document.createElement("span");
                row5.classList.add("memberStatus");
                row5.innerText = item.memberStatus;
    
                // 버튼에 번호 ~ 가입 상태 추가
                bt.append(row1, row2, row3, row4, row5);
    
                // 폼에 버튼 추가
                frm.append(bt);
    
                // content-body에 폼 추가
                contentBody.append(frm);
            }

        },
        error : () => {
            console.log("회원 리스트 검색 실패")
        }
    });



})
