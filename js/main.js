let canvas = document.getElementById('output');
let context = canvas.getContext('2d');

let firstNameInput = document.getElementById("firstname")
firstNameInput.addEventListener('input', onValueChanged);

function onValueChanged(event)
{
    let code = qrcodegen.QrCode.encodeText(event.target.value, qrcodegen.QrCode.Ecc.MEDIUM)
    updateCanvas(code)
}

function updateCanvas(code)
{
    canvas.width = code.size
    canvas.height = code.size

    let black = "rgb(0,0,0)"
    let white = "rgb(255,255,255)"
    for (var y = 0; y < code.modules.length; y++)
    {
        for (var x = 0; x < code.modules[y].length; x++)
        {
            context.fillStyle = code.modules[y][x] ? black : white
            context.fillRect(x, y, 1, 1 );     
        }
    }
}