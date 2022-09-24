//
//  IncreaseContrastPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct IncreaseContrastPage: View, Page {
  var title: String = "Increase Contrast"

  let link = """
  https://developer.apple.com/documentation/uikit/uiaccessibilitycontrast
  """

  var body: some View {
    PageContent(next: nil) {
      Group {
        intro
        property
        swiftUI

      }
      .toAny()
    }
  }
}

private extension IncreaseContrastPage {
  var intro: some View {
    Group {
      Text("Another accessibility option the user can enable on the device's settings.")
      ExternalLink(link: UIApplication.openSettingsURLString, title: "Open settings")
      Text("This one is also kinda obvious, the user is requesting to enhance contrast between foreground and background colors, so it gets easier to distinguish between them.")
    }
  }

  var property: some View {
    Group {
      Title("Handling contrast changes")
      Text("An easy way to support this is by using 'System Colors'. They will automatically adapt to the increase contrast.")
      Comment("This app was built using system colors! Change the contrast options on your device's settings and check the differences!")
      Text("Or you can use the 'UIAccessibility.accessibilityDisplayShouldIncreaseContrast' boolen to check the current contrast state, and act accordingly.")
      Code.uikit(
        """
        if UIAccessibility.accessibilityDisplayShouldIncreaseContrast {
          // Handle
        }
        """
      )
      DocButton(link: link, title: title)
      VerticalSpace(.regular)
    }
  }

  var swiftUI: some View {
    Group {
      Text("And in SwiftUI, there is a neat contrast tool you can use to change the contrast on your views")
      VerticalSpace(.regular)
      example
      VerticalSpace(.regular)
      Code.swiftUI(
        """
        View()
        .contrast(<Double>)
        """
      )
      Comment("Not that I have really used this contrast tool in any real project.")
      DocButton(link: "https://developer.apple.com/documentation/swiftui/view/contrast(_:)/", title: "Contrast")
    }
  }

  var example: some View {
    Centered {
      ForEach(-1..<5) {
      Color.red.frame(width: 50, height: 50, alignment: .center)
        .overlay(circle, alignment: .center)
        .contrast(Double($0) * 0.25)
        .overlay(Text("\(Double($0) * 0.25 * 100, specifier: "%.0f")%")
          .font(.callout.bold()),
           alignment: .bottom)
        .border(Color.gray)
      }
      .toAny()
    }
  }

  var circle: some View {
    Circle()
      .fill(Color.green)
      .frame(width: 25, height: 25, alignment: .center)
  }
}

