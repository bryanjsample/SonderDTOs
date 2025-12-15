//
//  InvitationStringDTO.swift
//  SonderDTOs
//
//  Created by Bryan Sample on 12/11/25.
//

public struct InvitationStringDTO: Codable, Sendable, SonderDTO {
    public var invitation: String

    public init(_ invitation: String) { self.invitation = invitation }
}
