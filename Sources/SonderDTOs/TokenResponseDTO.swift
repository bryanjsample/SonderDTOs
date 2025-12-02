//
//  TokenResponseDTO.swift
//  SonderDTOs
//
//  Created by Bryan Sample on 12/1/25.
//

public struct TokenResponseDTO: Codable, Sendable {
    public let accessToken: AccessTokenDTO
    public let refreshToken: RefreshTokenDTO

    public init(
        accessToken: AccessTokenDTO,
        refreshToken: RefreshTokenDTO
    ) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
}
