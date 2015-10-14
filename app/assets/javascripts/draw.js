//$(document).ready(function() {
//    drawHello();
//});

function drawHello() {
    var c = document.getElementById("canvas");
    var ctx = c.getContext("2d");
    setTimeout(function() {
        ctx.moveTo(100, 50);
        ctx.lineTo(100, 100);
        ctx.stroke();
    },200);
    setTimeout(function() {
        ctx.moveTo(75, 50);
        ctx.lineTo(125, 50);
        ctx.stroke();
    },400);
    setTimeout(function() {
        ctx.moveTo(75, 100);
        ctx.lineTo(125, 100);
        ctx.stroke();
    },600);
    setTimeout(function() {
        ctx.moveTo(130, 75);
        ctx.arc(130, 75, 25, Math.PI / 2, (3 * Math.PI) / 2, true);
        ctx.closePath();
        ctx.lineWidth = 3;
        ctx.fillStyle = '#039be5';
        ctx.fill();
        ctx.strokeStyle = '#2b2b2b';
        ctx.stroke();
    },800);
    setTimeout(function() {
        ctx.moveTo(160, 50);
        ctx.lineTo(160, 100);
        ctx.stroke();
    },1000);

    setTimeout(function() {
        ctx.moveTo(160, 100);
        ctx.lineTo(180, 100);
        ctx.stroke();
    },1200);

    setTimeout(function() {
        ctx.moveTo(160, 75);
        ctx.lineTo(180, 75);
        ctx.stroke();
    },1400);

    setTimeout(function() {
        ctx.moveTo(160, 50);
        ctx.lineTo(180, 50);
        ctx.stroke();
    },1600);

    setTimeout(function() {
        ctx.moveTo(185, 100);
        ctx.lineTo(200, 50);
        ctx.stroke();
    },1800);

    setTimeout(function() {
        ctx.moveTo(200, 50);
        ctx.lineTo(215, 100);
        ctx.stroke();
    },2000);

    setTimeout(function() {
        ctx.moveTo(190, 85);
        ctx.lineTo(210, 85);
        ctx.stroke();
    },2200);

    setTimeout(function() {
        ctx.font = "bold 24px sans-serif";
        ctx.fillText("Box", 200, 120);
    },2500);

        ctx.moveTo(50, 25);
        ctx.lineTo(250, 25);
        ctx.moveTo(250, 25);
        ctx.lineTo(250, 125);
        ctx.moveTo(250, 125);
        ctx.lineTo(50, 125);
        ctx.moveTo(50, 125);
        ctx.lineTo(50, 25);
        ctx.closePath();
        ctx.fillStyle = '#039be5';
        ctx.fill();
        ctx.stroke();

    ctx.font = "bold 24px sans-serif";
    ctx.fillText("2.0", 253, 23);
}