//
//  EditTextTitle.swift
//  PokemonAPI
//
//  Created by user226746 on 10/4/22.
//

import SwiftUI

struct EditTextTitle: ViewModifier {
    var font: Font
    var color: Color
    func body(content : Content) -> some View {
        content
            .bold()
            .font(font)
            .fontWeight(.medium)
            .foregroundColor(color)
    }
}
extension View {
    func editTextTitle(_ font1: Font, _ color1 : Color ) -> some View {
        modifier(EditTextTitle(font: font1, color: color1 ))
    }
}
