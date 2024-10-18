//
//  UserRepository.swift
//  Platform
//
//  Created by khanhnvm-macbook on 3/7/24.
//

import Foundation
import RxSwift
import Domain

public final class UserRepository: Domain.UserRepository {
    private let remoteDataSource: UserRemoteDataSource

    public init(remoteDataSource: UserRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    public func login(email: String, password: String) -> Observable<Domain.User> {
        return remoteDataSource.login(email: email, password: password)

    }

    public func register(email: String, password: String, displayName: String) -> Observable<Domain.User> {
        return remoteDataSource.register(email: email, password: password, displayName: displayName)
    }
}
