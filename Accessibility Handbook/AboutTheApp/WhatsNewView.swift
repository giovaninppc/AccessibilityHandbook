//
//  WhatsNewView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 30/10/22.
//

import SwiftUI

struct WhatsNewView: View, Page {
  var title: String { L10n.WhatsNew.title }
  private let allPages = AllPagesProvider()

  var body: some View {
    VStack(alignment: .leading, spacing: .regular) {
      ScrollView([.vertical], showsIndicators: false) {
        currentVersion
        v1_8_2
        v1_8_1
        v1_8_0
        v1_7_0
        v1_6_0
        v1_5_0
        v1_4_0
        v1_3_0
        v1_2_0
        v1_1_0
      }
    }
    .navigationTitle(title)
    .padding(.horizontal)
  }
}

private extension WhatsNewView {
  @ViewBuilder
  private var currentVersion: some View {
    if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
      Comment(L10n.WhatsNew.currentVersion(version))
    }
  }

  @ViewBuilder
  private var v1_8_2: some View {
    release(
      version: "1.8.2",
      description: L10n.WhatsNew._182.description,
      pages: []
    )
  }

  @ViewBuilder
  private var v1_8_1: some View {
    release(
      version: "1.8.1",
      description: L10n.WhatsNew._181.description,
      pages: [
        GroupingPage()
      ]
    )
  }

  @ViewBuilder
  private var v1_8_0: some View {
    release(
      version: "1.8.0",
      description: L10n.WhatsNew._180.description,
      pages: []
    )
    NavigationLink {
      IndexView.classes()
    } label: {
      IndexCell(title: L10n.Home.classes, icon: Icon.bookshelf)
    }
  }

  private var v1_7_0: some View {
    release(
      version: "1.7.0",
      description: L10n.WhatsNew._170.description,
      pages: [
        RotorPage()
      ]
    )
  }

  private var v1_6_0: some View {
    release(
      version: "1.6.0",
      description: L10n.WhatsNew._160.description,
      pages: [
        SearchFieldTraitPage(),
        SummaryElementTraitPage()
      ]
    )
  }

  private var v1_5_0: some View {
    release(
      version: "1.5.0",
      description: L10n.WhatsNew._150.description,
      pages: [
        ButtonShapesPage(),
        BoldedTextPage(),
        ImageTraitPage()
      ]
    )
  }

  private var v1_4_0: some View {
    release(
      version: "1.4.0",
      description: L10n.WhatsNew._140.description,
      pages: [
        WhatIsDarkModePage(),
        AppearancesPage(),
        DynamicColorsPage(),
        DynamicColoredAssetsPage(),
        TintableImagesPage()
      ]
    )
  }

  private var v1_3_0: some View {
    release(
      version: "1.3.0",
      description: L10n.WhatsNew._130.description,
      pages: [
        IncreasingHints(),
        ReduceMotionPage(),
        IdentifyCurrentPreferredFontSizePage()
      ]
    )
  }

  private var v1_2_0: some View {
    release(
      version: "1.2.0",
      description: L10n.WhatsNew._120.description,
      pages: [
        GesturesPage(),
        AboutFontsPage(),
        ScallingFontsAutomaticallyPage(),
        UIFontMetricsPage(),
        AdjustLayoutToScaledFontPage()
      ]
    )
  }

  private var v1_1_0: some View {
    release(
      version: "1.1.0",
      description: L10n.WhatsNew._110.description,
      pages: [
        ContrastPage()
      ]
    )
  }

  @ViewBuilder
  func release(version: String, description: String, pages: [Page]) -> some View {
    HStack {
      VStack(alignment: .leading, spacing: .regular) {
        Title(version)
          .accessibilityLabel(L10n.WhatsNew.version(version))
        Text(description)
      }
      Spacer()
    }
    ForEach(pages, id: \.id) { page in
      NavigationLink {
        page.page
      } label: {
        IndexCell(title: page.title, icon: allPages.pageIconDict[page.id])
      }
    }
    VerticalSpace(.large)
    ExternalLink(
      link: "https://github.com/giovaninppc/AccessibilityHandbook/releases/tag/v\(version)",
      title: L10n.WhatsNew.seeTheReleaseNotes(version)
    )
    VerticalSpace(.large)
    Divider()
  }
}
