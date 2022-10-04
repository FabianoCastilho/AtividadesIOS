//
//  EditTextLargeTitle.swift
//  PokemonAPI
//
//  Created by user226746 on 10/4/22.
//

import SwiftUI

struct EditTextLargeTitle: ViewModifier {
    var y : CGFloat
    func body(content : Content) -> some View {
        content
            .bold()
            .font(.largeTitle)
            .fontWeight(.medium)
            .foregroundColor(.mint)
            .offset(y:-y)
    
    }
}
extension View {
    func editTextLargeTitle(y : CGFloat) -> some View {
        modifier(EditTextLargeTitle(y: y))
    }
}
