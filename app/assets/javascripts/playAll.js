var myAudio = document.getElementsByTagName('audio');


function playAll(){
var i = 0;
	for(i=0; i <= myAudio.length; i++){
		if(i>0){
		 myAudio[i].currentTime=myAudio[0].currentTime;
		}
		myAudio[i].play();
	}
}

function pauseAll(){
var i = 0;
myAudio[0].pause();
	for(i=1; i <= myAudio.length; i++){
			myAudio[i].pause();
		}
	for(i=0; i <= myAudio.length; i++){
		 myAudio[i].currentTime=myAudio[0].currentTime;
		}
}

function stopAll(){
var i = 0;
	for(i=0; i <= myAudio.length; i++){
		myAudio[i].pause();
		myAudio[i].currentTime=0;
	}
}

function ff(){
var i = 0;
myAudio[i].currentTime += 2;
	for(i=1; i <= myAudio.length; i++){
		myAudio[i].currentTime = myAudio[0].currentTime;
	}
}

function rw(){
var i = 0;
myAudio[i].currentTime -= 2;
	for(i=1; i <= myAudio.length; i++){
		myAudio[i].currentTime = myAudio[0].currentTime;
	}
}

function volumeAll(v){
var i = 0;
	for(i=0; i <= myAudio.length; i++){
		myAudio[i].volume = v;
	}
}
/*For individual Tracks*/
function playThis(x){
 myAudio[x].play();
}

function pauseThis(x){
 myAudio[x].pause();
}

function stopThis(){
	myAudio[x].pause();
	myAudio[x].currentTime=0;
}

function ffThis(x){
myAudio[x].currentTime += 2;
}

function rwThis(x){
myAudio[x].currentTime -= 2;
}

function volumeThis(x, v){
		myAudio[x].volume = v;
}


