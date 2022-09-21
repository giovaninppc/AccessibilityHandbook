//
//  HintView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct HintView: View {
  let link: AnyView

  @Binding var hinting: Bool

  var body: some View {
    ZStack {
      Rectangle()
        .background(.thinMaterial)
        .opacity(0.5)
      VStack(alignment: .center, spacing: .regular) {
        HStack {
          Button {
            hinting = false
          } label: {
            Image(systemName: "xmark")
          }
          .accessibilityLabel(Text("Close Hint"))
          Spacer()
            .frame(maxWidth: 250.0)
        }
        Image(systemName: "lightbulb.fill")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 50.0, height: 50.0)
          .foregroundColor(.accentColor)
        Text("Having Trouble? 🤔")
          .font(.title.bold())
          .multilineTextAlignment(.center)
        .accessibilityHidden(true)
        Text("Maybe this documentation page can help you...")
          .multilineTextAlignment(.center)
        NavigationLink {
          link
        } label: {
          Text("Open Hint")
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
