var myAudio = document.getElementsByTagName('audio');


function playAll(){
var i = 0;
	for(i=0; i <= myAudio.length; i++){
		myAudio[i].play();
	}
}

function pauseAll(){
var i = 0;
	for(i=0; i <= myAudio.length; i++){
		myAudio[i].pause();
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
	for(i=0; i <= myAudio.length; i++){
		myAudio[i].currentTime += 2; 
	}
}

function rw(){
var i = 0;
	for(i=0; i <= myAudio.length; i++){
		myAudio[i].currentTime -= 2;
	}
}

function volumeAll(v){
var i = 0;
	for(i=0; i <= myAudio.length; i++){
		myAudio[i].volume = v;
	}
}

