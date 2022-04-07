//
//  ContainerMarkdownBuilder.swift
//  
//
//  Created by Leif on 4/6/22.
//

import ScreenData

public extension SomeContainerView {
    init(
        views: [SomeView]
    ) {
        self.init(
            id: nil,
            isScrollable: false,
            axis: .vertical,
            views: views,
            style: nil
        )
    }
}

extension SomeContainerView: MarkdownBuildable {
    public var markdown: String {
        views
            .map(\.markdown)
            .joined(separator: "\n")
    }
}
