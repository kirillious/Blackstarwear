//
//  APICall.swift
//  BlackstarWear
//
//  Created by Kirill on 27.05.2021.
//

import Foundation

class APICall {
    
    static let shared = APICall()
    
    func fetchGenericData<T:Decodable>(urlString: String, completion: @escaping (T) -> Void) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, resp, err) in
            if let data = data {
                do {
                    let obj = try JSONDecoder().decode(T.self, from: data)
                    completion(obj)
                } catch let jsonErr {
                    print("Failed to decode", jsonErr)
                }
            }
        }.resume()
    }

}
    
