//
//  Video.swift
//  VideoFinder
//
//  Created by Kirill Borichevskiy on 28/04/2022.
//

import Foundation

struct Video: Identifiable, Decodable {
    var id: Int
    var image: String
    var duration: Int
    var user: User
    var videoFiles: [VideoFile]

    struct User: Identifiable, Decodable {
        var id: Int
        var name: String
        var url: String
    }

    struct VideoFile: Identifiable, Decodable {
        var id: Int
        var quality: String
        var fileType: String
        var link: String
    }
}
