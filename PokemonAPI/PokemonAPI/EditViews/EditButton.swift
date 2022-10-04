//
//  EditButton.swift
//  PokemonAPI
//
//  Created by user226746 on 10/4/22.
//

import SwiftUI

struct EditButton: ViewModifier {
    var color : Color
    func body(content : Content) -> some View {
        content
            .tint(color)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.regular)
    }
}
extension View {
    func editButton(color: Color) -> some View {
        modifier(EditButton(color: color))
    }
}

