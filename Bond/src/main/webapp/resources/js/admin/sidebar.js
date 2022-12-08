const dropDown = document.querySelectorAll(".drop-down");

for(let drop of dropDown){
    const topMenu = drop.querySelector(".top-menu");
    const subMenu = drop.getElementsByClassName("sub-menu");

    drop.addEventListener("mouseenter", () => {
        drop.classList.add("drop-focus")
        topMenu.classList.add("selected")
        for(let sub of subMenu){
            sub.classList.remove("hide");
            sub.classList.add("opened");

            sub.addEventListener("mouseenter", () => {
                sub.classList.add("selected")
            })

            sub.addEventListener("mouseleave", () => {
                sub.classList.remove("selected")
            })
        }
    })
    drop.addEventListener("mouseleave", () => {
        drop.classList.remove("drop-focus")
        topMenu.classList.remove("selected");
        for(let sub of subMenu){
            sub.classList.remove("opened");
            sub.classList.add("hide");
        }
    })
}


// 신고 개수 ajax
function findWaitingReports (){
    $.ajax({
        url: "/admin/report/find/waiting",
        type : "POST",
        dataType : "JSON",
        success : (waitingReports) => {
            const alarmDot = document.getElementById("alarmDot");
            if(waitingReports > 0) {
                alarmDot.style.display="block";
            } else {
                alarmDot.style.display="none";
            }
        },
        error : () => {
            console.log("미처리 신고 여부 조회 실패")
        }

    })
}

// 즉시 실행 함수 존
(() => {
 findWaitingReports();
})()