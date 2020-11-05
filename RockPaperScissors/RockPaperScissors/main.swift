let result = rockScissorsPaper()

var mukChiBa: MukChiBa = MukChiBa(userWinningState: result)
var gameResult: Bool = mukChiBa.gamePlay()

while gameResult {
    gameResult = mukChiBa.gamePlay()
}
