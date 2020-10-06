//document.oncontextmenu = function () { return false; }
//crooss brows
//document.onselectstart = function () { return false; }
window.status = 'SIRECA (Sistema de Recaudacion de la Cartera)';
var fontSize = 1;
function zoomIn() {
    fontSize += 0.1;
    //document.body.style.fontSize = fontSize + "em"; 
    document.getElementById("divContenido").style.fontSize = fontSize + "em";
}
function zoomOut() {
    fontSize -= 0.1;
    document.getElementById("divContenido").style.fontSize = fontSize + "em";
    //document.body.style.fontSize = fontSize + "em"; 
}
