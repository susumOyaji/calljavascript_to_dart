//----1---//
function connectDevice() {
ConnectBLE.postMessage('ble.connect');
}
//----2---//
function receiveDeviceStatus(text){
console.log('*** Update Device Status ***');
}