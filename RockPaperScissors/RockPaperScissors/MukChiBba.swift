//  Created by 감자 and som on 2022/08/22.

enum MukChiBba: Int {
    case muk = 1
    case chi = 2
    case bba = 3
    
    static func random() -> MukChiBba {
        let mcb: [Self] = [.muk, .chi, .bba]
        let randomNumber = Int.random(in: 0...2)
        return mcb[randomNumber]
    }
}
