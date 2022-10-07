//
//  Citation.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 07/10/22.
//

import SwiftUI

struct Citation: View {
  let text: String

  init(_ text: String) {
    self.text = text
  }

  var body: some View {
    Centered {
      Text("\" " + text + "\"")
        .font(.body.italic())
        .foregroundColor(.primary)
        .toAny()
    }
  }
}
