//
//  Extension.swift
//  VideoFinder
//
//  Created by Kirill Borichevskiy on 28/04/2022.
//

import Foundation

extension String {
    var stripped: String {
        let okayChars = Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
        return self.filter {
            okayChars.contains($0)
        }
    }
}

