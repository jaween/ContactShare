let canvas = document.getElementById("output");
let context = canvas.getContext("2d");

document.getElementById("firstname").addEventListener("input", onValueChanged);
document.getElementById("surname").addEventListener("input", onValueChanged);
document.getElementById("phone").addEventListener("input", onValueChanged);

let userData = {
  firstname: "",
  surname: "",
  phone: "",
};
function onValueChanged(event) {
  const id = event.target.id;
  userData[id] = event.target.value;
  saveUserData(userData);
  rebuild();
}

function rebuild() {
  let vCard = buildVCard(
    userData["firstname"],
    userData["surname"],
    userData["phone"]
  );
  let code = qrcodegen.QrCode.encodeText(vCard, qrcodegen.QrCode.Ecc.MEDIUM);
  updateCanvas(code);
}

function buildVCard(firstname, surname, phone) {
  console.log(`${firstname} ${surname} ${phone}`);
  return `\
BEGIN:VCARD
VERSION:4.0
N:${surname ?? ""};${firstname ?? ""};;
TEL;TYPE#home,voice;VALUE#uri:tel:${phone}
END:VCARD`;
}

function updateCanvas(code) {
  canvas.width = code.size;
  canvas.height = code.size;

  let black = "rgb(0,0,0)";
  let white = "rgb(255,255,255)";
  for (var y = 0; y < code.modules.length; y++) {
    for (var x = 0; x < code.modules[y].length; x++) {
      context.fillStyle = code.modules[y][x] ? black : white;
      context.fillRect(x, y, 1, 1);
    }
  }
}

function saveUserData(userData) {
  const userDataString = JSON.stringify(userData);
  localStorage.setItem("userData", userDataString);
}

function loadUserData() {
  const userDataString = localStorage.getItem("userData") ?? "{}";
  return JSON.parse(userDataString);
}

window.addEventListener("load", (event) => {
  userData = loadUserData();
  for (const key of Object.keys(userData)) {
    document.getElementById(key).value = userData[key];
  }
  rebuild();
});
