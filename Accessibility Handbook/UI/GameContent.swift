//
//  GameContent.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct GameContent: View {
  @Binding var success: Bool
  @Binding var hinting: Bool

  let content: () -> AnyView
  let link: () -> AnyView

  var body: some View {
    ZStack {
      content()

      if success {
        GameSuccessView()
      }

      if hinting {
        HintView(link: link(), hinting: $hinting)
      }
    }
    .toolbar {
      Button {
        withAnimation {
          hinting = !hinting
        }
      } label: {
        Image(systemName: "lightbulb.fill")
      }
    }
  }
}
