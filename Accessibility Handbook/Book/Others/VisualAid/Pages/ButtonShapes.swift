//
//  ButtonShapes.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 28/10/22.
//

import SwiftUI

struct ButtonShapesPage: View, Page {
  let title: String = L10n.ButtonShapes.title

  @Environment(\.accessibilityShowButtonShapes)
  var buttonShapesEnabled: Bool

  var body: some View {
    PageContent(next: BoldedTextPage()) {
      Group {
        intro
        example
        code
        reference
      }
      .toAny()
    }
  }
}

extension ButtonShapesPage {
  @ViewBuilder
  var intro: some View {
    Text(L10n.ButtonShapes.Intro.text1)
    Text(L10n.ButtonShapes.Intro.text2)
    Comment(L10n.ButtonShapes.Intro.comment1)
  }

  @ViewBuilder
  var example: some View {
    Text(L10n.ButtonShapes.Example.text1)
    ExternalLink(link: UIApplication.openSettingsURLString, title: L10n.openSettings)
    Comment(L10n.ButtonShapes.Example.comment1)

    Centered {
      VStack(alignment: .center, spacing: .large) {
        Button(L10n.button) { haptic(.selection) }
        Button {
          haptic(.selection)
        } label: {
          Asset.starryNight.swiftUIImage
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 300.0)
        }
        Button {
          haptic(.selection)
        } label: {
          VStack(spacing: .regular) {
            Text(L10n.Grouping.cellTitle)
              .font(.title)
            Text(L10n.Grouping.cellContent)
          }
        }
        .padding()
        .background {
          RoundedRectangle(cornerRadius: 8.0)
            .foregroundColor(.secondaryBackground)
        }
      }
      .toAny()
    }
  }

  @ViewBuilder
  var code: some View {
    Text(L10n.ButtonShapes.Code.text1)
    Code.uikit(
      """
      UIAccessibility.buttonShapesEnabled
      """
    )
    Code.swiftUI(
      """
      @Environment(\\.accessibilityShowButtonShapes)
      var accessibilityShowButtonShapes: Bool
      """
    )
  }

  @ViewBuilder
  var reference: some View {
    DocButton(link: "https://developer.apple.com/documentation/uikit/uiaccessibility/3618943-buttonshapesenabled", title: self.title)
  }
}
