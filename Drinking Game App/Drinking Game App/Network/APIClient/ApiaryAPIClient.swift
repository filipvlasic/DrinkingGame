import Foundation
import Alamofire

struct ApiaryAPIClient: APIClient {
    private enum Constants {
        static let baseURL: String = "https://private-3e60b-drinkingapp.apiary-mock.com"
        static let neverHaveIEverSuffix = "/neverhaveiever/questions"
        static let truthOrDareSuffix = "/truthordare/questions"
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
    
    func getTruthOrDareData(completion: @escaping (AMIstinaIzazov?) -> Void) {
        AF
            .request("\(Constants.baseURL)\(Constants.truthOrDareSuffix)")
            .responseDecodable(of: AMIstinaIzazov.self) { response in
                switch response.result {
                case .failure(let error):
                    print(error)
                    completion(nil)
                case .success(let result):
                    completion(result)
                }
            }
    }
}
