//
//  CircleInvitationDTO.swift
//  SonderDTOs
//
//  Created by Bryan Sample on 12/11/25.
//

import Foundation

public struct CircleInvitationDTO: Codable, Sendable {

    public var invitation: String
    public var circleID: UUID
    public var expiresAt: Date
    public var revoked: Bool
    public init(
        invitation: String,
        circleID: UUID,
        expiresAt: Date,
        revoked: Bool
    ) {
        self.invitation = invitation
        self.circleID = circleID
        self.expiresAt = expiresAt
        self.revoked = revoked
    }

}
