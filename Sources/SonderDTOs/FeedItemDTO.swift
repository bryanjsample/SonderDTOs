//
//  FeedItemDTO.swift
//  SonderDTOs
//
//  Created by Bryan Sample on 11/20/25.
//

import Foundation

public enum FeedItemDTO: Codable, Sendable, SonderDTO {
    case post(PostDTO)
    case event(CalendarEventDTO)

    public enum CodingKeys: String, CodingKey {
        case type
        case post
        case event
    }

    public enum ItemType: String, Codable {
        case post
        case event
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(ItemType.self, forKey: .type)
        switch type {
        case .post:
            let value = try container.decode(PostDTO.self, forKey: .post)
            self = .post(value)
        case .event:
            let value = try container.decode(CalendarEventDTO.self, forKey: .event)
            self = .event(value)
        }
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .post(let dto):
            try container.encode(ItemType.post, forKey: .type)
            try container.encode(dto, forKey: .post)
        case .event(let dto):
            try container.encode(ItemType.event, forKey: .type)
            try container.encode(dto, forKey: .event)
        }
    }

    public var createdAt: Date? {
        switch self {
        case .post(let post): return post.createdAt
        case .event(let event): return event.createdAt
        }
    }
}
