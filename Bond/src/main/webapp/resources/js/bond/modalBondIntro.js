
// 본드 정보 보기 모달창

const modalBondIntro = document.querySelector(".modalBondIntro");

if(document.querySelector(".more-link modalInfo") != null){
    const viewIntroBtn = document.querySelector(".more-link modalInfo");
    viewIntroBtn.addEventListener("click", ()=>{
        modalBondIntro.classList.add("show");
        modalBondIntro.classList.remove("hidden");
    });
};

if(document.querySelector(".modalInfo") != null){
    const viewIntroBtn = document.querySelector(".modalInfo");
    viewIntroBtn.addEventListener("click", ()=>{
        modalBondIntro.classList.add("show");
        modalBondIntro.classList.remove("hidden");
    });
};


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




