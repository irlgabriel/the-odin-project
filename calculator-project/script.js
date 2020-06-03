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
  result.textContent = num;
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
  
})
