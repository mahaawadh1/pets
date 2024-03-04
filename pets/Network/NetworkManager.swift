//
//  Networl.swift
//  pets
//
//  Created by maha on 04/03/2024.
//

import Foundation
import Alamofire

class NetworkManager {
    private let baseURL = "https://coded-pets-api-crud.eapi.joincoded.com/pets"
    static let shared = NetworkManager()
 
    private init() {}
    
    func fetchPets(completion: @escaping ([Pet]?, Error?) -> Void) {
        AF.request(baseURL).responseDecodable(of: [Pet].self) { response in
                switch response.result {
                case .success(let pets):
                    completion(pets, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
}
