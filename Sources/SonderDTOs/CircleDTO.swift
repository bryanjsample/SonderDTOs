//
//  CircleDTO.swift
//  SonderDTOs
//
//  Created by Bryan Sample on 11/14/25.
//

import Foundation

public struct CircleDTO: Codable, Sendable {

    public var id: UUID?
    public var name: String
    public var description: String
    public var pictureUrl: String?

    public init(
        id: UUID? = nil,
        name: String,
        description: String,
        pictureUrl: String? = nil
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.pictureUrl = pictureUrl
    }
}

extension CircleDTO {
    init() {
        self.id = nil
        self.name = ""
        self.description = ""
        self.pictureUrl = nil
    }

    public func validateAndSanitize() throws -> CircleDTO {
        try InputValidator.validateCircle(self)
        let sanitizedDTO = InputSanitizer.sanitizeCircle(self)
        return sanitizedDTO
    }
}
