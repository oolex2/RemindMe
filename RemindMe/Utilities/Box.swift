//
//  Box.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 19.07.2021.
//

import Foundation

final class Box<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    //MARK: - Initialization
    
    init(_ value: T) {
        self.value = value
    }
    
    //MARK: - Public
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
