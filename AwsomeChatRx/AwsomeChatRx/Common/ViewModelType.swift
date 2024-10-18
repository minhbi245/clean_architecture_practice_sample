//
//  ViewModelType.swift
//  AwsomeChatRx
//
//  Created by khanhnvm on 11/7/24.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
