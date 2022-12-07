//
//  EmployeesData.swift
//  TeamBlock
//
//  Created by James Layton on 12/2/22.
//

enum EmployeeType: String, Codable {
    case fullTime = "FULL_TIME"
    case partTime = "PART_TIME"
    case contractor = "CONTRACTOR"
}

struct Employees: Codable {
    var employees = [Employee]()
}

struct Employee: Identifiable, Comparable {
    
    static func < (lhs: Employee, rhs: Employee) -> Bool {
        lhs.fullName < rhs.fullName
    }
    
    var id: String
    let fullName: String
    let phoneNumber: String?
    let email: String
    let biography: String?
    let smallPhoto: String?
    let largePhoto: String?
    let team: String
    var employeeType: EmployeeType
    
    enum EmployeeKeys: String, CodingKey {
        case uuid = "uuid"
        case fullName = "full_name"
        case phoneNumber = "phone_number"
        case email = "email_address"
        case biography
        case smallPhoto = "photo_url_small"
        case largePhoto = "photo_url_large"
        case team
        case employeeType = "employee_type"
    }
}

extension Employee: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: EmployeeKeys.self)
        try container.encode(id, forKey: .uuid)
        try container.encode(fullName, forKey: .fullName)
        try container.encode(phoneNumber, forKey: .phoneNumber)
        try container.encode(email, forKey: .email)
        try container.encode(biography, forKey: .biography)
        try container.encode(smallPhoto, forKey: .smallPhoto)
        try container.encode(largePhoto, forKey: .largePhoto)
        try container.encode(team, forKey: .team)
        try container.encode(employeeType, forKey: .employeeType)
    }
}

extension Employee: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: EmployeeKeys.self)
        id = try container.decode(String.self, forKey: .uuid)
        fullName = try container.decode(String.self, forKey: .fullName)
        phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber)
        email = try container.decode(String.self, forKey: .email)
        biography = try container.decodeIfPresent(String.self, forKey: .biography)
        smallPhoto = try container.decodeIfPresent(String.self, forKey: .smallPhoto)
        largePhoto = try container.decodeIfPresent(String.self, forKey: .largePhoto)
        team = try container.decode(String.self, forKey: .team)
        
        let type = try container.decode(String.self, forKey: .employeeType)
        employeeType = EmployeeType(rawValue: type)!
    }
}
