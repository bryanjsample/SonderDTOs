//
//  TokenResponseDTO.swift
//  SonderDTOs
//
//  Created by Bryan Sample on 12/1/25.
//

public struct TokenResponseDTO: Codable, Sendable, SonderDTO {
    public let userIsOnboarded: Bool?
    public let userInCircle: Bool?
    public let accessToken: AccessTokenDTO
    public let refreshToken: RefreshTokenDTO

    public init(
        userIsOnboarded: Bool? = nil,
        userInCircle: Bool? = nil,
        accessToken: AccessTokenDTO,
        refreshToken: RefreshTokenDTO
    ) {
        self.userIsOnboarded = userIsOnboarded
        self.userInCircle = userInCircle
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
}
