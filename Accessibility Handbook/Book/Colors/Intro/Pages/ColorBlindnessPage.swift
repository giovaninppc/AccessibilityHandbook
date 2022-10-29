//
//  ColorBlindness.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct ColorBlindnessPage: View, Page {
  let title: String = L10n.ColorBlind.title

  var body: some View {
    PageContent(next: ContrastPage(), deeplink: deeplink) {
      Group {
        intro
        handlingColorblindColors
        carefulWithImages
      }
      .toAny()
    }
  }
}

private extension ColorBlindnessPage {
  var intro: some View {
    Group {
      Text(L10n.ColorBlind.About.text1)
      ExternalLink(link: "https://en.wikipedia.org/wiki/Color_blindness", title: L10n.moreOnWikipedia)
      Text(L10n.ColorBlind.About.text2)
      Text(L10n.ColorBlind.About.text3)
      Centered {
        Asset.ishihara.swiftUIImage
          .resizable()
          .aspectRatio(contentMode: .fit)
          .accessibilityLabel(L10n.ColorBlind.About.ishihara)
          .toAny()
      }
      Comment(L10n.ColorBlind.About.comment)
      ExternalLink(link: "https://en.wikipedia.org/wiki/Ishihara_test", title: L10n.ColorBlind.About.ishiharaTest)
      Text(L10n.ColorBlind.About.text4)
    }
  }

  var handlingColorblindColors: some View {
    Group {
      VerticalSpace(.regular)
      Title(L10n.ColorBlind.Handle.title)
      Text(L10n.ColorBlind.Handle.text1)
      Centered {
        Group {
          VStack(alignment: .leading, spacing: .regular) {
            Text(L10n.freeShipping)
              .foregroundColor(.green)
            Text(L10n.additionalCost)
              .foregroundColor(.red)
            Text(L10n.earlyAccess)
              .foregroundColor(.green)
            Text(L10n.extraBureaucracy)
              .foregroundColor(.red)
          }
          .accessibilityElement(children: .combine)
          HorizontalSpace(.regular)
          Rectangle()
            .frame(width: .single)
            .foregroundColor(.secondaryBackground)
          HorizontalSpace(.regular)
          VStack(alignment: .leading, spacing: .regular) {
            (Text(Icon.plus) + Text(String.space + L10n.freeShipping))
              .foregroundColor(.green)
            (Text(Icon.minus) + Text(String.space + L10n.additionalCost))
              .foregroundColor(.red)
            (Text(Icon.plus) + Text(String.space + L10n.earlyAccess))
              .foregroundColor(.green)
            (Text(Icon.minus) + Text(String.space + L10n.extraBureaucracy))
              .foregroundColor(.red)
          }
        }
        .toAny()
      }
      Text(L10n.ColorBlind.Handle.text2)
      Comment(L10n.ColorBlind.Handle.comment1)
      Comment(L10n.ColorBlind.Handle.comment2)
      InternalLink(page: DifferentiateWithoutColorsPage().page, title: L10n.Differentiate.title)
    }
  }

  var carefulWithImages: some View {
    Group {
      VerticalSpace(.regular)
      Title(L10n.ColorBlind.Images.title)
      Text(L10n.ColorBlind.Images.text1)
      Comment(L10n.ColorBlind.Images.comment)
      InternalLink(page: AccessibilityLabelPage().page, title: L10n.AccLabel.title)
      Text(L10n.ColorBlind.Images.text2)
    }
  }
}
