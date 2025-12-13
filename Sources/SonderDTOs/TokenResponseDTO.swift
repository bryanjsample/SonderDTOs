//
//  TokenResponseDTO.swift
//  SonderDTOs
//
//  Created by Bryan Sample on 12/1/25.
//

public struct TokenResponseDTO: Codable, Sendable, SonderDTO {
    public let userNeedsToBeOnboarded: Bool?
    public let userInCircle: Bool?
    public let accessToken: AccessTokenDTO
    public let refreshToken: RefreshTokenDTO

    public init(
        userNeedsToBeOnboarded: Bool? = nil,
        userInCircle: Bool? = nil,
        accessToken: AccessTokenDTO,
        refreshToken: RefreshTokenDTO
    ) {
        self.userNeedsToBeOnboarded = userNeedsToBeOnboarded
        self.userInCircle = userInCircle
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
}
