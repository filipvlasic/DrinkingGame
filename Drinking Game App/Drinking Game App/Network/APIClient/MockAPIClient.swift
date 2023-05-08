import Foundation

struct MockAPIClient: APIClient {
    func getNeverHaveIEverData(completion: @escaping (AMNIkadNisam?) -> Void) {
        completion(AMNIkadNisam(
            gameTitle: "Nikad Nisam",
            gameDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            questions: [
                AMQuestion(type: "blaga", question: "Pitanje 1"),
                AMQuestion(type: "začinjena", question: "Pitanje 2"),
                AMQuestion(type: "začinjena", question: "Pitanje 3"),
                AMQuestion(type: "blaga", question: "Pitanje 4"),
                AMQuestion(type: "blaga", question: "Pitanje 5"),
                AMQuestion(type: "začinjena", question: "Pitanje 6"),
                AMQuestion(type: "blaga", question: "Pitanje 7")]))
    }
    
    
}
