//
//  InputSanitizer.swift
//  SonderBackend
//
//  Created by Bryan Sample on 11/16/25.
//

enum InputSanitizer {
    static func sanitizeUser(_ user: UserDTO) -> UserDTO {
        let id = user.id
        let email = sanitizeEmail(user.email)
        let firstName = sanitizeName(user.firstName)
        let lastName = sanitizeName(user.lastName)
        let username = sanitizeUsername(user.username)
        let pictureUrl = sanitizePictureUrl(user.pictureUrl)
        // swiftlint:disable:next line_length
        return UserDTO(id: id, email: email, firstName: firstName, lastName: lastName, username: username, pictureUrl: pictureUrl)
    }

    static func sanitizeCircle(_ circle: CircleDTO) -> CircleDTO {
        let id = circle.id
        let name = sanitizeTitle(circle.name)
        let description = sanitizeTextBlock(circle.description)
        let pictureUrl = sanitizePictureUrl(circle.pictureUrl)
        return CircleDTO(id: id, name: name, description: description, pictureUrl: pictureUrl)
    }

    static func sanitizePost(_ post: PostDTO) -> PostDTO {
        let id = post.id
        let circleID = post.circleID
        let authorID = post.authorID
        let content = sanitizeTextBlock(post.content)
        let createdAt = post.createdAt
        return PostDTO(id: id, circleID: circleID, authorID: authorID, content: content, createdAt: createdAt)
    }

    static func sanitizeEvent(_ event: CalendarEventDTO) -> CalendarEventDTO {
        let id = event.id
        let hostID = event.hostID
        let circleID = event.circleID
        let title = sanitizeTitle(event.title)
        let description = sanitizeTextBlock(event.description)
        let startTime = event.startTime
        let endTime = event.endTime
        let createdAt = event.createdAt
        // swiftlint:disable:next line_length
        return CalendarEventDTO(id: id, hostID: hostID, circleID: circleID, title: title, description: description, startTime: startTime, endTime: endTime, createdAt: createdAt)
    }

    static func sanitizeComment(_ comment: CommentDTO) -> CommentDTO {
        let id = comment.id
        let postID = comment.postID
        let authorID = comment.authorID
        let content = sanitizeTextBlock(comment.content)
        let createdAt = comment.createdAt
        return CommentDTO(id: id, postID: postID, authorID: authorID, content: content, createdAt: createdAt)
    }

    static func sanitizeName(_ name: String) -> String {
        let trimmedName = name.trimmingCharacters(in: .newlines)
        let components = trimmedName.split(separator: " ")
        let sanitizedName = components.map { part in
            part.prefix(1).uppercased() + part.dropFirst().lowercased()
        }.joined(separator: " ")
            .precomposedStringWithCanonicalMapping
        return sanitizedName
    }

    static func sanitizeEmail(_ email: String) -> String {
        email
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .lowercased()
    }

    static func sanitizeUsername(_ username: String?) -> String {
        if let user = username {
            return user
                .trimmingCharacters(in: .whitespacesAndNewlines)
        } else {
            return ""
        }
    }

    static func sanitizePictureUrl(_ pictureUrl: String?) -> String {
        if let url = pictureUrl {
            return url.trimmingCharacters(in: .whitespacesAndNewlines)
        } else {
            return ""
        }
    }

    static func sanitizeTitle(_ name: String) -> String {
        name
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }

    static func sanitizeTextBlock(_ textBlock: String) -> String {
        textBlock
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
