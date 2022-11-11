// 스크롤 막는 방법
// 1. overflow : hidden(스크롤 가능), clip(코드 입력으로 스크롤 불가)
// 2. position : fixed <- 배치가 틀어질 수 있음
// 3. js를 이용해서 스크롤바 끄기

const modalDim = document.getElementById("modalDim");
const modalBox = document.getElementById("modalBox");
const body = document.querySelector("body");
const modal = document.getElementById("modal");
(() => {modalDim.style.display="none"})()

// 화면 보이기
const openModal = document.getElementById("openModal");
openModal.addEventListener("click", () => {
    modalDim.style.display="block";
    modalBox.style.top=scrollY + "px";
    body.style.overflow="hidden";
})

// 화면 가리기
const closeModal = document.getElementById("closeModal");

closeModal.addEventListener("click", () => {
    modalDim.style.display="none";
    body.style.overflow="visible";
})

// 외부영역 터치 시 꺼짐
modalDim.addEventListener("click", () => {
	modalDim.style.display="none";
    body.style.overflow="visible";	
})