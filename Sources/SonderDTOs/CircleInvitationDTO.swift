//
//  CircleInvitationDTO.swift
//  SonderDTOs
//
//  Created by Bryan Sample on 12/11/25.
//

import Foundation

public struct CircleInvitationDTO: Codable, Sendable {

    public var invitation: String

    public init(_ invitation: String) { self.invitation = invitation }

}

extension CircleInvitationDTO {
    public func validateAndSanitize() throws -> CircleInvitationDTO? {
//        try InputValidator.validateComment(self)
//        let sanitizedDTO = InputSanitizer.sanitizeComment(self)
//        return sanitizedDTO
        return nil
    }
}
