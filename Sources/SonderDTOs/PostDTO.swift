//
//  PostDTO.swift
//  SonderDTOs
//
//  Created by Bryan Sample on 11/14/25.
//

import Foundation

public struct PostDTO: Codable, Sendable, SonderDTO {

    public var id: UUID?
    public var circleID: UUID
    public var authorID: UUID
    public var content: String
    public var createdAt: Date?

    public init(
        id: UUID? = nil,
        circleID: UUID,
        authorID: UUID,
        content: String,
        createdAt: Date?
    ) {
        self.id = id
        self.circleID = circleID
        self.authorID = authorID
        self.content = content
        self.createdAt = createdAt
    }

}

extension PostDTO {
    public func validateAndSanitize() throws -> PostDTO {
        try InputValidator.validatePost(self)
        let sanitizedDTO = InputSanitizer.sanitizePost(self)
        return sanitizedDTO
    }
}
