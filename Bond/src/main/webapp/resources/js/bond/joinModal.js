
// 본드 가입하기 모달창

const joSeModal = document.querySelector(".joSeModal");

const joinBtn = document.querySelector(".write-button");
joinBtn.addEventListener("click", ()=>{
    joSeModal.classList.add("show");
    joSeModal.classList.remove("hidden");
});

const joSeModalX = document.querySelector(".joSeModalX");
const joSeNoBtn = document.getElementById("joSeNoBtn");
joSeModalX.addEventListener("click", ()=>{
    joSeModal.classList.add("hidden");
    joSeModal.classList.remove("show");
});
joSeNoBtn.addEventListener("click", ()=>{
    joSeModal.classList.add("hidden");
    joSeModal.classList.remove("show");
});


window.addEventListener("click",e=>{ 
    let ev = e.target; 

    if(ev.classList.contains("show")){
        joSeModal.classList.add("hidden");
        joSeModal.classList.remove("show");
    }
});


// openNo에만 있는 empty 버튼
if(document.querySelector(".empty") != null){
    document.querySelector(".empty").addEventListener("click", ()=>{
        joSeModal.classList.add("show");
        joSeModal.classList.remove("hidden");
    })
};



