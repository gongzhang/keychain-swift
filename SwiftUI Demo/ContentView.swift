//
//  ContentView.swift
//  SwiftUI Demo
//
//  Created by Gong Zhang on 2024/12/5.
//  Copyright © 2024 Evgenii Neumerzhitckii. All rights reserved.
//

import SwiftUI
import KeychainSwift

let TegKeychainDemo_keyName = "my key"

struct ContentView: View {
    
    @State private var message = ""
    @State private var keychain = KeychainSwift()
    
    var body: some View {
        VStack {
            Button("Save", action: save)
            Button("Save Invisible", action: saveInvisible)
            Button("Delete", action: delete)
            Button("Get", action: get)
            
            Text(message)
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
    
    func save() {
        keychain.set("Hello", forKey: TegKeychainDemo_keyName, withAccess: .accessibleAfterFirstUnlock)
        message = "Result code: \(keychain.lastResultCode)"
    }
    
    func saveInvisible() {
        let keychain = KeychainSwift()
        keychain.isInvisible = true
        keychain.set("Hello (Invisible)", forKey: TegKeychainDemo_keyName, withAccess: .accessibleAfterFirstUnlock)
        message = "Result code: \(keychain.lastResultCode)"
    }
    
    func delete() {
        keychain.delete(TegKeychainDemo_keyName)
        message = "Result code: \(keychain.lastResultCode)"
    }
    
    func get() {
        if let value = keychain.get(TegKeychainDemo_keyName) {
            message = "In Keychain: \(value)"
        } else {
            message = "no value in keychain"
        }
    }

}

#Preview {
    ContentView()
}
