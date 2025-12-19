//
//  CalendarEventDTO.swift
//  SonderDTOs
//
//  Created by Bryan Sample on 11/14/25.
//

import Foundation

public struct CalendarEventDTO: Codable, Sendable, SonderDTO, Identifiable {
    public var id: UUID?
    public var hostID: UUID
    public var circleID: UUID
    public var title: String
    public var description: String
    public var startTime: Date
    public var endTime: Date
    public var createdAt: Date?

    public init(
        id: UUID? = nil,
        hostID: UUID,
        circleID: UUID,
        title: String,
        description: String,
        startTime: Date,
        endTime: Date,
        createdAt: Date? = nil
    ) {
        self.id = id
        self.hostID = hostID
        self.circleID = circleID
        self.title = title
        self.description = description
        self.startTime = startTime
        self.endTime = endTime
        self.createdAt = createdAt
    }
}

extension CalendarEventDTO {
    public func validateAndSanitize() throws -> CalendarEventDTO {
        try InputValidator.validateEvent(self)
        let sanitizedDTO = InputSanitizer.sanitizeEvent(self)
        return sanitizedDTO
    }
}
