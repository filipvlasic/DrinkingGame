import Foundation

struct AMNIkadNisam: Codable {
    var gameTitle: String
    var gameDescription: String
    var questions: [AMQuestion]
}

struct AMQuestion: Codable {
    var type: String
    var question: String
}
