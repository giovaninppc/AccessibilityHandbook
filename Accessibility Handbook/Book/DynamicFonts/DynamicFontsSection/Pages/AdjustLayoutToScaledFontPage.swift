//
//  AdjustLayoutToScaledFont.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 28/09/22.
//

import SwiftUI

struct AdjustLayoutToScaledFontPage: View, Page {
  let title = L10n.AdjustLayoutToScaledFontPage.title

  var body: some View {
    PageContent(next: nil) {
      Group {
        intro
        fixedSizeExample
        lineBreak
        scaleSize
        allowTextToIncrease
        whatToDo
      }
      .toAny()
    }
  }
}

private extension AdjustLayoutToScaledFontPage {
  var intro: some View {
    Group {
      Text(L10n.AdjustLayoutToScaledFontPage.Intro.text1)
      Text(L10n.AdjustLayoutToScaledFontPage.Intro.text2)
      Comment(L10n.AdjustLayoutToScaledFontPage.Intro.comment1)
      Comment(L10n.AdjustLayoutToScaledFontPage.Intro.comment2)
    }
  }

  var fixedSizeExample: some View {
    Group {
      Title(L10n.AdjustLayoutToScaledFontPage.FixedSize.title)
      Text(L10n.AdjustLayoutToScaledFontPage.FixedSize.text1)

      Centered {
        VStack(spacing: .regular) {
          Text(L10n.AdjustLayoutToScaledFontPage.Example.title)
            .lineLimit(1)
            .font(.title)
          Text(L10n.AdjustLayoutToScaledFontPage.Example.body)
            .lineLimit(1)
            .font(.body)
          Text(L10n.AdjustLayoutToScaledFontPage.Example.description)
            .lineLimit(1)
            .font(.callout)
            .foregroundColor(.secondaryLabel)
        }
        .accessibilityElement(children: .combine)
        .padding()
        .frame(width: 170, height: 150)
        .background {
          RoundedRectangle(cornerRadius: 8.0)
            .foregroundColor(.secondaryBackground)
        }
        .toAny()
      }

      Code.swiftUI(
        """
        Text("\(L10n.AdjustLayoutToScaledFontPage.Example.title)")
            .lineLimit(1)
            .font(.title)
            .frame(width: 100)
        """
      )
    }
  }

  var lineBreak: some View {
    Group {
      Title(L10n.AdjustLayoutToScaledFontPage.LineBreak.title)
      Text(L10n.AdjustLayoutToScaledFontPage.LineBreak.text1)
      Comment(L10n.AdjustLayoutToScaledFontPage.LineBreak.comment1)

      Centered {
        VStack(spacing: .regular) {
          Text(L10n.AdjustLayoutToScaledFontPage.Example.title)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
            .lineLimit(nil)
            .font(.title)
          Text(L10n.AdjustLayoutToScaledFontPage.Example.body)
            .multilineTextAlignment(.center)
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
            .font(.body)
          Text(L10n.AdjustLayoutToScaledFontPage.Example.description)
            .multilineTextAlignment(.center)
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
            .font(.callout)
            .foregroundColor(.secondaryLabel)
        }
        .accessibilityElement(children: .combine)
        .frame(width: 170)
        .padding()
        .background {
          RoundedRectangle(cornerRadius: 8.0)
            .foregroundColor(.secondaryBackground)
        }
        .toAny()
      }

      Code.swiftUI(
        """
        Text("\(L10n.AdjustLayoutToScaledFontPage.Example.title)")
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
            .font(.title)
            .frame(width: 100)
        """
      )
    }
  }

  var scaleSize: some View {
    Group {
      Title(L10n.AdjustLayoutToScaledFontPage.ScaleSize.title)
      Text(L10n.AdjustLayoutToScaledFontPage.ScaleSize.text1)
      Comment(L10n.AdjustLayoutToScaledFontPage.ScaleSize.comment1)

      Centered {
        VStack(spacing: .regular) {
          Text(L10n.AdjustLayoutToScaledFontPage.Example.title)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
            .lineLimit(nil)
            .font(.title)
          Text(L10n.AdjustLayoutToScaledFontPage.Example.body)
            .multilineTextAlignment(.center)
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
            .font(.body)
          Text(L10n.AdjustLayoutToScaledFontPage.Example.description)
            .multilineTextAlignment(.center)
            .lineLimit(nil)
            .fixedSize(horizontal: false, vertical: true)
            .font(.callout)
            .foregroundColor(.secondaryLabel)
        }
        .accessibilityElement(children: .combine)
        .frame(minWidth: 170, maxWidth: 250)
        .padding()
        .background {
          RoundedRectangle(cornerRadius: 8.0)
            .foregroundColor(.secondaryBackground)
        }
        .toAny()
      }

      Code.swiftUI(
        """
        Text("\(L10n.AdjustLayoutToScaledFontPage.Example.title)")
            .lineLimit(nil)
            .fixedSize(
                horizontal: false,
                vertical: true)
            .font(.title)
            .frame(minWidth: 170, maxWidth: 250)
        """
      )
    }
  }

  var allowTextToIncrease: some View {
    Group {
      Title(L10n.AdjustLayoutToScaledFontPage.AllowTextToIncrease.title)
      Text(L10n.AdjustLayoutToScaledFontPage.AllowTextToIncrease.text1)
      Text(L10n.AdjustLayoutToScaledFontPage.AllowTextToIncrease.text2)
      Comment(L10n.AdjustLayoutToScaledFontPage.AllowTextToIncrease.comment1)

      Centered {
        VStack(spacing: .small) {
          Asset.starryNight.swiftUIImage
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 100)
            .clipped()
          VStack(spacing: .regular) {
            Text(L10n.AdjustLayoutToScaledFontPage.Example.title)
              .font(.title)
            Text(L10n.AdjustLayoutToScaledFontPage.Example.body)
              .font(.body)
            Text(L10n.AdjustLayoutToScaledFontPage.Example.description)
              .font(.callout)
              .foregroundColor(.secondaryLabel)
          }
          .padding()
        }
        .frame(maxWidth: 350.0)
        .fixedSize()
        .accessibilityElement(children: .combine)
        .background {
          RoundedRectangle(cornerRadius: 8.0)
            .foregroundColor(.secondaryBackground)
        }
        .toAny()
      }

      Code.swiftUI(
        """
        VStack {
        // The image has a fixed height
        Image()
          .resizable()
          .frame(height: 100)
          // and it's content is set to fill the available space
          .aspectRatio(contentMode: .fill)
          // it's also 'clipped' so it will resize itself without breaking it's limits
          .clipped()

        // The text is single lined
        // And with a dynamic font it's allowed to rescale itself
        Text(\(L10n.AdjustLayoutToScaledFontPage.Example.title))
          .font(.title)
        }
        // The whole group has a maximum width
        .frame(maxWidth: 350)
        // And the content is set to fixed size
        // So, in this case, the size of the text will define the size of the cell
        .fixedSize()

        """
      )

      Comment(L10n.AdjustLayoutToScaledFontPage.AllowTextToIncrease.comment2)
    }
  }

  var whatToDo: some View {
    Group {
      Title(L10n.AdjustLayoutToScaledFontPage.WhatOption.title)
      Text(L10n.AdjustLayoutToScaledFontPage.WhatOption.text1)
      Comment(L10n.AdjustLayoutToScaledFontPage.WhatOption.comment1)
      Text(L10n.AdjustLayoutToScaledFontPage.WhatOption.text2)
    }
  }
}
