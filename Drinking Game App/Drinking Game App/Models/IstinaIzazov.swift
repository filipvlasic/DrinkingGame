import Foundation

struct IstinaIzazov {
    var gameTitle: String
    var gameDescription: String
    var questions: [Task]
}

struct Task {
    var category: String
    var type: String
    var question: String
}
