
// 본드 정보 보기 모달창

const modalBondIntro = document.querySelector(".modalBondIntro");


// 멤버리스트 - 밴드 정보 보기
// if(document.querySelector(".band-info") != null){
//     const viewIntroBtn = document.querySelector(".band-info");
//     viewIntroBtn.addEventListener("click", ()=>{
//         modalBondIntro.classList.add("show");
//         modalBondIntro.classList.remove("hidden");
//     });
// };

if(document.querySelector(".band-info") != null){
    const viewIntroBtn = document.querySelector(".band-info");
    viewIntroBtn.addEventListener("click", ()=>{
        modalBondIntro.classList.add("show");
        modalBondIntro.classList.remove("hidden");
    });
}

// openYes에서 밴드 정보 보기
if(document.querySelector(".band-setting-section2") != null){
    const viewIntroBtn = document.querySelector(".band-setting-section2");
    viewIntroBtn.addEventListener("click", ()=>{
        modalBondIntro.classList.add("show");
        modalBondIntro.classList.remove("hidden");
    });
}


const modalBondX = document.querySelector(".modalBondX");
modalBondX.addEventListener("click", ()=>{
    modalBondIntro.classList.add("hidden");
    modalBondIntro.classList.remove("show");
});

window.addEventListener("click",e=>{ 
    let ev = e.target; 

    if(ev.classList.contains("show")){
        modalBondIntro.classList.add("hidden");
        modalBondIntro.classList.remove("show");
    }
});




