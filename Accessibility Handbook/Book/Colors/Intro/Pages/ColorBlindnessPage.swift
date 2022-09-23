//
//  ColorBlindness.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct ColorBlindnessPage: View, Page {
  var title: String = "Color Blindness"

  var body: some View {
    PageContent(next: nil) {
      Group {
        intro
        handlingColorblindColors
        carefulWithImages
      }
      .toAny()
    }
  }
}

private extension ColorBlindnessPage {
  var intro: some View {
    Group {
      Text("Color blindness is a decreased ability to see color differences.")
      ExternalLink(link: "https://en.wikipedia.org/wiki/Color_blindness", title: "More on Wikipedia")
      Text("What you may not know is that there are 'levels' of color blindness. A person with green color deficiency, for example, may not see the green color at all, or may see it a little bit less that a non-color-blind person.")
      Text("You may take an Ishihara test to check if you are color blind. I have a friend who discovered she was color blind when we were in college! And before that, I'd expect you to identify this condition much earlier in life.")
      Centered {
        Asset.ishihara.swiftUIImage
          .resizable()
          .aspectRatio(contentMode: .fit)
          .accessibilityLabel("Example of ishihara color identifying test.")
          .toAny()
      }
      Comment("These above are examples of an Ishihara test. For a 'normal' vision person, it's expected to see '12', '6' and '74' respectively.")
      ExternalLink(link: "https://en.wikipedia.org/wiki/Ishihara_test", title: "Ishihara Test")
      Text("But how does this affect our work when we are building an app?")
    }
  }

  var handlingColorblindColors: some View {
    Group {
      VerticalSpace(.regular)
      Title("Handling content considering colorblindness")
      Text("First, make sure your content does not rely on colors only to take any actions or to identify informations. Take the example below.")
      Centered {
        Group {
          VStack(alignment: .leading, spacing: .regular) {
            Text("Free shipping")
              .foregroundColor(.green)
            Text("Additional cost")
              .foregroundColor(.red)
            Text("Early access")
              .foregroundColor(.green)
            Text("Extra bureaucracy")
              .foregroundColor(.red)
          }
          .accessibilityElement(children: .combine)
          HorizontalSpace(.regular)
          Rectangle()
            .frame(width: .single)
            .foregroundColor(.secondaryBackground)
          HorizontalSpace(.regular)
          VStack(alignment: .leading, spacing: .regular) {
            (Text(Image(systemName: "plus.circle.fill")) + Text(" Free shipping"))
              .foregroundColor(.green)
            (Text(Image(systemName: "minus.circle.fill")) + Text(" Additional cost"))
              .foregroundColor(.red)
            (Text(Image(systemName: "plus.circle.fill")) + Text(" Early access"))
              .foregroundColor(.green)
            (Text(Image(systemName: "minus.circle.fill")) + Text(" Extra bureaucracy"))
              .foregroundColor(.red)
          }
        }
        .toAny()
      }
      Text("Here, on the first column, we are color coding red the negative items and green the positive ones. But that's exactly what we want to avoid. The second Colum has a much better 'universal' experience where identifying these items as positive or negative does not rely solely on color.")
      Comment("Using + and - may have cultural connotations, so it may not be the best example here. But it's just an example.")
      Comment("If you do rely on colors only on some part of your app, don't want to change it, but still want to to make it usable for colorblind users, check our 'Differentiate without colors' page.")
      InternalLink(page: DifferentiateWithoutColorsPage().page, title: "Differentiate without colors")
    }
  }

  var carefulWithImages: some View {
    Group {
      VerticalSpace(.regular)
      Title("Careful with images")
      Text("Sometimes we render content with images. Banners loaded from Backend, some promotional stuff, or just something that looks nicer on the image render.")
      Comment("First, make sure to add an accessibility label to this image!")
      InternalLink(page: AccessibilityLabelPage().page, title: "Accessibilty Label")
      Text("You also need to be careful to not have content ot be read on conflicting colors for color blindness.")
    }
  }
}
