//
//  FeedResponseDTO.swift
//  SonderDTOs
//
//  Created by Bryan Sample on 11/20/25.
//

public struct FeedResponseDTO: Codable, Sendable, SonderDTO {
    public let items: [FeedItemDTO]
//    let nextCursor: String?

    public init(items: [FeedItemDTO]) {
        self.items = items
    }
}
