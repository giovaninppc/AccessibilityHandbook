//
//  GroupingPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 22/09/22.
//

import SwiftUI

struct GroupingPage: View, Page {
  var title: String = "Grouping Elements"

  var body: some View {
    PageContent(next: nil) {
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
      Text("To me, Grouping elements correctly is one of the most important parts of building a good accessible view.")
      Text("Imagine a carousel with a bunch of cells, when using the Voice-Over, we want the cursor to focus on each individual cell, not on the cells content.")
      Comment("This may seem obvious, but can be easily forgotten on development.")
      Text("Turn the Voice-Over on ans check both carousels below, one has the content correctly grouped, and the other don't.")
    }
  }
}

// MARK: - Good Carousel

private extension GroupingPage {
  var goodCarousel: some View {
    VStack(alignment: .leading, spacing: .large) {
      Title("Good Carousel")
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
      Title("Cell Title")
      Text("Cell content")
      Comment("Cell comment")
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
      Title("Bad Carousel")
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
      Title("Cell Title")
      Text("Cell content")
      Comment("Cell comment")
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
      Title("UIKit")
      Text("On UIKit, you need to make the parent view an accessible element and not the children. Then, combine them to build the correct accessibility label for the parent.")
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
      Title("SwiftUI")
      Text("SwiftUI has a better wrapper to combine all children into a single accessible element.")
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
