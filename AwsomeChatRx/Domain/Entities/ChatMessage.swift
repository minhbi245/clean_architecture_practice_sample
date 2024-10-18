//
//  ChatMessage.swift
//  Domain
//
//  Created by khanhnvm-macbook on 25/6/24.
//

import Foundation

public protocol ChatMessage: Codable {
    var id: String { get }
    var chatId: String { get }
    var senderId: String { get }
    var content: String { get }
    var timestamp: Date { get }
    var isRead: Bool { get }
}
