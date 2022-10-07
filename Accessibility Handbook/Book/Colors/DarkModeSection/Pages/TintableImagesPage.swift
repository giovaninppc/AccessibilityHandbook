//
//  TintableImagesPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 07/10/22.
//

import SwiftUI

struct TintableImagesPage: View, Page {
  let title: String = L10n.TintableImages.title

  var body: some View {
    PageContent(next: nil) {
      Group {
        tintableImages
        examples
        doc
      }
      .toAny()
    }
  }
}

private extension TintableImagesPage {
  var tintableImages: some View {
    Group {
      Text(L10n.TintableImages.TintableImages.text1)
      Text(L10n.TintableImages.TintableImages.text2)
      Citation(L10n.TintableImages.TintableImages.citation1)
      Citation(L10n.TintableImages.TintableImages.citation2)
    }
  }

  var examples: some View {
    Group {
      Centered {
        Asset.tintable.swiftUIImage
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 100.0, height: 100.0, alignment: .center)
          .accessibilityHidden(true)
          .toAny()
      }
      Text(L10n.TintableImages.Example.text1)
      Text(L10n.TintableImages.Example.text2)
      Centered {
        HStack {
          Asset.tintable.swiftUIImage
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100.0, height: 100.0, alignment: .center)
            .foregroundColor(.yellow)
            .accessibilityHidden(true)

          Asset.tintable.swiftUIImage
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100.0, height: 100.0, alignment: .center)
            .foregroundColor(.red)
            .accessibilityHidden(true)

          Asset.tintable.swiftUIImage
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100.0, height: 100.0, alignment: .center)
            .foregroundColor(.blue)
            .accessibilityHidden(true)
        }
        .toAny()
      }
      Code.uikit(
        """
        let image = UIImage(named: "tintable")
        let imageView = UIImageView(image: image)
        imageView.tintColor = myColor
        """
      )
      Code.swiftUI(
        """
        Image(named: "tintable")
          .foregroundColor(.blue)
        """
      )
      Text(L10n.TintableImages.Example.text3)
      Code.uikit(
        """
        let image = UIImage(named: "tintable")
        image.renderingMode = .alwaysTemplate
        """
      )
      Code.swiftUI(
        """
        Image("tintable")
          .renderingMode(.template)
        """
      )
    }
  }

  var doc: some View {
    DocButton(link: "https://developer.apple.com/documentation/uikit/uiimage/providing_images_for_different_appearances", title: L10n.TintableImages.doc)
  }
}
