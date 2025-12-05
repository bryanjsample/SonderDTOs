//
//  TokenResponseDTO.swift
//  SonderDTOs
//
//  Created by Bryan Sample on 12/1/25.
//

public struct TokenResponseDTO: Codable, Sendable {
    public let needsToBeOnboarded: Bool
    public let userInGroup: Bool
    public let accessToken: AccessTokenDTO
    public let refreshToken: RefreshTokenDTO

    public init(
        needsToBeOnboarded: Bool = false,
        userInGroup: Bool = true,
        accessToken: AccessTokenDTO,
        refreshToken: RefreshTokenDTO
    ) {
        self.needsToBeOnboarded = needsToBeOnboarded
        self.userInGroup = userInGroup
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
}
