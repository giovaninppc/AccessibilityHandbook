//
//  ExteernalLink.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct ExternalLink: View {
  let link: String
  let title: String

  var body: some View {
    HStack() {
      if let url = URL(string: link) {
        Link(destination: url) {
          Text(title)
            .font(.callout.bold())
            .foregroundColor(.pink)
            .multilineTextAlignment(.leading)
        }
      }
      Spacer()
    }
  }
}
