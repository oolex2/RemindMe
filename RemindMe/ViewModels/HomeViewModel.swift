//
//  HomeViewModel.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 19.07.2021.
//

import Foundation

final class HomeViewModel: BaseViewModel, Observable {
    
    let name: Observer = Observer<String>()
    
    let password: Observer = Observer<String>()
    
    let error: Observer = Observer<String>()
    
    func onChange() {
        if name.value != nil {
            if password.value != nil {
                error.value = "No error"
            }
            error.value = "Name is empty"
        }
        error.value = "Password is empty"
    }
}
