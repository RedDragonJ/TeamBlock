//
//  NetworkSession.swift
//  TeamBlock
//
//  Created by James Layton on 12/2/22.
//

import Foundation

class NetworkSession: NetworkInterfaces {
    
    func httpGetFromUrl(_ urlPath: String, completion: @escaping (Result<Data, Error>) -> Void) {
        
        guard let url = URL(string: urlPath) else {
            let error = NSError(domain: K.InvalidStateError.domain,
                                code: K.InvalidStateError.code,
                                userInfo: [NSLocalizedDescriptionKey: "Failed to form URL with string"])
            completion(.failure(error))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            // NOTE: Deal other potential HTTPURLResponse
            
            if let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }

            if let response, let httpURLResponse = response as? HTTPURLResponse {
                DispatchQueue.main.async {
                    if httpURLResponse.statusCode == 200 {
                        if let data {
                            completion(.success(data))
                        }
                    } else {
                        // Other potential data or error cases
                    }
                }
            } else {
                let error = NSError(domain: "", code: 999, userInfo: [NSLocalizedDescriptionKey: ""])
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
                        
        }.resume()
    }
}
