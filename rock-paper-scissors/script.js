
let playerScore = 0;
let computerScore = 0;


function computerPlay() {
  const r = Math.random();
  return (r <= 0.33) ? 'rock' : (r <= 0.66) ? 'paper' : 'scissors'; 
}

function computerWon() {

  const res = document.querySelector("#result-div");
  const winner = document.createElement('p');
  winner.textContent = "Computer wins the game!";
  res.appendChild(winner);
}

function playerWon() {
  const res = document.querySelector("#result-div");
  const winner = document.createElement('p');
  winner.textContent = "Player wins the game!";
  res.appendChild(winner);
}

const buttons = document.querySelectorAll('button');
buttons.forEach( (button) => {
  button.addEventListener('click', (e) => {
    if(computerScore == 5) {
      computerWon();
    }
    else if(playerScore == 5) {
      playerWon();
    }
    else game(button.id);
  })
})



function game(player) {
  let computer = computerPlay();
  const currentRound = document.querySelector('#round-result');

  switch(player) {
    case 'paper':
      switch(computer) {
        case 'paper':
          currentRound.textContent = 'It is a draw!';
          break;
        case 'rock':
          currentRound.textContent = 'Paper wraps rock, You Win!';
          playerScore ++;
          break;
        case 'scissors':
          currentRound.textContent = 'Scissors cut paper, You Lose!';
          computerScore ++;
          break;
      }
      break;
    case 'rock':
      switch(computer) {
        case 'rock':
          currentRound.textContent = 'It is a draw!';
          break;
        case 'paper':
          currentRound.textContent = 'Paper wraps rock, You Lose!';
          computerScore ++;
          break;
        case 'scissors':
          currentRound.textContent = 'Rock crushses Scissors, You win!';
          playerScore ++;
          break;
      }
      break;
    case 'scissors':
      switch(computer) {
        case 'scissors':
          currentRound.textContent = 'It is a draw';
          break;
        case 'rock':
          currentRound.textContent = 'Rock crushes scissors, You Lose!';
          computerScore ++;
          break;
        case 'paper':
          currentRound.textContent = 'Scissors cut paper, You Win!';
          playerScore ++;
          break;
      }
      break;
  }
  const compScore = document.querySelector('#computerScore');
  compScore.textContent = `Computer's score: ${computerScore}`;
  const plScore = document.querySelector('#playerScore');
  plScore.textContent = `Player's score: ${playerScore}`;

}

