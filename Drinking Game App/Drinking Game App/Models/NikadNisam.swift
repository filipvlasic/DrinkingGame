import Foundation

struct NikadNisam {
    var gameTitle: String
    var gameDescription: String
    var questions: [Question]
}

struct Question {
    var type: String
    var question: String
}
