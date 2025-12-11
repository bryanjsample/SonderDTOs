//
//  IncomingTokenDTO.swift
//  SonderDTOs
//
//  Created by Bryan Sample on 12/10/25.
//

public struct IncomingTokenDTO: Codable, Sendable {
    public var token: String

    public init(_ token: String) { self.token = token }
}
