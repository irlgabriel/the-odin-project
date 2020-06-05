const result = document.getElementById('result');
let first = 0;
let second = 0;
let op = '';

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

function operate(a, b, op) {
  switch(op) {
    case '+':
      updateResult(add(a, b));
      break;
    case '-':
      updateResult(subtract(a, b));
      break;
    case '/':
      updateResult(divide(a, b));
      break;
    case '*':
      updateResult(multiply(a, b));
      break;
  }
  
}


//event listener for clear;
const clearBtn = document.querySelector('.clear-btn');
clearBtn.addEventListener('click', () =>{
  document.getElementById('result').textContent = 0;
  first = 0;
  second = 0;
  op = '';
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
for(let i = 0; i < operators.length; i ++) {
  operators[i].addEventListener('click', () => {
    //store displayed input;
    first = Number(result.textContent);
    //clear current display;
    result.textContent = 0;
    //store operator;
    op = operators[i].firstElementChild.textContent;
  })
}

//event listener for comma
const comma = document.querySelector('#comma');
comma.addEventListener('click', () => {
  if(result.textContent != 0 && !result.textContent.includes('.')) updateResult('.');
})

//event listener for equal
const equal = document.getElementById('equal');
equal.addEventListener('click' , () => {
  second = Number(result.textContent);
  result.textContent = 0;
  operate(first, second, op);

})