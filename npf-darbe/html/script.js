window.addEventListener("message", function(event) {
    var data = event.data;
    if (data.type === "open") {
        document.getElementById("video-player").src = "videos/" + data.video;
        document.getElementById("video-player").play();
        document.body.style.display = "flex";
    }
});
