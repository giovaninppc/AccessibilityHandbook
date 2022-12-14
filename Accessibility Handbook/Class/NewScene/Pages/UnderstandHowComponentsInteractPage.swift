//
//  UnderstandHowComponentsInteractPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct UnderstandHowComponentsInteractPage: View, Page {
  let title: String = L10n.UnderstandHowComponentsInteract.title

  var body: some View {
    PageContent(next: HiddenObjectsPage(), deeplink: deeplink) {
      Group {
        intro
        scene
      }
      .toAny()
    }
  }
}

private extension UnderstandHowComponentsInteractPage {
  @ViewBuilder
  var intro: some View {
    Text(L10n.UnderstandHowComponentsInteract.text1)
    Comment(L10n.UnderstandHowComponentsInteract.comment1)
    Text(L10n.UnderstandHowComponentsInteract.text2)
    Text(L10n.UnderstandHowComponentsInteract.text3)
    componentHierarchyExample
    Text(L10n.UnderstandHowComponentsInteract.text4)
  }

  @ViewBuilder
  var scene: some View {
    Title(L10n.UnderstandHowComponentsInteract.Scene.title)
    Text(L10n.UnderstandHowComponentsInteract.Scene.text1)
    sceneHierarchyExample
    Text(L10n.UnderstandHowComponentsInteract.Scene.text2)
    Text(L10n.UnderstandHowComponentsInteract.Scene.text3)
    Text(L10n.UnderstandHowComponentsInteract.Scene.text4)
  }
}

private extension UnderstandHowComponentsInteractPage {
  @ViewBuilder
  var componentHierarchyExample: some View {
    VerticalSpace(.regular)
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .top, spacing: .regular) {
        itemComponentHierarchy
        headerComponentHierarchy
        bannerComponentHierarchy
        listComponentHierarchy
      }
    }
    VerticalSpace(.regular)
  }

  @ViewBuilder
  var headerComponentHierarchy: some View {
    VStack(alignment: .center, spacing: .regular) {
      VStack(spacing: .regular) {
        ZStack(alignment: .leading) {
          VStack {
            Text("Header Image")
              .padding(70.0)
              .hierarchyBackground()
            VerticalSpace(50.0)
          }
          VStack {
            VerticalSpace(110.0)
            HStack {
              HorizontalSpace(.compact)
              Text("Profile Image")
                .padding(.vertical, .large)
                .padding(.horizontal)
                .hierarchyBackground()
                .frame(maxWidth: 160.0)
            }
          }
          HStack {
            Spacer()
            VStack {
              VerticalSpace(.compact)
              Text("Save Button")
                .padding()
                .hierarchyBackground()
                .frame(maxWidth: 150.0)
              Spacer()
            }
            HorizontalSpace(.compact)
          }
          VStack {
            Spacer()
            HStack {
              Spacer()
              Text("Helper view")
            }
          }
        }
        .padding()
        .hierarchyBackground()
        Text("Title Label")
          .padding()
          .hierarchyBackground()
        HStack {
          Spacer()
          Text("Base View")
        }
      }
      .padding()
      .hierarchyBackground()
      .frame(width: 280.0)

      Comment("Header Component")
    }
    .accessibilityElement(children: .combine)
    .accessibilityLabel("Header component")
  }

  @ViewBuilder
  var itemComponentHierarchy: some View {
    VStack(alignment: .center, spacing: .regular) {
      VStack(spacing: .regular) {
        Text("Item Image")
          .padding(50.0)
          .hierarchyBackground()
        Text("Item name label")
          .padding()
          .hierarchyBackground()

        HStack {
          Spacer()
          Text("Base View")
        }
      }
      .padding()
      .hierarchyBackground()
      .frame(width: 280.0)

      Comment("Item Component")
    }
    .accessibilityElement(children: .combine)
    .accessibilityLabel("Item component")
  }

  @ViewBuilder
  var bannerComponentHierarchy: some View {
    VStack(alignment: .center, spacing: .regular) {
      VStack(spacing: .regular) {
        ZStack {
          Text("Image")
            .padding(70.0)
            .hierarchyBackground()
          VStack {
            VerticalSpace(80.0)
            Text("Banner label")
              .padding()
              .hierarchyBackground()
          }
        }
        HStack {
          Spacer()
          Text("Base View")
        }
      }
      .padding()
      .hierarchyBackground()
      .frame(width: 350.0)

      Comment("Banner Component")
    }
    .accessibilityElement(children: .combine)
    .accessibilityLabel("Banner component")
  }

  @ViewBuilder
  var listComponentHierarchy: some View {
    VStack(alignment: .center, spacing: .regular) {
      HStack(spacing: .regular) {
        Text("Title Label")
          .padding()
          .hierarchyBackground()
        Text("Disclosure Button")
          .padding()
          .hierarchyBackground()
      }
      .padding()
      .hierarchyBackground()
      .frame(width: 280.0)

      Comment("List Component")
    }
    .accessibilityElement(children: .combine)
    .accessibilityLabel("List component")
  }

  @ViewBuilder
  var sceneHierarchyExample: some View {
    VerticalSpace(.regular)
    VStack(alignment: .center, spacing: .regular) {
      VStack(spacing: .regular) {
        Text("Header component")
          .padding(.vertical, 50.0)
          .hierarchyBackground()

        Text("Separator")
          .padding(.horizontal)
          .hierarchyBackground(color: .purple)

        Text("Banner component")
          .padding(.vertical, .large)
          .hierarchyBackground()

        VStack {
          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: .regular) {
              ForEach(1...5, id: \.self) { _ in
                Text("Item component")
                  .padding()
                  .hierarchyBackground(opacity: 0.5)
              }
            }
          }
          HStack {
            Spacer()
            Text("Carousel")
          }
        }
        .padding()
        .hierarchyBackground(color: .purple)

        VStack {
          ForEach(1...3, id: \.self) { _ in
            Text("List Component")
              .padding()
              .hierarchyBackground(opacity: 0.5)
          }
          HStack {
            Spacer()
            Text("Table")
          }
        }
        .padding()
        .hierarchyBackground(color: .purple)

        HStack {
          Spacer()
          Text("Scene")
        }
      }
      .padding()
      .hierarchyBackground()

      Comment("Scene hierarchy example")
    }
    .accessibilityElement(children: .combine)
    .accessibilityLabel("Scene hierarchy example")
  }
}
