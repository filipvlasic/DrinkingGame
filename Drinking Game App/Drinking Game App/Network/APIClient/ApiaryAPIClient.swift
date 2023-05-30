import Foundation
import Alamofire

struct ApiaryAPIClient: APIClient {
    private enum Constants {
        static let baseURL: String = "https://private-3e60b-drinkingapp.apiary-mock.com"
        static let neverHaveIEverSuffix = "/neverhaveiever/questions"
    }
    
    func getNeverHaveIEverData(completion: @escaping (AMNIkadNisam?) -> Void) {
        AF
            .request("\(Constants.baseURL)\(Constants.neverHaveIEverSuffix)")
            .responseDecodable(of: AMNIkadNisam.self) { response in
                switch response.result {
                case .failure(let error):
                    print(error)
                    completion(nil)
                case .success(let amNikadNisam):
                    completion(amNikadNisam)
                }
            }
        
    }
}
