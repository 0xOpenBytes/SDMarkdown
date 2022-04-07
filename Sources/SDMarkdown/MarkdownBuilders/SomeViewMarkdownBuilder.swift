//
//  SomeViewMarkdownBuildable.swift
//  
//
//  Created by Leif on 4/6/22.
//

import ScreenData

public protocol SomeViewMarkdownBuildable {
    func build(_ someView: SomeView) -> MarkdownBuildable?
}

extension SomeView: MarkdownBuildable {
    static var markdownBuilder: SomeViewMarkdownBuildable?
    
    public var markdown: String {
        if
            let builder = SomeView.markdownBuilder,
            let markdown = builder.build(self)?.markdown
        {
            return markdown
        }
        
        if let label = someLabel {
            return label.markdown
        } else if let text = someText {
            return text.markdown
        } else if let spacer = someSpacer {
            return spacer.markdown
        } else if let image = someImage {
            return image.markdown
        } else if let container = someContainer {
            return container.markdown
        } else if let custom = someCustomView {
            return custom.markdown
        } else {
            return "\(dump(self))"
        }
    }
}
