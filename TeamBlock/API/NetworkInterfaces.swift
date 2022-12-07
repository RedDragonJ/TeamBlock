//
//  NetworkInterfaces.swift
//  TeamBlock
//
//  Created by James Layton on 12/2/22.
//

import Foundation

protocol NetworkInterfaces {
    func httpGetFromUrl(_ urlPath: String, completion: @escaping (Result<Data, Error>) -> Void)
}
