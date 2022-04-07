//
//  SpacerMarkdownBuilder.swift
//  
//
//  Created by Leif on 4/6/22.
//

import ScreenData

public extension SomeSpacer {
    init() { self.init(size: 1) }
}

extension SomeSpacer: MarkdownBuildable {
    public var markdown: String {
        if size > 1 {
            return "\n" + String(repeating: "<br/>", count: size / 8) + "\n"
        } else {
            return "\n<br/>\n"
        }
    }
}
