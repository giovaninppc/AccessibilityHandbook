//
//  InternalLink.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct InternalLink: View {
  let page: AnyView
  let title: String

  var body: some View {
    HStack(alignment: .center) {
      NavigationLink {
        page
      } label: {
        Text(title)
          .font(.callout.bold())
          .foregroundColor(.green)
          .multilineTextAlignment(.center)
      }
      Spacer()
    }
  }
}
