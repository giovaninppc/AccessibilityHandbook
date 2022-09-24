//
//  ReduceTransparencyPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct ReduceTransparencyPage: View, Page {
  var title: String = "Reduce Transparency"

  @Environment(\.accessibilityReduceTransparency) var isReduceTransparencyEnabled

  var body: some View {
    PageContent(next: DifferentiateWithoutColorsPage()) {
      Group {
        Text("This is an accessibility option that needs to be enabled on the Device's settings.")
        ExternalLink(link: UIApplication.openSettingsURLString, title: "Open settings")
        Text("When enabled, the user want's to tell you they want to reduce the amount of blur and translucency on the app.")
        Comment("Some poeple may have a hard time looking into translucent elements!")
        example
        Text("And, it's pretty easy to handle!")
        uikit
        swiftUI
      }
      .toAny()
    }
  }
}

private extension ReduceTransparencyPage {
  var example: some View {
    Group {
      Text("Try enabling and disabling this option and check the content below.")
      Centered {
        Text("Transparent content to be read\non top of a blured background")
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

  var uikit: some View {
    Group {
      Text("On UIKit, you need to check a boolean on UIAccessibility to check if the feature is enabled.")
      Code.uikit(
        """
        if UIAccessibility.isReduceTransparencyEnabled {
          // Handle transparency
        }
        """
      )
      Text("And you can alo subscribe to listen to changes in this prtoperty using the Notification Center.")
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
      Text("And on SwiftUI you can use an Environment variable!")
      Code.swiftUI(
        """
        @Environment(\\.accessibilityReduceTransparency)
        var accessibilityReduceTransparency
        """
      )
    }
  }
}
