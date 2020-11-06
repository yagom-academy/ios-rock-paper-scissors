let result = rockScissorsPaper()

var mukChiBa: MukChiBa = MukChiBa(userWinningState: result)
var gameResult: Bool = mukChiBa.playGame()

while !mukChiBa.playGame() {}
