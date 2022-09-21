//
//  AccessibilityPriorityPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct AccessibilityPriorityPage: View, Page {
  var title: String = "Accessibility Priority"

  let codeUIKit: String = """
  // The content is read in the array's order
  myView.accessibilityElements =
    [subview1, subview2, subview3]
  """

  let codeSwiftUI: String = """
  // The highest priority is read first
  View()
    .accessibilitySortPriority(2)
  View()
    .accessibilitySortPriority(1)
  View()
    .accessibilitySortPriority(3)
  """

  let docLink: String = """
  https://developer.apple.com/documentation/swiftui/link/accessibilitysortpriority(_:)
  """

  var body: some View {
    PageContent(next: nil) {
      Group {
        Text("Accessibility Sort Priority, in SwiftUI, is a way to change the order of the elements read by the Voice-Over")
          .accessibilitySortPriority(100)
        Text("It is similar to defining the order of reading the elements using UIKit, but in UIKit we define this order using an array.")
          .accessibilitySortPriority(100)
        Text("It can be useful in some situations, check the example below:")
          .accessibilitySortPriority(100)
        PriorityExampleView()
        Comment("Yes, you can change the reading order of your elements, but most of the time you dont want to do that.")
          .accessibilitySortPriority(-2)
        Comment("As a general guideline, we keep the reading order the same as the natural reading order of the current language")
          .accessibilitySortPriority(-2)
        Comment("For instance, English reads from left-to-right then from top-to-bottom, and thats the order the Voice-Over will try to read the content.")
          .accessibilitySortPriority(-2)
        Code(uiKit: codeUIKit, swiftUI: codeSwiftUI)
          .accessibilitySortPriority(-2)
        DocButton(link: docLink, title: title)
          .accessibilitySortPriority(-2)
      }
      .toAny()
    }
  }
}

private struct PriorityExampleView: View {
  var body: some View {
    VStack(spacing: .regular) {
      VerticalSpace(.large)
      HStack {
        Text("Weather icons")
          .font(.title3)
          .accessibilitySortPriority(10)
        Spacer()
        Button {
          UIAccessibility.post(notification: .announcement, argument: "See how this button even being above the elements, was the last one being focused?.")
        } label: {
          Text("more")
        }
        .accessibilitySortPriority(-1)
      }
      ScrollView {
        HStack(spacing: .large) {
          Image(systemName: "moon.fill")
            .accessibilityLabel(Text("Moon"))
            .accessibilitySortPriority(9)
          Image(systemName: "cloud.fill")
            .accessibilityLabel(Text("Cloud"))
            .accessibilitySortPriority(8)
          Image(systemName: "sun.max.fill")
            .accessibilityLabel(Text("Sun"))
            .accessibilitySortPriority(7)
          Image(systemName: "sunrise.fill")
            .accessibilityLabel(Text("Sunrise"))
            .accessibilitySortPriority(6)
          Image(systemName: "cloud.snow.fill")
            .accessibilityLabel(Text("Snow"))
            .accessibilitySortPriority(5)
          Image(systemName: "cloud.bolt.rain.fill")
            .accessibilityLabel(Text("Rain"))
            .accessibilitySortPriority(4)
          Image(systemName: "cloud.fog.fill")
            .accessibilityLabel(Text("Fog"))
            .accessibilitySortPriority(3)
        }
      }
    }
    .padding()
  }
}
