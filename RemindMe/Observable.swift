//
//  Observable.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 19.07.2021.
//

import Foundation

class Observer<T> {
    
    var observer: Observable?
    
    public var value: T? {
        didSet {
            observer?.onChange()
        }
    }
}
