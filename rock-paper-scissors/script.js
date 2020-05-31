
function computerPlay() {
  const r = Math.random();
  return (r <= 0.33) ? 'rock' : (r <= 0.66) ? 'paper' : 'scissors'; 
}

function playerPick(){
  const pick = prompt('Rock/Paper/Scissors ?');
  pick.toLowerCase;
  return pick;
}

let computerScore = 0;
let playerScore = 0;


function game() {
  let player = playerPick();
  let computer = computerPlay();
  switch(player) {
    case 'paper':
      switch(computer) {
        case 'paper':
          console.log('It is a draw!');
          break;
        case 'rock':
          console.log('Paper wraps rock, You Win!');
          playerScore ++;
          break;
        case 'scissors':
          console.log('Scissors cut paper, You Lose!')
          computerScore ++;
          break;
      }
      break;
    case 'rock':
      switch(computer) {
        case 'rock':
          console.log('It is a draw!');
          break;
        case 'paper':
          console.log('Paper wraps rock, You Lose!');
          computerScore ++;
          break;
        case 'scissors':
          console.log('Rock crushses Scissors, You win!');
          playerScore ++;
          break;
      }
      break;
    case 'scissors':
      switch(computer) {
        case 'scissors':
          console.log('It is a draw');
          break;
        case 'rock':
          console.log('Rock crushes scissors, You Lose!');
          computerScore ++;
          break;
        case 'paper':
          console.log('Scissors cut paper, You Win!');
          playerScore ++;
          break;
      }
      break;
  }
}

function playFiveTimes() {
  for (i = 0; i < 5; i ++)
    game();
  console.log(`Computer score: ${computerScore}`);
  console.log(`Your Score: ${playerScore}`);
}
playFiveTimes()
