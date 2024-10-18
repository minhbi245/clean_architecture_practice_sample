//
//  Chat.swift
//  Domain
//
//  Created by khanhnvm-macbook on 4/7/24.
//

import Foundation

public protocol Chat: Codable {
    var id: String { get }
    var participants: [User] { get }
    var lastMessage: ChatMessage? { get }
    var createdAt: Date { get }
    var updatedAt: Date { get }
}
