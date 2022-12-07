//
//  AlertDetails.swift
//  TeamBlock
//
//  Created by James Layton on 12/3/22.
//

import SwiftUI

struct AlertDetails: Identifiable {
    let id: UUID
    let title: String
    let message: String
    let buttons: [Button]
    
    init(title: String, message: String, buttons: [Button] = []) {
        id = UUID()
        self.title = title
        self.message = message
        self.buttons = !buttons.isEmpty ? buttons : [Button(title: "Ok", role: .cancel) {
            // Do nothing
        }]
    }
    
    struct Button {
        let title: String
        let role: ButtonRole
        let action: () -> Void
    }
}

extension Notification.Name {
    static let showAlert = Notification.Name("showAlert")
}

extension NotificationCenter {
    func showAlert(_ object: AlertDetails) {
        post(name: .showAlert, object: object)
    }
}
