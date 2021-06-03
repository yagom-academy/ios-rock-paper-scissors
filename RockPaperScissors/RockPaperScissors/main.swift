let myGame = Game()
myGame.startGame()
//let winner = myGame.gameWinner
if myGame.gameWinner != .exit {
    let myMukchiba = Mukchiba(currentWinner: myGame.gameWinner)
    myMukchiba.startGame()
    
    
}
