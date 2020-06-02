//16x16 div grid;
const body = document.querySelector('body');
body.style.height = '100vh';
const grid = document.createElement('div');
grid.classList.add('grid');
grid.style.height = "100%";

for(i = 0; i < 15; i ++) {
  const row = document.createElement('div');
  row.classList.add('row');
  row.style.cssText = 'margin: 0 auto';
  row.style.height = "6%";

  for(j = 0; j < 15; j ++) {
    const cell = document.createElement('div')
    cell.style.display = "inline-block";
    cell.style.width = "6%";
    cell.style.height = "6%";
    row.appendChild(cell);
  }

  grid.appendChild(row);
}

body.appendChild(grid);