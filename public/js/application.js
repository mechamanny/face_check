$(document).ready(function() {
	
	// guide to incorporating webcam photos https://developer.mozilla.org/en-US/docs/WebRTC/Taking_webcam_photos

	//wrap function in IIFE to protect golbal scope 
	(function() {

	//grab all html elements needed for video capture and display of screnshots	
  var streaming = false,
      video        = document.querySelector('#video'),
      canvas       = document.querySelector('#canvas'),
      photo        = document.querySelector('#photo'),
      startbutton  = document.querySelector('#startbutton'),
      width = 320,
      height = 0;

  //grab video from webcam, find prefix for appropriate web browser
  navigator.getMedia = ( navigator.getUserMedia ||
                         navigator.webkitGetUserMedia ||
                         navigator.mozGetUserMedia ||
                         navigator.msGetUserMedia);
  // get video, without audio
  navigator.getMedia(
    {
      video: true,
      audio: false
    },
    //get video as a stream
    function(stream) {
    	//firefox needs you to set the mozSrcObject
      if (navigator.mozGetUserMedia) {
        video.mozSrcObject = stream;
      } 
      // webkit and opera need to create an object URL
      else {
        var vendorURL = window.URL || window.webkitURL;
        video.src = vendorURL.createObjectURL(stream);
      }
      video.play();
    },
    function(err) {
      console.log("An error occured! " + err);
    }
  );
  //sizing the video, up to this function is all that is needed to start playing video
  video.addEventListener('canplay', function(ev){
    if (!streaming) {
      height = video.videoHeight / (video.videoWidth/width);
      video.setAttribute('width', width);
      video.setAttribute('height', height);
      canvas.setAttribute('width', width);
      canvas.setAttribute('height', height);
      streaming = true;
    }
  }, false);

  //grab picture using canvas
  function takepicture() {
    canvas.width = width;
    canvas.height = height;
    canvas.getContext('2d').drawImage(video, 0, 0, width, height);
    var data = canvas.toDataURL('image/png');
    photo.setAttribute('src', data);
  }

  startbutton.addEventListener('click', function(ev){
      takepicture();
    ev.preventDefault();
  }, false);

})();
});
