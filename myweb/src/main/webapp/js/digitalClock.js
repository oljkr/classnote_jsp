const days=["일","월","화","수","목","금","토"];

function showtime(){

    //아래 d는 지역변수로 해야함(전역변수로 하면 한번만 가져오고 말게 됨!!!)⭐
    const d=new Date(); //시스템의 현재 날짜 정보 가져오기

    let today="";
    today += d.getFullYear() + "."; //2022

    if((d.getMonth()+1)<10){
        today+="0";
    }
    today+=d.getMonth()+1+".";  //2022.08

    if(d.getDate()<10){
        today+="0";
    }
    today+=d.getDate(); //2022.08.10
    
    switch(d.getDay()){
        case 0 : today+=" (일) "; break;
        case 1 : today+=" (월) "; break;
        case 2 : today+=" (화) "; break;
        case 3 : today+=" (수) "; break;
        case 4 : today+=" (목) "; break;
        case 5 : today+=" (금) "; break;
        case 6 : today+=" (토) "; break;
    }

    if(d.getHours()<12){
        today+="AM ";
    }else{
        today+="PM ";    //2022.08.10 (수) PM 
    }

    if(d.getHours()<13){
        today += d.getHours() + ":";
    }else{
        today += d.getHours()-12 + ":";
    }

    if(d.getMinutes()<10){
        today+="0";
    }
    today+=d.getMinutes() + ":";

    if(d.getSeconds()<10){
        today+="0";
    }
    today+=d.getSeconds();

    document.getElementById("clock").innerText=today;

    timer=setTimeout(showtime, 1000); //1초후에 showtime함수를 호출
}//showtime() end

//70번코드에서 timer에 넣어줌으로써 이걸로 killtime함수에서 시간을 멈출 수 있음.
let timer;  //전역변수

function killtime(){
    clearTimeout(timer);    //시간해제
}
//사이트 같은 것도 나가거나 할 때 clear를 안 해주면
//그 사이트에 들어가면 계속 속도가 느려질 수 있다.