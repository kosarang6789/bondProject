// 본드 탈퇴 모달

// 본드 탈퇴하기 모달창

const joSeModal = document.querySelector(".joSeModal");

const seceBtn = document.querySelector(".leave-band");

seceBtn.addEventListener("click", ()=>{
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


const joSeYesBtn = document.getElementById("joSeYesBtn");
joSeYesBtn.addEventListener("click", (e)=>{
    if(confirm("정말 탈퇴 하시겠습니까?")){
        alert("탈퇴되었습니다.");
    }else{
        e.preventDefault();
        alert("탈퇴 취소 되었습니다");
    }
    // confirm("정말 탈퇴 하시겠습니까?");
});