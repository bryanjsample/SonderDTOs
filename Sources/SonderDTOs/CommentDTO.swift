//
//  CommentDTO.swift
//  SonderDTOs
//
//  Created by Bryan Sample on 11/14/25.
//

import Foundation

public struct CommentDTO: Codable, Sendable {

    public var id: UUID?
    public var postID: UUID
    public var authorID: UUID
    public var content: String
    public var createdAt: Date?

    public init(
        id: UUID? = nil,
        postID: UUID,
        authorID: UUID,
        content: String,
        createdAt: Date? = nil
    ) {
        self.id = id
        self.postID = postID
        self.authorID = authorID
        self.content = content
        self.createdAt = createdAt
    }

}

extension CommentDTO {
    public func validateAndSanitize() throws -> CommentDTO {
        try InputValidator.validateComment(self)
        let sanitizedDTO = InputSanitizer.sanitizeComment(self)
        return sanitizedDTO
    }
}
