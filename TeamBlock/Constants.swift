//
//  Constants.swift
//  TeamBlock
//
//  Created by James Layton on 12/2/22.
//

struct K {
    
    struct API {
        // The APIs are from one of the interview project
        static let endpointWithData = "https://s3.amazonaws.com/sq-mobile-interview/employees.json"
        static let endpointWithMalformedData = "https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json"
        static let endpointWithEmptyData = "https://s3.amazonaws.com/sq-mobile-interview/employees_empty.json"
    }
    
    struct InvalidStateError {
        static let domain = "com.james.TeamBlock"
        static let code = 999
        static let keyNotFoundCode = 998
        static let valueNotFoundCode = 997
        static let typeMismatchCode = 996
        static let dataCorruptedCode = 995
    }
    
    struct Alert {
        static let errorTitle = "Error"
        static let decodingErrorMessage = "Decoding error: %@"
    }
    
    struct Icon {
        static let noEmployees = "exclamationmark.octagon.fill"
        static let employeePlaceholder = "person.circle.fill"
    }
}
