import Foundation

var isTurnOfUser: Bool = false
var thisTurn: String = PunctuationMarks.emptyString

func decideTurn() -> String {
    if isTurnOfUser == true {
        return Player.user
    } else {
        return Player.computer
    }
}

let rockPaperScissors = RockPaperScissors()
let mukjipa = MukJiPa()
rockPaperScissors.startGame(rockPaperScissors.selectGameMenu())
