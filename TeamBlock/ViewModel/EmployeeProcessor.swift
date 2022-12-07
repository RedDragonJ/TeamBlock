//
//  EmployeeProcessor.swift
//  TeamBlock
//
//  Created by James Layton on 12/2/22.
//

import Foundation

// NOTE: Simulation Only
enum SimulationSteps {
    case empty
    case malform
    case success
}

class EmployeeProcessor: ObservableObject {
    
    // NOTE: Simulation Only
    private var simulateSuccessAPICall: SimulationSteps = .empty
    
    private let networkSession: NetworkInterfaces
    
    init(networkSession: NetworkInterfaces = NetworkSession()) {
        self.networkSession = networkSession
    }
    
    @Published var employees = Employees()
    
    func sortedByNameAscending() {
        employees = Employees(employees: employees.employees.sorted())
    }
    
    func sortedByNameDescending() {
        employees = Employees(employees: employees.employees.sorted().reversed())
    }
    
    func sortedByTeamAscending() {
        let sortedByTeam = employees.employees.sorted { $0.team < $1.team }
        employees = Employees(employees: sortedByTeam)
    }
    
    func sortedByTeamDescending() {
        let sortedByTeam = employees.employees.sorted { $0.team > $1.team }
        employees = Employees(employees: sortedByTeam)
    }
    
    @MainActor
    func fetchEmployees() async throws {

        var baseURL = ""
        
        ////////////////////
        // NOTE: Simulation Only
        switch simulateSuccessAPICall {
        case .empty:
            baseURL = K.API.endpointWithEmptyData
            simulateSuccessAPICall = .malform
            
        case .malform:
            baseURL = K.API.endpointWithMalformedData
            simulateSuccessAPICall = .success
            
        case .success:
            baseURL = K.API.endpointWithData
        }
        ////////////////////

        employees = try await getEmployees(urlPath: baseURL)
    }
    
    /// A function to download employees information
    /// - Throws: Any errors that occured during the GET network call
    /// - Returns: A struct contains the decoded employees data
    func getEmployees(urlPath: String) async throws -> Employees {
        
        return try await withCheckedThrowingContinuation { continuation in
            networkSession.httpGetFromUrl(urlPath) { result in
                switch result {
                case .failure(let error):
                    continuation.resume(with: .failure(error))
                    
                case .success(let data):
                    do {
                        let employees = try JSONDecoder().decode(Employees.self, from: data)
                        continuation.resume(with: .success(employees))
                        
                    } catch DecodingError.keyNotFound(_, let context) {
                        let error = context.underlyingError ?? NSError(domain: K.InvalidStateError.domain,
                                                                       code: K.InvalidStateError.keyNotFoundCode,
                                                                       userInfo: [NSLocalizedDescriptionKey: "Missing JSON key"])
                        continuation.resume(with: .failure(error))

                    } catch DecodingError.valueNotFound(_, let context) {
                        let error = context.underlyingError ?? NSError(domain: K.InvalidStateError.domain,
                                                                       code: K.InvalidStateError.valueNotFoundCode,
                                                                       userInfo: [NSLocalizedDescriptionKey: "Missing JSON value"])
                        continuation.resume(with: .failure(error))
                        
                    } catch DecodingError.typeMismatch(_, let context) {
                        let error = context.underlyingError ?? NSError(domain: K.InvalidStateError.domain,
                                                                       code: K.InvalidStateError.typeMismatchCode,
                                                                       userInfo: [NSLocalizedDescriptionKey: "Wrong JSON value type"])
                        continuation.resume(with: .failure(error))
                        
                    } catch DecodingError.dataCorrupted(let context) {
                        let error = context.underlyingError ?? NSError(domain: K.InvalidStateError.domain,
                                                                       code: K.InvalidStateError.dataCorruptedCode,
                                                                       userInfo: [NSLocalizedDescriptionKey: "Corrupted API data"])
                        continuation.resume(with: .failure(error))
                        
                    } catch let error {
                        continuation.resume(with: .failure(error))
                    }
                }
            }
        }
    }
}
