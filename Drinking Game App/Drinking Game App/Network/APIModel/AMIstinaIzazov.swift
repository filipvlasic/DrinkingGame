import Foundation

struct AMIstinaIzazov: Codable {
    var gameTitle: String
    var gameDescription: String
    var questions: [AMTask]
}

struct AMTask: Codable {
    var category: String
    var type: String
    var question: String
}
