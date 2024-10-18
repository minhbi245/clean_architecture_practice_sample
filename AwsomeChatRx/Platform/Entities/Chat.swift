//
//  Chat.swift
//  Platform
//
//  Created by khanhnvm-macbook on 4/7/24.
//

import Foundation
import Domain
import UIKit

struct Chat: Domain.Chat, Codable, Equatable {
    var participants: [Domain.User]
    var lastMessage: Domain.ChatMessage?
    var id: String
    var timestamp: Date
    var createdAt: Date
    var updatedAt: Date

    enum CodingKeys: String, CodingKey {
        case id
        case participants
        case lastMessage
        case timestamp
        case createdAt
        case updatedAt
    }

    init(id: String, participants: [Domain.User], lastMessage: Domain.ChatMessage? = nil, timestamp: Date = Date(), createdAt: Date = Date(), updatedAt: Date = Date()) {
        self.id = id
        self.participants = participants
        self.lastMessage = lastMessage
        self.timestamp = timestamp
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        timestamp = try container.decode(Date.self, forKey: .timestamp)
        createdAt = try container.decode(Date.self, forKey: .createdAt)
        updatedAt = try container.decode(Date.self, forKey: .updatedAt)

        // Manual decoding for participants
        let participantsData = try container.decode([Data].self, forKey: .participants)
        participants = try participantsData.map { data in
            let decoder = JSONDecoder()
            return try decoder.decode(UserImp.self, from: data) as Domain.User
        }

        // Decode lastMessage if present
        if let messageData = try container.decodeIfPresent(Data.self, forKey: .lastMessage) {
            let decoder = JSONDecoder()
            lastMessage = try decoder.decode(ChatMessage.self, from: messageData) as Domain.ChatMessage
        } else {
            lastMessage = nil
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(timestamp, forKey: .timestamp)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)

        // Manual encoding for participants
        let participantsData = try participants.map { user -> Data in
            let encoder = JSONEncoder()
            return try encoder.encode(user as! UserImp)
        }
        try container.encode(participantsData, forKey: .participants)

        // Encode lastMessage if present
        if let lastMessage = lastMessage {
            let encoder = JSONEncoder()
            let messageData = try encoder.encode(lastMessage as! ChatMessage)
            try container.encode(messageData, forKey: .lastMessage)
        }
    }

    static func == (lhs: Chat, rhs: Chat) -> Bool {
        return lhs.id == rhs.id
    }
}
