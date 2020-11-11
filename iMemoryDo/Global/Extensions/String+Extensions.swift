//
//  String+Extensions.swift
//  iMemoryDo
//
//  Created by Miyo Alpízar on 10/11/20.
//

import SwiftUI

extension String {
    func asLocalized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
