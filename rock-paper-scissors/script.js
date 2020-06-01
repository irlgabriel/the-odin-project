
let playerScore = 0;
let computerScore = 0;
let endGame = false;

function computerPlay() {
  const r = Math.random();
  return (r <= 0.33) ? 'rock' : (r <= 0.66) ? 'paper' : 'scissors'; 
}

function computerWon() {
  
  const res = document.querySelector("#result-div");
  const winner = document.createElement('p');
  winner.textContent = "Computer wins the game!";
  winner.style.cssText = "text-align: center; color: white; font-size: 24px";
  res.appendChild(winner);
}

function playerWon() {
  const res = document.querySelector("#result-div");
  const winner = document.createElement('p');
  winner.textContent = "Player wins the game!";
  winner.style.cssText = "text-align: center; color: white; font-size: 24px";
  res.appendChild(winner);
}

const buttons = document.querySelectorAll('button');
buttons.forEach( (button) => {
  button.addEventListener('click', (e) => {
    if(endGame == true) return;

    if(computerScore == 5 || playerScore == 5) endGame = true;
      else game(button.id);
  })
})



function game(player) {
  let computer = computerPlay();
  const currentRound = document.querySelector('#round-result');
  if(player == computer) 
    currentRound.textContent = "It is a Draw";
  else {
    if(player == 'rock')
      if(computer == 'paper') {
        currentRound.textContent = "Computer Wins!";
        computerScore ++;
      }
      else {
        currentRound.textContent = "Player Wins"; 
        playerScore++;
      }
    else if(player == 'paper')
      if(computer == 'rock') {
        currentRound.textContent = "Player wins";
        playerScore ++;
      }
      else {
        currentRound.textContent = "Computer wins";
        computerScore ++;
      }
    else {
      if(computer == 'rock') {
        currentRound.textContent = "Computer wins";
        computerScore ++;
      }
      else {
        currentRound.textContent = "Player wins";
        playerScore ++;
      }
    }
  }     
  const compScore = document.querySelector('#computerScore');
  compScore.textContent = `Computer's score: ${computerScore}`;
  const plScore = document.querySelector('#playerScore');
  plScore.textContent = `Player's score: ${playerScore}`;
  
  if(computerScore == 5) computerWon();
  if(playerScore == 5) playerWon();

}

