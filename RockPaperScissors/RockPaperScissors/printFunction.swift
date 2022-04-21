func printRockPaperScissorOption() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func printMuckJjiPpaOption(player: Player) {
    print("[\(player.playerName) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
}

func printErrorMessage() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
}
