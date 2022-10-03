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
    PageContent(next: DismissPage()) {
      Group {
        content
        VerticalSpace(.large)
        goodCarousel
        VerticalSpace(.large)
        badCarousel
        VerticalSpace(.large)
        uiKitExample
        VerticalSpace(.regular)
        swiftUIExample
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
}

// MARK: - Good Carousel

private extension GroupingPage {
  var goodCarousel: some View {
    VStack(alignment: .leading, spacing: .large) {
      Title(L10n.Grouping.goodCarousel)
      ScrollView {
        HStack(spacing: .large) {
          goodCell
          goodCell
        }
      }
    }
  }

  var goodCell: some View {
    VStack(spacing: .regular) {
      Title(L10n.Grouping.cellTitle)
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

// MARK: - Bad Carousel

private extension GroupingPage {
  var badCarousel: some View {
    VStack(alignment: .leading, spacing: .large) {
      Title(L10n.Grouping.badCarousel)
      ScrollView {
        HStack(spacing: .large) {
          badCell
          badCell
        }
      }
    }
  }

  var badCell: some View {
    VStack(spacing: .regular) {
      Title(L10n.Grouping.cellTitle)
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

// MARK: - UIKit

private extension GroupingPage {
  var uiKitExample: some View {
    Group {
      Title(L10n.uikit)
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
}

// MARK: - SwiftUI

private extension GroupingPage {
  var swiftUIExample: some View {
    Group {
      Title(L10n.swiftUI)
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
}