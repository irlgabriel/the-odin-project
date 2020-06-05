Almost done.

Can't figure why when I press an operator button, the operator it always stores is "+".

```
const operators = document.querySelectorAll('.operator');
for(operator of [...operators]) {
  operator.addEventListener('click', () => {
    //store displayed input;
    first = Number(result.textContent);
    //clear current display;
    result.textContent = 0;
    //store operator;
    op = operator.firstElementChild.textContent;
    //HERE
    
  })
}
```