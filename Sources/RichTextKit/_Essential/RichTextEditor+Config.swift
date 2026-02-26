//
//  RichTextEditor+Config.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2024-02-24.
//  Copyright © 2024 Daniel Saidi. All rights reserved.
//

#if iOS || macOS || os(tvOS) || os(visionOS)
import SwiftUI

/// This struct be used to configure a ``RichTextEditor``.
public typealias RichTextEditorConfig = RichTextView.Configuration

public extension View {

    /// Apply a ``RichTextEditor`` configuration.
    func richTextEditorConfig(
        _ config: RichTextEditorConfig
    ) -> some View {
        self.environment(\.richTextEditorConfig, config)
    }

    /// Apply a ``RichTextEditor`` placeholder.
    func richTextEditorPlaceholder(
        _ placeholder: String?
    ) -> some View {
        self.environment(\.richTextEditorPlaceholder, placeholder)
    }
}

private extension RichTextEditorConfig {

    struct Key: EnvironmentKey {

        public static var defaultValue: RichTextEditorConfig {
            .standard
        }
    }
}

struct RichTextEditorPlaceholderKey: EnvironmentKey {
    static var defaultValue: String? { nil }
}

public extension EnvironmentValues {

    /// This value can bind to a rich text editor config.
    var richTextEditorConfig: RichTextEditorConfig {
        get { self [RichTextEditorConfig.Key.self] }
        set { self [RichTextEditorConfig.Key.self] = newValue }
    }

    /// This value can bind to a rich text editor placeholder.
    var richTextEditorPlaceholder: String? {
        get { self [RichTextEditorPlaceholderKey.self] }
        set { self [RichTextEditorPlaceholderKey.self] = newValue }
    }
}
#endif
