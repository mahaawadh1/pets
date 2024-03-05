//
//  Networl.swift
//  pets
//
//  Created by maha on 04/03/2024.
//
import Foundation
import Alamofire
class NetworkManager{
    
    private let baseURL = "https://coded-pets-api-crud.eapi.joincoded.com/pets"
    
  
    static let shared = NetworkManager()
    

    
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

    ///post
    func addPet(pet: Pet, completion: @escaping (Bool) -> Void) {
        AF.request(baseURL, method: .post, parameters: pet, encoder: JSONParameterEncoder.default).response { response in
            
            switch response.result {
            case .success(_):
                completion(true)
            case .failure(let error):
                print("POST Request Error: \(error.localizedDescription)")
                completion(false)
            }
        }
    }
    func deletePet(petID: Int, completion: @escaping (Bool) -> Void) {
        AF.request("\(baseURL)/\(petID)", method: .delete).response { response in
            switch response.result {
            case .success:
                completion(true)
            case .failure(let error):
                print("Error occurred while deleting the pet: \(error.localizedDescription)")
                completion(false)
            }
        }
    }
}
