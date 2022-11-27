const reportConfirm = document.querySelector(".report-confirm");

(function hidden (){
    reportConfirm.style.display="none";
})()


// 사유 버튼을 누르면
const reasonBtn = document.getElementsByClassName("reasonBtn")

for(let item of reasonBtn){
    item.addEventListener("click", () => {
        const reasonCode = item.getAttribute("name");
        reportConfirm.style.display="block";

        // 주소 만들기
        const pathName = location.pathname;
        const queryString = "/" + reasonCode;
        const url =  pathName + queryString;

        const reportFrm = document.getElementById("reportFrm");
        reportFrm.setAttribute("action", url)

    })
}
