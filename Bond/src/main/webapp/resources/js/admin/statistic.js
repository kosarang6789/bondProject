// 차트 연습

// 통계 내면 좋은게 뭐가 있을까?
// 1. 실시간 통계(회원 수, 모임 수, 게시글 수)
// 2. 일일 통계(회원 가입, 회원 탈퇴, 게시글 작성 수)
// 4. 주간 회원 추이
// 회원 수 애니메이션


// 카운트 애니메이션 함수
function counter(targetId, end){
    const target = document.getElementById(targetId);

    if(target != null) {

        let num = end;
    
        const timer = setInterval(function(){
            target.innerText = Math.ceil(end - num);
    
            num = num - (num / 10);
    
            if(num >= end) {
                clearInterval(timer);
            }
    
        }, 40);

    }
}

// id, 문자열을 받아 innerText를 수행하는 함수
function insertText(targetId, str) {
    const target = document.getElementById(targetId);
    target.innerText = str;
}



/* 차트 이용 함수 */


// 도너츠 함수
 function topicDoughnutChart(){
     $.ajax({
         url : "/admin/statistic/topic/doughnut",
         type : "GET",
         dataType : "JSON",
         success : (topicDoughnutList) => {

            let topicNameArr = [];

            for(let i=0; i<topicDoughnutList.length; i++) {
                topicNameArr[i] = topicDoughnutList[i].topicName;
            }

            let topicCountArr = [];

            let hotTopicCount = -1;
            let hotTopicIndex = -1;

            let coldTopicCount = 10000;
            let coldTopicIndex = -1;

            for(let i=0; i<topicDoughnutList.length; i++) {
                topicCountArr[i] = topicDoughnutList[i].groupCount;

                // 인기토픽 찾기
                if(hotTopicCount <= topicDoughnutList[i].groupCount) {
                    hotTopicCount = topicDoughnutList[i].groupCount;
                    hotTopicIndex = i;
                }

                // 비인기토픽 찾기
                if(coldTopicCount > topicDoughnutList[i].groupCount) {}
                    coldTopicCount = topicDoughnutList[i].groupCount;
                    coldTopicIndex = i;
                }
            
            // 인기토픽
            counter("hotNumber", hotTopicCount);
            insertText("hotUnit", topicDoughnutList[hotTopicIndex].topicName);

            // 비인기토픽
            counter("coldNumber", coldTopicCount);
            insertText("coldUnit", topicDoughnutList[coldTopicIndex].topicName);


            new Chart(document.getElementById("doughnut"), {
                type: 'doughnut',
                data: {
                    labels: topicNameArr,
                      datasets: [{
                        label: 'My First Dataset',
                        data: topicCountArr,
                        backgroundColor: [
                            'rgb(255, 99, 132)', 
                            'rgb(255, 159, 64)', 
                            'rgb(255, 205, 86)', 
                            'rgb(75, 192, 192)', 
                            '#b8997C', 
                            'rgb(153, 102, 255)',
                            'rgb(201, 203, 207)',
                            '#bff850',
                            '#0087A3',
                            '#F9BDC7',
                            'rgb(54, 162, 235)',
                            'dimgray'
                        ],
                        hoverOffset: 4
                      }]
                    
                },
                options: {
                    responsive: true,
                } 

            });
         },
         error : () => {
             alert("데이터 전송에 실패하였습니다 : 모임 통계")
         }
    })
 }


// 주간 가입/탈퇴 회원 수 출력 차트
function weekelyMembersChart(){
    $.ajax({
        url : "/admin/statistic/weekly/members",
        type : "GET",
        dataType : "JSON",
        success : (weeklyMembersMap) => {

            // 1. 각 배열 선언
            let weeklyDateArr = [];
            let signUpCountArr = [];
            let delCountArr = [];

            // 2. 변수 선언
            let signUpCountTotal = 0;
            let delCountTotal = 0;
            // 3. 배열 및 변수에 값 담기 with 반복문
            for(let i=0; i<weeklyMembersMap.signUpCounts.length; i++) {
                weeklyDateArr[i] = weeklyMembersMap.signUpCounts[i].weeklyDate;
                signUpCountArr[i] = weeklyMembersMap.signUpCounts[i].memberSignUpCount;
                signUpCountTotal += weeklyMembersMap.signUpCounts[i].memberSignUpCount;
            }

            for(let i=0; i<weeklyMembersMap.delCounts.length; i++) {
                delCountArr[i] = weeklyMembersMap.delCounts[i].memberDelCount;
                delCountTotal += weeklyMembersMap.delCounts[i].memberDelCount;
            }

            // 4. 배열의 숫자를 인디케이터에 출력하기
            counter("signUpCountNumber",signUpCountTotal);
            counter("delCountNumber", delCountTotal);

            // 5. 배열의 값을 차트에 담기
            new Chart(document.getElementById("bar"), {
                type: 'bar',
                data: {
                  labels: weeklyDateArr,
                  datasets: [
                    { 
                        barThickness: 20,
                        data: signUpCountArr,
                        label: "회원 가입 수",
                        backgroundColor: "#00AAFF",
                        hoverBackgroundColor: "#00AAFF70",
                    }
                    ,{ 
                        barThickness: 20,
                        data: delCountArr,
                        label: "회원 탈퇴 수",
                        backgroundColor: "rgb(255, 99, 132)",
                        hoverBackgroundColor: "rgb(255, 99, 132)",
                    },
                    
                  ],
                }, 
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            ticks: {
                                callback: function(value, index, ticks) {
                                    return value + '명'
                                }
                            }
                        }
                    }
                }
              });


        },
        error : () => {
            alert("데이터 전송에 실패하였습니다 : 회원 가입 및 탈퇴 통계")
        }
    })
}


// 주간 게시글 작성 수 차트
function weeklyPostChart(){
    $.ajax({
        url : "/admin/statistic/weekly/post",
        type : "GET",
        dataType : "JSON",
        success : (weeklyPostList) => {

            let postCountArr = []; 

            for(let i=0; i<weeklyPostList.length; i++) {
                postCountArr[i] = weeklyPostList[i].postCount;
            }

            let weeklyDateArr = [];

            for(let i=0; i<weeklyPostList.length; i++) {
                weeklyDateArr[i] = weeklyPostList[i].weeklyDate;
            }

            new Chart(document.getElementById("line"), {
                type: 'line',
                data: {
                  labels: weeklyDateArr,
                  datasets: [{ 
                      barThickness: 20,
                      data: postCountArr,
                      label: "주간 게시글 작성 수",
                      backgroundColor: "rgb(255, 159, 64)",
                      borderColor: "rgb(255, 159, 64)",
                      hoverBackgroundColor: "rgb(255, 159, 64)",
                    }
                  ],
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            ticks: {
                                callback: function(value, index, ticks) {
                                    return value + '개'
                                }
                            }
                        }
                    }
                }
              });

        },
        error : () => {
            alert("데이터 전송 실패 : 주간 게시글 작성 수")
        },
    })
}

// 일일 정보
function todayGeneralData(){
    $.ajax({
        url : "/admin/statistic/today/general",
        type : "GET",
        dataType : "JSON",
        success : (todayGeneral) => {
            counter("todayMembersNumbers", todayGeneral[0].todayMemberCount);
            counter("todayGroupsNumbers", todayGeneral[0].todayGroupCount);
            counter("todayPostsNumbers", todayGeneral[0].todayPostCount);
        },
        error : () => {
            alert("데이터 전송 실패 : 일일 정보")
        }
    })
}

// 전기간 정보
function allPeriodGeneralData(){
    $.ajax({
        url : "/admin/statistic/allPeriod/general",
        type : "GET",
        dataType : "JSON",
        success : (allPeriodGeneral) => {
            counter("totalMembersNumbers", allPeriodGeneral[0].totalMemberCount);
            counter("totalGroupsNumbers", allPeriodGeneral[0].totalGroupCount);
            counter("totalPostsNumbers", allPeriodGeneral[0].totalPostCount);
        },
        error : () => {
            alert("데이터 전송 실패 : 일일 정보")
        }
    })
}


// 함수 실행존
(() => {
    // 도넛 차트 실행
    topicDoughnutChart();

    // 주간 회원 차트 실행
    weekelyMembersChart()

    // 주간 게시글 차트 실행
    weeklyPostChart();

    // 전기간 정보 실행
    allPeriodGeneralData();

    // 일일 정보 실행
    todayGeneralData();

})()




