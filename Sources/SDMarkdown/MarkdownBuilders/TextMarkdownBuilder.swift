//
//  TextMarkdownBuilder.swift
//  
//
//  Created by Leif on 4/6/22.
//

import ScreenData

extension SomeText: MarkdownBuildable {
    public var markdown: String { title }
}
