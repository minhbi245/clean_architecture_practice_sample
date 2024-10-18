//
//  ChatMessage.swift
//  Platform
//
//  Created by khanhnvm-macbook on 25/6/24.
//

import Foundation
import Domain

struct ChatMessage: Domain.ChatMessage, Codable {
    var id: String
    var chatId: String
    var senderId: String
    var content: String
    var isRead: Bool
    var timestamp: Date
}
