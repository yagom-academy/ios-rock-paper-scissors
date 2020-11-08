let result = rockScissorsPaper()

var mukChiBa: MukChiBa = MukChiBa(userWinningState: result)
while !mukChiBa.playGame() {}
