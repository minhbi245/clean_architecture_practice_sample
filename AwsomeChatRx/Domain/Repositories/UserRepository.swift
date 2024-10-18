//
//  UserRepository.swift
//  Domain
//
//  Created by khanhnvm-macbook on 3/7/24.
//

import Foundation
import RxSwift

public protocol UserRepository {
    func login(email: String, password: String) -> Observable<User>
    func register(email: String, password: String, displayName: String) -> Observable<User>
}
