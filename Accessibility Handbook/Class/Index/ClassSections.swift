//
//  ClassIndexes.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 07/12/22.
//

import Foundation

struct ClassSections: SectionProvider {
  let title: String = "Classes"
  let sections: [Section] = [
    LearnTheFeaturesClassSection(),
    NewAppClassSection(),
    NewViewClassSection(),
    NewSceneClassSection(),
    TestingClassSection(),
    IdentifyIssues()
  ]
}
