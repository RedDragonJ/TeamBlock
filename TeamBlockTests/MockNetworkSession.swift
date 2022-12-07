//
//  MockNetworkSession.swift
//  TeamBlock
//
//  Created by James Layton on 12/4/22.
//

import Foundation

class MockNetworkSession: NetworkInterfaces {
    func httpGetFromUrl(_ urlPath: String, completion: @escaping (Result<Data, Error>) -> Void) {
        if urlPath == "TestData" {
            let employee = Employee(id: "TestID", fullName: "TestName",
                                    phoneNumber: "1234567890", email: "test@test.com",
                                    biography: "TestBio",
                                    smallPhoto: "https://ww.google.com",
                                    largePhoto: "https://ww.google.com",
                                    team: "TestTeam", employeeType: .fullTime)
            let employees = Employees(employees: [employee])
            
            guard let encodedEmployee = try? JSONEncoder().encode(employees) else {
                return
            }
            completion(.success(encodedEmployee))
            
        } else if urlPath == "TestMalformedData" {
            let employee = Employee(id: "", fullName: "", phoneNumber: "", email: "", biography: nil, smallPhoto: nil, largePhoto: nil, team: "", employeeType: .fullTime)
            
            guard let encodedEmployee = try? JSONEncoder().encode([employee]) else {
                return
            }
            completion(.success(encodedEmployee))
            
        } else {
            let error = NSError(domain: K.InvalidStateError.domain,
                                code: K.InvalidStateError.code,
                                userInfo: [NSLocalizedDescriptionKey: "Mock API return an error"])
            completion(.failure(error))
        }
    }
}
