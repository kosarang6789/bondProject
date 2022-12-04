
// 본드 가입하기 모달창
const bJModal = document.querySelector(".bJModal");

const joinBtn = document.querySelector(".write-button");
joinBtn.addEventListener("click", ()=>{
    bJModal.style.display = "flex";
});
const pp = document.querySelector(".empty");
pp.addEventListener("click", ()=>{
    bJModal.style.display = "flex";
});


const joinModalX = document.querySelector(".joinModalX");
const joinNoBtn = document.getElementById("joinNoBtn");
joinModalX.addEventListener("click", ()=>{
    bJModal.style.display = "none";
});
joinNoBtn.addEventListener("click", ()=>{
    bJModal.style.display = "none";
});


// let joinGroupNo = bJModal.getAttribute("id");
// const joinYesBtn = document.getElementById("joinYesBtn");
// joinYesBtn.addEventListener("click", ()=>{
//     $.ajax({
//         url : "/bond/"+joinGroupNo+"/join",
//         success : ()=>
//     })
// })

