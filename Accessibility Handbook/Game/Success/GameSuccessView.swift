//
//  GameSuccessView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct GameSuccessView: View {
  @Environment(\.dismiss) var dismiss

  var body: some View {
    ZStack(alignment: .center) {
      Rectangle()
        .foregroundColor(.clear)
        .background(.thinMaterial)
        .opacity(0.7)
      VStack(spacing: .regular) {
        Text("Success!")
          .font(.title.bold())
        Text("You solved the puzzle!")
        Button {
          dismiss()
        } label: {
          Text("Go back")
        }
      }
      .padding()
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(.secondaryBackground)
      }
    }
    .accessibilityAddTraits(.isModal)
    .ignoresSafeArea()
  }
}
