
const groupName = document.getElementById("groupName");
const groupComment = document.getElementById("groupComment");

const groupImg = document.getElementById("group-img");
const inputImg = document.getElementById("inputImg");
const deleteImg = document.getElementById("deleteImg");

let bOriComment = document.getElementById("groupComment").value;

let initCheck;
let deleteCheck=-1; 

let deleteYN = 0;

const defaultImg = "/resources/images/bond/profile/no-profile.png";

const checkObj = {
    "groupName" : true,
    "groupComment" : true
};

document.getElementById("xBtn").addEventListener("click", ()=>{
    groupName.focus();
    groupName.value="";
})

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
        groupImg.setAttribute("src", bOriginalImg);
        deleteCheck = -1;
    }
});

deleteImg.addEventListener("click",()=>{ // 이미지 삭제
    groupImg.setAttribute("src", defaultImg);
    inputImg.value="";
    deleteYN = 1;
    deleteCheck=0;
})


function introValidate(){
    
    if( (bOriName == groupName.value) && (bOriComment == groupComment.value )
        && (bOriginalImg==groupImg.getAttribute("src"))){
        alert("변경 사항이 없습니다.");
        return false;
    };

    if(groupComment.value.trim().length >= 1){
        
        $(document).keydown(e=>{
            if(e.target.nodeName === "textarea"){
                if(e.keyCode===8){
                    return false;
                }
            }
        });
    }

    if(groupName.value.trim().length == 0){
        alert("밴드 이름을 작성해주세요.");
        groupName.focus();
        return false;
    }

    if(groupComment.value.trim().length == 0){
        alert("밴드 소개를 작성해주세요.");
        groupComment.focus();
        return false;
    }

    document.getElementById("deleteYN").value=deleteYN;
    return true;
}
