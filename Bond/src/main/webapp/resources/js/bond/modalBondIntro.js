
// 본드 가입하기 모달창

const modalBondIntro = document.querySelector(".modalBondIntro");

const viewIntroBtn = document.querySelector(".sidebar-under-icon");
viewIntroBtn.addEventListener("click", ()=>{
    modalBondIntro.classList.add("show");
    modalBondIntro.classList.remove("hidden");
});

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




