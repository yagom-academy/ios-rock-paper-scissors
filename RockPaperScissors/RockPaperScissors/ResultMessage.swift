import Foundation

enum ResultMessage {
    static let win = "이겼습니다!"
    static let defeat = "졌습니다!"
    static let draw = "비겼습니다!"
    static let unchangedTurn = "\(thisTurn)의 턴입니다"
    static let changedTurn = "\(decideTurn())의 턴입니다"
    static let victoryOfThisTurn = "\(thisTurn)의 승리!"
}
