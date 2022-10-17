//
//  DarkModePage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 07/10/22.
//

import SwiftUI

struct WhatIsDarkModePage: View, Page {
  let title: String = L10n.WhatIsDarkMode.title

  @Environment(\.colorScheme) var colorScheme

  var body: some View {
    PageContent(next: AppearancesPage()) {
      Group {
        intro
        doINeedIt
        thisAppSupportsIt

        DocButton(link: "https://developer.apple.com/design/human-interface-guidelines/foundations/dark-mode/", title: L10n.darkMode)
      }
      .toAny()
    }
  }
}

private extension WhatIsDarkModePage {
  var intro: some View {
    Group {
      Text(L10n.WhatIsDarkMode.Intro.text1)
      Comment(L10n.WhatIsDarkMode.Intro.comment1)
      VerticalSpace(.regular)
      example
      current
      VerticalSpace(.regular)
      Text(L10n.WhatIsDarkMode.Intro.text2)
      Text(L10n.WhatIsDarkMode.Intro.text3)
      Comment(L10n.WhatIsDarkMode.Intro.comment2)
      InternalLink(page: InvertColorsPage().page, title: L10n.InvertColors.title)
    }
  }

  var example: some View {
    Centered {
      HStack(spacing: .large) {
        Text(L10n.darkMode)
          .foregroundColor(.white)
          .padding()
          .background {
            RoundedRectangle(cornerRadius: 6.0)
              .foregroundColor(.black)
              .border(.white)
          }
        Text(L10n.lighMode)
          .foregroundColor(.black)
          .padding()
          .background {
            RoundedRectangle(cornerRadius: 6.0)
              .foregroundColor(.white)
              .border(.black)
          }
      }
      .toAny()
    }
  }

  var current: some View {
    Centered {
      Text(L10n.youAreCurrentlyOn(colorScheme == .dark ? L10n.darkMode : L10n.lighMode))
        .padding()
        .background {
          RoundedRectangle(cornerRadius: 6.0)
            .foregroundColor(.yellow.opacity(0.3))
        }
        .toAny()
    }
  }

  var doINeedIt: some View {
    Group {
      Title(L10n.WhatIsDarkMode.DoINeedIt.title)
      Text(L10n.WhatIsDarkMode.DoINeedIt.text1)
      Text(L10n.WhatIsDarkMode.DoINeedIt.text2)
      Text(L10n.WhatIsDarkMode.DoINeedIt.text3)
    }
  }

  var thisAppSupportsIt: some View {
    Group {
      Title(L10n.WhatIsDarkMode.ThisAppSupports.title)
      Text(L10n.WhatIsDarkMode.ThisAppSupports.text1)
      ExternalLink(link: UIApplication.openSettingsURLString, title: L10n.openSettings)
      Text(L10n.WhatIsDarkMode.ThisAppSupports.text2)

      Centered {
        Asset.longPressBrightnessOption.swiftUIImage
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(maxWidth: 400.0)
          .accessibilityHidden(true)
          .toAny()
      }
      Comment(L10n.WhatIsDarkMode.ThisAppSupports.image)

      Text(L10n.WhatIsDarkMode.ThisAppSupports.text3)
      Centered {
        Group {
          Text("⌘ + ⇧ + A")
            .accessibilityLabel(L10n.WhatIsDarkMode.ThisAppSupports.command)
        }
        .padding()
        .background {
          RoundedRectangle(cornerRadius: 8.0)
            .foregroundColor(.secondaryBackground)
        }
        .toAny()
      }
      Comment(L10n.WhatIsDarkMode.ThisAppSupports.comment1)
    }
  }
}
