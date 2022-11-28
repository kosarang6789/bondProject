
const groupName = document.getElementById("groupName");
const groupComment = document.getElementById("groupComment");

const groupImg = document.getElementById("group-img");
const inputImg = document.getElementById("inputImg");
const deleteImg = document.getElementById("deleteImg");

let initCheck;
let deleteCheck=-1; 

const originalImg = groupImg.getAttribute("src");
const defaultImg = "/resources/images/bond/profile/no-profile.png";

const checkObj = {
    "groupName" : true,
    "groupComment" : true
};

groupName.addEventListener("input", ()=>{
    if(groupName.value.trim().length == 0){
        alert("밴드 이름을 작성해주세요.");
        groupName.focus();
        checkObj.groupName = false;
    }
});

groupComment.addEventListener("input", ()=>{
    if(groupComment.value.trim().length == 0){
        alert("밴드 소개를 작성해주세요.");
        groupName.focus();
        checkObj.groupComment = false;
    }
});

if(defaultImg == groupImg.getAttribute("src")){
    initCheck = false;
}else{
    initCheck = true;
}

inputImg.addEventListener("change", e=>{
    if(e.target.files[0] != undefined){ // 파일 선택
        const reader = new FileReader();
        reader.readAsDataURL(e.target.files[0]);
        reader.onload = event =>{
            groupImg.setAttribute("src", event.target.result);
            deleteCheck = 1;
        }
    }else{ // 파일 선택 시 취소
        groupImg.setAttribute("src", originalImg);
        deleteCheck = -1;
    }
});

deleteImg.addEventListener("click",()=>{ // 이미지 삭제
    groupImg.setAttribute("src", defaultImg);
    inputImg.value="";
    deleteCheck=0;
})

function introValidate(){
    
    if(bOriName == groupName.value && bOriComment == groupComment.value && 
        originalImg==groupImg.getAttribute("src")){
        alert("변경 사항이 없습니다.");
        return false;
    };

    if(!initCheck && deleteCheck==1){return true};
    if(initCheck && deleteCheck==1){return true};
    if(initCheck && deleteCheck==0){return true};

    if(!checkObj.groupName){ return false; }
    if(!checkObj.groupComment){ return false; }

}
