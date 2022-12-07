const myDropdown = document.getElementById("myDropdown");
const icon = document.getElementById("triangle-icon");

function dropDown(){
    myDropdown.classList.toggle("show1");
    icon.classList.toggle("rotate");
};

window.onclick=function(e){
    if(!e.target.matches(".dropbtn, .dropbtn *")){

        if(myDropdown.classList.contains("show1")){
            myDropdown.classList.remove("show1");
            icon.classList.remove("rotate");
        }   
    }
};


// 본드 리스트 무한 스크롤
const option = {
    root: null,
    rootMargin: "0px 0px 0px 0px",
    thredhold: 1,
}

const observer = new IntersectionObserver(searchPageScroll, option);
const target = document.getElementById("pageTarget");
observer.observe(target);

let flag = true;
function searchPageScroll(){
    if(cp == 0 ){
        cp++;
    }else{
        if(flag){
            console.log(cp);
            $.ajax({
                url : "/member/groupTopic/1",
                data : {"cp" : ++cp},
                type : "POST",
                dataType : "JSON",
                success : function(map){
                        console.log(map);
                        if( map != null ){
                        const listWrap = document.querySelector(".list-wrap");
    
                        for(let group of map){
                            const h3 = document.createElement("h3");
                            
                            if(group == null){
                                h3.innerText = "본드가 존재하지 않습니다.";
                                h3.classList.add("h3");
                            } else{
                                
                                const listWrapper = document.createElement("ul");
                                listWrapper.classList.add("list-wrapper");

                                const listItem = document.createElement("li");
                                listItem.classList.add("list-item");

                                const list = document.createElement("div");
                                list.classList.add("list");
                                
                                const groupNo = document.createElement("a");
                                groupNo.classList.add("group-no");
    
                                const listCover = document.createElement("div");
                                listCover.classList.add("list-cover");
    
                                const cover = document.createElement("div");
                                cover.classList.add("cover");
    
                                const groupImage = document.createElement("img");
                                if(group.groupImage != null){
                                    groupImage.setAttribute("src", group.groupImage);
                                } else{
                                    groupImage.setAttribute("src","/resources/images/bond/profile/no-profile.png")
                                }
                                groupImage.classList.add("group-image")
    
                                cover.append(groupImage);
                                listCover.append(cover);
                                groupNo.append(listCover);
    
                                const listBond = document.createElement("div");
                                listBond.classList.add("list-bond");
    
                                const bondName = document.createElement("div");
                                bondName.classList.add("bond-name");
    
                                const bondNameA = document.createElement("a");
                                bondNameA.classList.add("bond-name-a");
                                bondNameA.innerText = group.groupName;
    
                                const bondComment = document.createElement("div");
                                if(group.memberCount != null){
                                    bondComment.innerText = group.groupComment
                                } else{
                                    bondComment.innerText = "소개글이 없습니다.";
                                }
                                bondComment.classList.add("bond-comment");
    
                                const bondCountLeader = document.createElement("div");
                                bondCountLeader.classList.add("bond-count-leader");
    
                                const bondCount = document.createElement("div");
                                if(bondCount != 0){
                                    bondCount.innerText = group.groupCount;
                                } else{
                                    bondCount.innerText = "멤버 0"
                                }
                                bondCount.classList.add("bond-count");
    
                                const bondLeader = document.createElement("div");
                                if(group.groupLeader != null){
                                    bondLeader.innerText = "리더" + group.leaderName;
                                } else{
                                    bondLeader.innerText = "리더 관리자";
                                }
                                bondLeader.classList.add("bond-leader");
    
    
                                bondCountLeader.append(bondCount,bondLeader);
                                bondName.append(bondNameA)
                                listBond.append(bondName, bondComment, bondCountLeader);
                                list.append(groupNo, listBond);
                                listItem.append(list);
                                listWrapper.append(listItem);
                                listWrap.append(listWrapper);

                            }
                            
                            

                        }
                    } else{ // 실패
                        alert("본드를 불러올 수 없습니다.");
                    }
                },
                error : function(req, status, error){
                    console.log("에러 발생");
                }
            });
            flag = false;

        }else{
            flag = true;
        }
    }
};
