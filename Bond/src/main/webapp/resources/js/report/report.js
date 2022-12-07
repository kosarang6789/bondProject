const modal = document.querySelector(".modal");

// modal창 숨기기(즉시 실행 함수)
(function hiddenModal (){
    modal.style.display="none";
})()

// 사유 버튼을 누르면
const reasonBtn = document.getElementsByClassName("reasonBtn");

for(let item of reasonBtn){
    item.addEventListener("click", () => {
        const reasonCode = item.getAttribute("name");
        modal.style.display="block";

        // 주소 만들기
        const pathName = location.pathname;
        const queryString = "/" + reasonCode;
        const url =  pathName + queryString + "/report";

        const reportFrm = document.getElementById("reportFrm");
        reportFrm.setAttribute("action", url)

    })
}

// 취소 버튼을 누르면
const cancelBtn = document.getElementById("cancelBtn");

cancelBtn.addEventListener("click", () => {
    modal.style.display="none";
})

