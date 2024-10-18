//
//  User.swift
//  Platform
//
//  Created by khanhnvm-macbook on 25/6/24.
//

import Foundation
import Domain

struct UserImp: Domain.User, Codable {
    var uid: String
    var username: String
    var email: String
}
