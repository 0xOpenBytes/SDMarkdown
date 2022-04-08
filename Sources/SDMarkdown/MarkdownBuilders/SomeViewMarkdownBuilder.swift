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

public extension SomeView {
    static func vstack(_ views: [SomeView]) -> Self {
        SomeContainerView(views: views).someView
    }
    
    static func image(
        url: String,
        width: Int? = nil,
        height: Int? = nil,
        destination: Destination? = nil
    ) -> Self {
        SomeImage(
            url: url,
            width: width,
            height: height,
            destination: destination
        ).someView
    }
    
    static func label(
        title: String,
        subtitle: String? = nil,
        font: FontType = .caption,
        destination: Destination? = nil
    ) -> Self {
        SomeLabel(
            title: title,
            subtitle: subtitle,
            font: font,
            destination: destination
        ).someView
    }
    
    static func text(_ text: String) -> Self {
        SomeText(title: text).someView
    }
    
    static func spacer(size: Int = 1) -> Self {
        SomeSpacer(size: size * 8).someView
    }
}

