//
//  RichTextViewComponent+Ranges.swift
//  RichTextKit
//
//  Created by Dominik Bucher
//

import Foundation

extension RichTextViewComponent {

    var notFoundRange: NSRange {
        .init(location: NSNotFound, length: 0)
    }

    /// Get the line range at a certain text location.
    func lineRange(at location: Int) -> NSRange {
        #if os(watchOS)
        return notFoundRange
        #else
        guard let storage = textStorageWrapper else {
            return NSRange(location: NSNotFound, length: 0)
        }
        let string = storage.string as NSString
        let locationRange = NSRange(location: location, length: 0)
        return string.lineRange(for: locationRange)
        #endif
    }

    /// Get the line range for a certain text range.
    func lineRange(for range: NSRange) -> NSRange {
        #if os(watchOS)
        return notFoundRange
        #else
        guard let storage = textStorageWrapper else {
            return NSRange(location: NSNotFound, length: 0)
        }
        return (storage.string as NSString).lineRange(for: range)
        #endif
    }
}
