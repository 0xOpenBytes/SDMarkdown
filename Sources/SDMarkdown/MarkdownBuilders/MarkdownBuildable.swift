//
//  MarkdownBuildable.swift
//  
//
//  Created by Leif on 4/6/22.
//

import ScreenData

public protocol MarkdownBuildable {
    var markdown: String { get }
}

public extension Destination {
    init(_ path: String) {
        self.init(type: .url, toID: path)
    }
}
