//
//  RemoteDataSource.swift
//  Platform
//
//  Created by khanhnvm-macbook on 3/7/24.
//

import Foundation
import RxSwift
import FirebaseFirestore
import FirebaseAuth
import Domain

public final class UserRemoteDataSource {
    let db = Firestore.firestore()
    
    public init() {}
    
    func login(email: String, password: String) -> Observable<Domain.User> {
        return Observable.create { observer in
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if let error = error {
                    observer.onError(error)
                } else if let user = result?.user {
                    let appUser =  UserImp(uid: user.uid, username: user.displayName ?? "", email: user.email ?? "")
                    observer.onNext(appUser)
                    observer.onCompleted()
                }
            }
            return Disposables.create()
        }
    }

    func register(email: String, password: String, displayName: String) -> Observable<Domain.User> {
        return Observable.create { observer in
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if let error = error {
                    observer.onError(error)
                    return
                }

                guard let firebaseUser = authResult?.user else {
                    observer.onError(NSError(domain: "Registration", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to get user after registration"]))
                    return
                }

                let changeRequest = firebaseUser.createProfileChangeRequest()
                changeRequest.displayName = displayName

                changeRequest.commitChanges { (error) in
                    if let error = error {
                        observer.onError(error)
                        return
                    }

                    let user = UserImp(uid: firebaseUser.uid, username: firebaseUser.displayName ?? "", email: firebaseUser.email ?? "")
                    observer.onNext(user)
                    observer.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
}
