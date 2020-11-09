
import Foundation



let rockSiccsorsPapper = RockScissorsPaper()

while true {
    rockSiccsorsPapper.progress()
    
    if rockSiccsorsPapper.gameStatus == .endGame || rockSiccsorsPapper.gameStatus == .exitGame {
        break
    }
}

