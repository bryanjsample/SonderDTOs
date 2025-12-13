//
//  RefreshTokenDTO.swift
//  SonderDTOs
//
//  Created by Bryan Sample on 12/1/25.
//

import Foundation

public struct RefreshTokenDTO: Codable, Sendable, SonderDTO {
    public var token: String
    public var ownerID: UUID
    public var expiresAt: Date
    public var revoked: Bool

    public init(
        token: String,
        ownerID: UUID,
        expiresAt: Date,
        revoked: Bool
    ) {
        self.token = token
        self.ownerID = ownerID
        self.expiresAt = expiresAt
        self.revoked = revoked
    }
}
