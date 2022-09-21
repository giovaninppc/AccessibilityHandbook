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
    HStack(alignment: .center) {
      Link(title, destination: URL(string: link)!)
        .font(.callout.bold())
        .foregroundColor(.pink)
        .multilineTextAlignment(.leading)
      Spacer()
    }
  }
}
