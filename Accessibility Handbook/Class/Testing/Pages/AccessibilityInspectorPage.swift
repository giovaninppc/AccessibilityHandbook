//
//  UnderstandHowComponentsInteractPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct AccessibilityInspectorPage: View, Page {
  let title: String = L10n.AccessibilityInspector.title

  var body: some View {
    PageContent(next: RunTheAppInRealLifePage(), deeplink: deeplink) {
      Group {
        intro
        process
        inspectingTools
        inspecting
        auditing
        changeAccessibility
        appleDoc
      }
      .toAny()
    }
  }
}

private extension AccessibilityInspectorPage {
  @ViewBuilder
  var intro: some View {
    Text(L10n.AccessibilityInspector.text1)
    Text(L10n.AccessibilityInspector.text2)
    Centered {
      VStack(alignment: .center, spacing: .regular) {
        Asset.accessibilityInspector.swiftUIImage
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(maxWidth: 250.0)
          .accessibilityHidden(true)
        Comment(L10n.AccessibilityInspector.comment1)
          .multilineTextAlignment(.center)
      }
      .toAny()
    }
  }

  @ViewBuilder
  var process: some View {
    Title(L10n.AccessibilityInspector.Process.title)
    Text(L10n.AccessibilityInspector.Process.text1)
    Text(L10n.AccessibilityInspector.Process.text2)
    inspectTabs
  }

  @ViewBuilder
  var inspectingTools: some View {
    Title(L10n.AccessibilityInspector.InspectTools.title)
    Text(L10n.AccessibilityInspector.InspectTools.text1)
    inspectTools
    Text(L10n.AccessibilityInspector.InspectTools.text2)
    Centered {
      VStack(alignment: .center, spacing: .regular) {
        icon(Icon.textBubble)
          .padding(.compact)
          .background {
            RoundedRectangle(cornerRadius: 4.0)
              .foregroundColor(.blue)
          }
        Comment(L10n.AccessibilityInspector.InspectTools.text3)
          .multilineTextAlignment(.center)
      }
      .toAny()
    }
    Centered {
      VStack(alignment: .center, spacing: .regular) {
        icon(Icon.play)
          .padding(.compact)
          .background {
            RoundedRectangle(cornerRadius: 4.0)
              .foregroundColor(.blue)
          }
        Comment(L10n.AccessibilityInspector.InspectTools.text4)
          .multilineTextAlignment(.center)
      }
      .toAny()
    }
    Text(L10n.AccessibilityInspector.InspectTools.text4)
    Centered {
      VStack(alignment: .center, spacing: .regular) {
        icon(Icon.scope)
          .padding(.compact)
          .background {
            RoundedRectangle(cornerRadius: 4.0)
              .foregroundColor(.blue)
          }
        Comment(L10n.AccessibilityInspector.InspectTools.focus)
          .multilineTextAlignment(.center)
      }
      .toAny()
    }
  }

  @ViewBuilder
  var inspecting: some View {
    Title(L10n.AccessibilityInspector.Inspecting.title)
    Text(L10n.AccessibilityInspector.Inspecting.text1)
    Text(L10n.AccessibilityInspector.Inspecting.text2)
    Centered {
      VStack(alignment: .center, spacing: .regular) {
        Asset.insectorInspecting.swiftUIImage
          .resizable()
          .aspectRatio(contentMode: .fit)
          .accessibilityHidden(true)
        Comment(L10n.AccessibilityInspector.Inspecting.image)
          .multilineTextAlignment(.center)
      }
      .toAny()
    }
    Text(L10n.AccessibilityInspector.Inspecting.text3)
    Disclaimer(icon: Icon.lightbulb, content: L10n.AccessibilityInspector.Inspecting.text4)
  }

  @ViewBuilder
  var auditing: some View {
    Title(L10n.AccessibilityInspector.Auditing.title)
    Text(L10n.AccessibilityInspector.Auditing.text1)
    Centered {
      icon(Icon.textWrong)
        .padding(.compact)
        .background {
          RoundedRectangle(cornerRadius: 4.0)
            .foregroundColor(.secondaryBackground)
        }
        .toAny()
    }
    Text(L10n.AccessibilityInspector.Auditing.text2)
  }

  @ViewBuilder
  var changeAccessibility: some View {
    Title(L10n.AccessibilityInspector.Options.title)
    Text(L10n.AccessibilityInspector.Options.text1)
    Centered {
      icon(Icon.sliderSetting)
        .padding(.compact)
        .background {
          RoundedRectangle(cornerRadius: 4.0)
            .foregroundColor(.secondaryBackground)
        }
        .toAny()
    }
    Text(L10n.AccessibilityInspector.Options.text2)
  }

  @ViewBuilder
  var appleDoc: some View {
    DocButton(link: "https://developer.apple.com/library/archive/documentation/Accessibility/Conceptual/AccessibilityMacOSX/OSXAXTestingApps.html", title: L10n.AccessibilityInspector.title)
  }
}

private extension AccessibilityInspectorPage {
  @ViewBuilder
  var inspectTabs: some View {
    Centered {
      VStack(alignment: .center, spacing: .regular) {
        HStack(alignment: .top, spacing: .large) {
          icon(Icon.infoCircle)
          icon(Icon.textWrong)
          icon(Icon.sliderSetting)
        }
        Comment(L10n.AccessibilityInspector.Process.image)
          .multilineTextAlignment(.center)
      }
      .accessibilityElement(children: .combine)
      .toAny()
    }
  }

  @ViewBuilder
  var inspectTools: some View {
    Centered {
      VStack(alignment: .center, spacing: .regular) {
        HStack(alignment: .top, spacing: .large) {
          icon(Icon.textBubble)
          icon(Icon.leftChevron)
          icon(Icon.play)
          icon(Icon.rightChevron)
        }
        Comment(L10n.AccessibilityInspector.InspectTools.image)
          .multilineTextAlignment(.center)
      }
      .toAny()
    }
  }

  func icon(_ image: Image) -> some View {
    image
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(width: 20.0, height: 20.0)
      .accessibilityHidden(true)
  }
}
