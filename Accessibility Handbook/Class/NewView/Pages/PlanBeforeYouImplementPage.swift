//
//  ThinkingAccessibilityPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 11/12/22.
//

import SwiftUI

struct PlanBeforeYouImplementPage: View, Page {
  let title: String = L10n.PlanBeforeYouImplement.title

  var body: some View {
    PageContent(next: RepeatedViewsPage(), deeplink: deeplink) {
      Group {
        intro
        understandingHierarchy
        groupElements
        conclusion
      }
      .toAny()
    }
  }
}

private extension PlanBeforeYouImplementPage {
  @ViewBuilder
  var intro: some View {
    Text(L10n.PlanBeforeYouImplement.text1)
    Text(L10n.PlanBeforeYouImplement.text2)
    Text(L10n.PlanBeforeYouImplement.text3)
    Text(L10n.PlanBeforeYouImplement.text4)
  }

  @ViewBuilder
  var understandingHierarchy: some View {
    Title(L10n.PlanBeforeYouImplement.Hierarchy.title)
    Text(L10n.PlanBeforeYouImplement.Hierarchy.text1)
    Text(L10n.PlanBeforeYouImplement.Hierarchy.text2)
    Text(L10n.PlanBeforeYouImplement.Hierarchy.text3)
    viewHierarchyExample
    Text(L10n.PlanBeforeYouImplement.Hierarchy.text4)
  }

  @ViewBuilder
  var groupElements: some View {
    Title(L10n.PlanBeforeYouImplement.Group.title)
    groupingDisclaimer
    Text(L10n.PlanBeforeYouImplement.Group.text1)
    Text(L10n.PlanBeforeYouImplement.Group.text2)
    Text(L10n.PlanBeforeYouImplement.Group.text3)
    imageGroupExample
    Text(L10n.PlanBeforeYouImplement.Group.text4)
    Text(L10n.PlanBeforeYouImplement.Group.text5)
    labelsHierarchyExample
  }

  @ViewBuilder
  var conclusion: some View {
    Title(L10n.PlanBeforeYouImplement.Conclusion.title)
    Text(L10n.PlanBeforeYouImplement.Conclusion.text1)
    Text(L10n.PlanBeforeYouImplement.Conclusion.text2)
    Text(L10n.PlanBeforeYouImplement.Conclusion.text3)
    fullExample
  }

  var groupingDisclaimer: some View {
    Disclaimer.beforeYouReadThis(check: L10n.Grouping.title, destination: GroupingPage().page)
  }
}

private extension PlanBeforeYouImplementPage {
  @ViewBuilder
  var viewHierarchyExample: some View {
    Centered {
      VStack(spacing: .regular) {
        VStack(spacing: .regular) {
          Text("Image")
            .padding()
          Text("Image description label")
            .padding()
            .hierarchyBackground()
        }
        .padding()
        .hierarchyBackground()
        Text("Title Label")
          .padding()
          .hierarchyBackground()
        Text("Subtitle Label")
          .padding()
          .hierarchyBackground()
        HStack {
          Spacer()
          Text("Base View")
        }
      }
      .padding()
      .hierarchyBackground()
      .frame(maxWidth: 350.0)
      .toAny()
    }
    .accessibilityElement(children: .combine)
    .accessibilityHidden(true)
    Centered {
      Comment(L10n.PlanBeforeYouImplement.Hierarchy.example)
        .multilineTextAlignment(.center)
        .frame(maxWidth: 350.0)
        .toAny()
    }
  }

  @ViewBuilder
  var imageGroupExample: some View {
    Centered {
      VStack(spacing: .regular) {
        VStack(spacing: .regular) {
          Text("Image")
            .padding()
          Text("Image description label")
            .padding()
            .hierarchyBackground()
        }
        .padding()
        .hierarchyBackground()
        .border(.primary, width: 2.0)
      }
      .padding()
      .frame(maxWidth: 350.0)
      .toAny()
    }
    .accessibilityElement(children: .combine)
    .accessibilityHidden(true)
    Centered {
      Comment(L10n.PlanBeforeYouImplement.Group.imageExplanation)
        .multilineTextAlignment(.center)
        .frame(maxWidth: 350.0)
        .toAny()
    }
    Code.swiftUI("""
    ZStack(alignment: .bottom) {
      Image(imageAsset)
      Text(imageDescription)
    }
    .accessibilityElement(children: .combine)
    """)
  }

  @ViewBuilder
  var labelsHierarchyExample: some View {
    Centered {
      VStack(spacing: .regular) {
        Text("Title Label")
          .padding()
          .hierarchyBackground()
        Text("Subtitle Label")
          .padding()
          .hierarchyBackground()
        HStack {
          Spacer()
          Text("New parent View")
        }
      }
      .padding()
      .hierarchyBackground()
      .border(.primary, width: 2.0)
      .frame(maxWidth: 350.0)
      .toAny()
    }
    .accessibilityElement(children: .combine)
    .accessibilityHidden(true)
    Code.swiftUI("""
    VStack(spacing: .regular) {
      Text("Title Label")
      Text("Subtitle Label")
    }
    .accessibilityElement(children: .combine)
    """)
  }

  @ViewBuilder
  var fullExample: some View {
    Centered {
      VStack(spacing: .regular) {
        VStack(spacing: .regular) {
          Text("Image")
            .padding()
          Text("Image description label")
            .padding()
            .hierarchyBackground()
        }
        .padding()
        .hierarchyBackground()
        .border(.primary, width: 2.0)
        .accessibilityElement(children: .combine)
        VStack(spacing: .regular) {
          Text("Title Label")
            .padding()
            .hierarchyBackground()
          Text("Subtitle Label")
            .padding()
            .hierarchyBackground()
          HStack {
            Spacer()
            Text("New parent View")
              .accessibilityHidden(true)
          }
        }
        .padding()
        .hierarchyBackground()
        .border(.primary, width: 2.0)
        .accessibilityElement(children: .combine)
        HStack {
          Spacer()
          Text("Base View")
        }
      }
      .padding()
      .hierarchyBackground()
      .frame(maxWidth: 350.0)
      .toAny()
    }
  }
}
