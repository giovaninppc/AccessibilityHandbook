//
//  GroupingPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 22/09/22.
//

import SwiftUI

struct GroupingPage: View, Page {
  let title: String = L10n.Grouping.title

  var body: some View {
    PageContent(next: DismissPage(), deeplink: deeplink) {
      Group {
        content
        goodCarousel
        badCarousel
        uiKitExample
        swiftUIExample
        contain
        containedCarousel
        containedCellExample
      }
      .toAny()
    }
  }
}

// MARK: - Content

private extension GroupingPage {
  var content: some View {
    Group {
      Text(L10n.Grouping.text1)
      Text(L10n.Grouping.text2)
      Comment(L10n.Grouping.comment)
      Text(L10n.Grouping.text3)
    }
  }

  @ViewBuilder
  var contain: some View {
    Title(L10n.Grouping.Contain.title)
    Text(L10n.Grouping.Contain.text1)
    Text(L10n.Grouping.Contain.text2)
    Comment(L10n.Grouping.Contain.comment1)
    Text(L10n.Grouping.Contain.text3)
    Text(L10n.Grouping.Contain.text4)
    Comment(L10n.Grouping.Contain.comment2)
    Text(L10n.Grouping.Contain.text5)
  }
}

// MARK: - Good Carousel

private extension GroupingPage {
  var goodCarousel: some View {
    VStack(alignment: .leading, spacing: .large) {
      Title(L10n.Grouping.goodCarousel)
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: .large) {
          ForEach(1...5, id: \.self) { _ in
            goodCell
          }
        }
      }
    }
  }

  var goodCell: some View {
    VStack(spacing: .regular) {
      Text(L10n.Grouping.cellTitle)
        .font(.title)
      Text(L10n.Grouping.cellContent)
      Comment(L10n.Grouping.cellComment)
    }
    .padding()
    .accessibilityElement(children: .combine)
    .background {
      RoundedRectangle(cornerRadius: 8.0)
        .foregroundColor(.secondaryBackground)
    }
  }
}

// MARK: - Contained Carousel

private extension GroupingPage {
  var containedCarousel: some View {
    VStack(alignment: .leading, spacing: .large) {
      Title(L10n.Grouping.containedCarousel)
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: .large) {
          ForEach(1...5, id: \.self) { _ in
            containedCell
          }
        }
      }
    }
  }

  var containedCell: some View {
    VStack(spacing: .regular) {
      Text(L10n.Grouping.cellTitle)
        .font(.title)
      Text(L10n.Grouping.cellContent)
      Comment(L10n.Grouping.cellComment)
    }
    .padding()
    .accessibilityElement(children: .contain)
    .background {
      RoundedRectangle(cornerRadius: 8.0)
        .foregroundColor(.secondaryBackground)
    }
  }
}

// MARK: - Bad Carousel

private extension GroupingPage {
  var badCarousel: some View {
    VStack(alignment: .leading, spacing: .large) {
      Title(L10n.Grouping.badCarousel)
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: .large) {
          ForEach(1...5, id: \.self) { _ in
            badCell
          }
        }
      }
    }
  }

  var badCell: some View {
    VStack(spacing: .regular) {
      Text(L10n.Grouping.cellTitle)
        .font(.title)
      Text(L10n.Grouping.cellContent)
      Comment(L10n.Grouping.cellComment)
    }
    .padding()
    .background {
      RoundedRectangle(cornerRadius: 8.0)
        .foregroundColor(.secondaryBackground)
    }
  }
}

private extension GroupingPage {
  var uiKitExample: some View {
    Group {
      Text(L10n.Grouping.Uikit.text)
      Code.uikit(
        """
        myView.isAccessibilityElement = true
        myView.subviews.forEach {
            $0.isAccessibilityElement = false
        }
        myView.accessibilityLabel = myView
            .subviews
            .compactMap { $0.accessibilityLabel }
            .joined(separator: ",")
        """
      )
    }
  }

  var swiftUIExample: some View {
    Group {
      Text(L10n.Grouping.Swiftui.text)
      Code.swiftUI(
        """
        .accessibilityElement(
          children: .combine
        )
        """
      )
    }
  }

  @ViewBuilder
  var containedCellExample: some View {
    Code.uikit("""
    parentView.shouldGroupAccessibilityChildren = true
    """)
    Code.swiftUI("""
    .accessibilityElement(
      children: .contain
    )
    """)
    Comment(L10n.Grouping.Contain.comment3)
  }
}
