//
//  Service.swift
//  ViewCodeAndMVVM
//
//  Created by IATec - Rodrigo Leme on 14/07/22.
//

import UIKit
import Alamofire

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}

enum Error: Swift.Error {
    case fileNotFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
    case errorRequest(AFError)
}

protocol ServiceDelegate: GenericService {
    func getUserFromJson(fromFileNamed name: String, completion: @escaping completion<UserResult?>)
    func getUser(completion: @escaping completion<UserResult?>)
}

class Service: ServiceDelegate {
    func getUser(completion: @escaping completion<UserResult?>) {
        let url: String = "https://run.mocky.io/v3/cc8af5b4-cf32-4894-b73f-52ab0348dea3"
        
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: UserResult.self) { response in
            print(#function)
            debugPrint(response)
            
            switch response.result {
            case .success(let success):
                print("sucesso -> \(#function)")
                completion(success,nil)
            case .failure(let error):
                print("erro -> \(#function)")
                completion(nil,Error.errorRequest(error))
            }
        }
    }
    
    func getUserFromJson(fromFileNamed name: String, completion: @escaping completion<UserResult?>) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "json") else {return completion(nil, Error.fileNotFound(name: name))}
        
        do {
            let data = try Data(contentsOf: url)
            let user = try JSONDecoder().decode(UserResult.self, from: data)
            completion(user,nil)
        } catch {
            completion(nil, Error.fileDecodingFailed(name: name, error))
        }
    }
}