//
//  InputValidator.swift
//  SonderBackend
//
//  Created by Bryan Sample on 11/16/25.
//

import Foundation

enum InputValidator {

    static func validateUser(_ user: UserDTO) throws {
        try validateString(data: user.email, inputField: .email)
        try validateString(data: user.firstName, inputField: .name)
        try validateString(data: user.lastName, inputField: .name)
        if let username = user.username {
            try validateString(data: username, inputField: .username)
        }
        if let pictureUrl = user.pictureUrl {
            try validateString(data: pictureUrl, inputField: .url)
        }
    }

    static func validateCircle(_ circle: CircleDTO) throws {
        try validateString(data: circle.name, inputField: .title)
        try validateString(data: circle.description, inputField: .description)
        if let pictureUrl = circle.pictureUrl {
            try validateString(data: pictureUrl, inputField: .url)
        }
    }

    static func validatePost(_ post: PostDTO) throws {
        try validateString(data: post.content, inputField: .textBlock)
    }

    static func validateEvent(_ event: CalendarEventDTO) throws {
        try validateString(data: event.title, inputField: .title)
        try validateString(data: event.description, inputField: .description)
        guard event.startTime < event.endTime else {
            throw ValidationError("Event start time must be before it's end time", inputField: .dateTime)
        }
        guard Date() <= event.startTime else {
            throw ValidationError("Event cannot start in the past", inputField: .dateTime)
        }
    }

    static func validateComment(_ comment: CommentDTO) throws {
        try validateString(data: comment.content, inputField: .textBlock)
    }

    static func validateString(data: String, inputField: InputField) throws {
        func usesOauthHost() throws -> Bool {
            let oauthHosts = ["googleusercontent.com", "ggpht.com", "lh3.googleusercontent.com"]
            guard let components = URLComponents(string: trimmed) else {
                throw ValidationError("URL does not have valid components", inputField: inputField)
            }
            return oauthHosts.contains(components.host ?? "")
        }

        func validateRegex(newPattern: String? = nil) throws {
            let pattern = newPattern ?? inputField.regexPattern

            let regex = try NSRegularExpression(pattern: pattern, options: [.caseInsensitive])

            let range = NSRange(location: 0, length: trimmed.utf16.count)
            guard regex.firstMatch(in: trimmed, range: range) != nil else {
                throw ValidationError("Invalid \(inputField.description)", inputField: inputField)
            }
        }

        let trimmed = data.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !trimmed.isEmpty else {
            throw ValidationError("\(inputField.description) cannot be empty", inputField: inputField)
        }

        switch inputField.description {
        case "url":
            if try usesOauthHost() {
                // swiftlint:disable:next line_length
                let oauthPattern = #"^https?:\/\/[A-Za-z0-9]+(?:\.[A-Za-z0-9]+)*+(?:\/[^\s?#<>%]*)?(?:\?[^\s#<>%]*)?(?:#[^\s<>%]*)?$"#
                try validateRegex(newPattern: oauthPattern)
            } else {
                try validateRegex()
            }
        default:
            try validateRegex()
        }
    }

}

public struct ValidationError: Error, CustomStringConvertible {
    public let message: String
    public var description: String { message }
    public var inputField: InputField
    init(_ message: String, inputField: InputField) {
        self.message = message
        self.inputField = inputField
    }
}
