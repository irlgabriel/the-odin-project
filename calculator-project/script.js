const result = document.getElementById('result');

function add(a, b) {
  return a + b;
}
function subtract(a, b) {
  return a - b;
}
function multiply(a, b) {
  return a * b;
}
function divide(a, b) {
  return a / b;
}
function getResult() {
  return result.textContent;
}
function updateResult(num) {
  if(result.textContent == 0) result.textContent = num;
    else result.textContent += num;
}

//event listener for clear;
const clearBtn = document.querySelector('.clear-btn');
clearBtn.addEventListener('click', () =>{
  document.getElementById('result').textContent = 0;
})
//event listeners for numbers;
const buttons = document.querySelectorAll('.number');
for(let i = 0; i < buttons.length; i ++) {
  buttons[i].addEventListener('click', () => {
    const txt = buttons[i].firstElementChild.textContent;
    updateResult(txt);
  })
}
//event listener for plus-minus
const plusMinus = document.querySelector('.plus-minus');
plusMinus.addEventListener('click', () =>{
  result.textContent = -result.textContent;
})
//event listener for percentage
const percent = document.querySelector('.percentage');
percent.addEventListener('click', () =>{
  result.textContent /= 100.0;
})

//event listener for operators
const operators = document.querySelectorAll('.operator');
for(operator of operators) {
  operator.addEventListener('click', () => {
    //store displayed input;
    const first = result.textContent;
    //clear current display;
    result.textContent = 0;
  })
}
//event listener for comma
const comma = document.querySelector('#comma');
comma.addEventListener('click', () => {
  if(result.textContent != 0 && !result.textContent.includes('.')) updateResult('.');
})