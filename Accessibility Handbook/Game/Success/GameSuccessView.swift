//
//  GameSuccessView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct GameSuccessView: View {
  let page: AnyView

  @Environment(\.dismiss) var dismiss

  var body: some View {
    ZStack(alignment: .center) {
      Rectangle()
        .foregroundColor(.clear)
        .background(.thinMaterial)
        .opacity(0.7)
      VStack(spacing: .regular) {
        Text("Congratulations!")
          .font(.title.bold())
        Text("You solved the puzzle!")
        VerticalSpace(.regular)
        Text("If you want to learn more about this puzzle check our documentation")
          .multilineTextAlignment(.center)
        NavigationLink("Suggested reading") {
          page
        }
        Button {
          dismiss()
        } label: {
          Text("Go back")
            .font(.body.bold())
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
    .onAppear {
      haptic(.success)
    }
  }
}
