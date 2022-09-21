//
//  Centered.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct Centered: View {
  let content: () -> AnyView

  init(_ content: @escaping () -> AnyView) {
    self.content = content
  }

  var body: some View {
    HStack {
      Spacer()
      content()
      Spacer()
    }
  }
}
