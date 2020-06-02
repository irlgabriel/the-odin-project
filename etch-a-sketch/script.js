//16x16 div grid;
const body = document.getElementById('body');
let gridSize = 16;
let dark = 70;
createGrid(gridSize);

function getRandomColor() {
  let rand1 = Math.floor(Math.random() * 360);

  return `hsl(${rand1}, 100%, ${dark}%)`;
}

function clearGrid() {
  const rows = document.querySelectorAll('.row');
  for(row of [...rows]) {
    row.parentNode.removeChild(row);
  }
}

function createGrid(gridSize) {
  for(i = 0; i < gridSize; i ++) {
    const row = document.createElement('div');
    row.classList.add('row')
    row.style.cssText = `display: flex; height: ${99/gridSize}%; width: 100%;`;
    for(j = 0; j < gridSize; j ++) {
      const cell = document.createElement('div');
      cell.classList.add('cell');
      cell.style.cssText = `border: 1px solid red; flex: 1; height: 100%; width: ${99/gridSize}% ; background-color: white;`;

      cell.addEventListener('mouseover', () => {
        cell.style.backgroundColor = `${getRandomColor()}`;
  
      })

      row.appendChild(cell);
    }
    body.appendChild(row);
  }
}

const clear = document.querySelector('#clear');
clear.addEventListener('click', (e) => {
  const cells = document.querySelectorAll('.cell');
  for(cell of [...cells]) {
    cell.style.backgroundColor = 'white';
  }
  gridSize = prompt('enter grid size: ');
  clearGrid();
  createGrid(gridSize);
})
