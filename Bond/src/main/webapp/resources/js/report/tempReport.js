console.log("tempReport ready")

// 신고 버튼
const reportBtn = document.getElementById("reportBtn");

// 신고 버튼 클릭 시 팝업창
reportBtn.addEventListener("click", () => {
    const target = document.getElementById("target").value;
    const input = document.getElementById("input").value;

    console.log(target);
    console.log(input);

    const url = "/admin/report/" + target + "/" + input; 
    open(url, "신고하기", "width=500px, height=600px")
})