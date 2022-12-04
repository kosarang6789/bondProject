
// 본드 가입하기 모달창

const joSeModal = document.querySelector(".joSeModal");

const joinBtn = document.querySelector(".write-button");
joinBtn.addEventListener("click", ()=>{
    joSeModal.style.display = "flex";
});
const pp = document.querySelector(".empty");
pp.addEventListener("click", ()=>{
    joSeModal.style.display = "flex";
});


const joSeModalX = document.querySelector(".joSeModalX");
const joSeNoBtn = document.getElementById("joSeNoBtn");
joSeModalX.addEventListener("click", ()=>{
    joSeModal.style.display = "none";
});
joSeNoBtn.addEventListener("click", ()=>{
    joSeModal.style.display = "none";
});
