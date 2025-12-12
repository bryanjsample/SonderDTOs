//
//  UserDTO.swift
//  SonderDTOs
//
//  Created by Bryan Sample on 11/14/25.
//

import Foundation

public struct UserDTO: Codable, Sendable {

    public var id: UUID?
    public var circleID: UUID?
    public var email: String
    public var firstName: String
    public var lastName: String
    public var username: String?
    public var pictureUrl: String?
    public var isOnboarded: Bool?

    public init(
        id: UUID? = nil,
        circleID: UUID? = nil,
        email: String,
        firstName: String,
        lastName: String,
        username: String? = nil,
        pictureUrl: String? = nil,
        isOnboarded: Bool? = nil
    ) {
        self.id = id
        self.circleID = circleID
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
        self.pictureUrl = pictureUrl
        self.isOnboarded = isOnboarded
    }

}

extension UserDTO {

    public func validateAndSanitize() throws -> UserDTO {
        try InputValidator.validateUser(self)
        let sanitizedDTO = InputSanitizer.sanitizeUser(self)
        return sanitizedDTO
    }
}
