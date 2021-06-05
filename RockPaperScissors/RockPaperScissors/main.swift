func runGames() -> Void {
    var isGameOngoing: Bool = true
    let myGame = Game()

    myGame.startGame()
    if myGame.gameWinner != .exit {
        let myMukchiba = Mukchiba(currentWinner: myGame.gameWinner)
        myMukchiba.startGame()
        isGameOngoing = myMukchiba.isNotFinished
    }
    if isGameOngoing && myGame.gameWinner != .exit {
        runGames()
    }
}

runGames()

