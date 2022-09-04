let output = document.getElementById('output');
let firstNameInput = document.getElementById("firstname")

firstNameInput.addEventListener('input', onValueChanged);

function onValueChanged(event)
{
    output.textContent = event.target.value
}