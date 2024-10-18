//
//  User.swift
//  Domain
//
//  Created by khanhnvm-macbook on 25/6/24.
//

import Foundation

public protocol User: Codable {
    var uid: String { get }
    var username: String { get }
    var email: String { get }
}
