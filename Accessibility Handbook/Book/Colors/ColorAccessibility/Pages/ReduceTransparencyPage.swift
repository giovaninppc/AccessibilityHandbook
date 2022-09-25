//
//  ReduceTransparencyPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct ReduceTransparencyPage: View, Page {
  let title: String = L10n.ReduceTransparency.title

  @Environment(\.accessibilityReduceTransparency) var isReduceTransparencyEnabled

  var body: some View {
    PageContent(next: DifferentiateWithoutColorsPage()) {
      Group {
        intro
        example
        codeExample
      }
      .toAny()
    }
  }
}

private extension ReduceTransparencyPage {
  var intro: some View {
    Group {
      Text(L10n.ReduceTransparency.Intro.text1)
      ExternalLink(link: UIApplication.openSettingsURLString, title: L10n.openSettings)
      Text(L10n.ReduceTransparency.Intro.text2)
      Comment(L10n.ReduceTransparency.Intro.comment)
    }
  }

  var example: some View {
    Group {
      Text(L10n.ReduceTransparency.Example.text1)
      Centered {
        Text(L10n.ReduceTransparency.Example.example)
          .foregroundColor(.white.opacity(isReduceTransparencyEnabled ? 1.0 : 0.5))
          .fixedSize(horizontal: false, vertical: true)
          .padding()
          .background {
            if isReduceTransparencyEnabled {
              Rectangle()
                .foregroundColor(.indigo)
            } else {
              Asset.starryNight.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .blur(radius: 8.0)
            }
          }
          .clipped()
          .toAny()
      }
    }
  }

  var codeExample: some View {
    Group {
      Text(L10n.ReduceTransparency.Code.text1)
      uikit
      swiftUI
    }
  }

  var uikit: some View {
    Group {
      Text(L10n.ReduceTransparency.Code.text2)
      Code.uikit(
        """
        if UIAccessibility.isReduceTransparencyEnabled {
          // Handle transparency
        }
        """
      )
      Text(L10n.ReduceTransparency.Code.text3)
      Code.uikit(
        """
        NotificationCenter
        .default
        .addObserver(
            forName: UIAccessibility.reduceTransparencyStatusDidChangeNotification,
            object: nil,
            queue: nil
        ) {
          // Handle notification
        }
        """
      )
    }
  }

  var swiftUI: some View {
    Group {
      Text(L10n.ReduceTransparency.Code.text4)
      Code.swiftUI(
        """
        @Environment(\\.accessibilityReduceTransparency)
        var accessibilityReduceTransparency
        """
      )
    }
  }
}
