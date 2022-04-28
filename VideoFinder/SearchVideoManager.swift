//
//  SearchVideoManager.swift
//  VideoFinder
//
//  Created by Kirill Borichevskiy on 28/04/2022.
//

import Foundation

class SearchVideoManager: ObservableObject {
    @Published private(set) var videos: [Video] = []
    @Published var selectedText: String = "programming" {
        didSet {
            Task.init {
                await findVideos(topic: selectedText)
            }
        }
    }

    init() {
        Task.init {
            await findVideos(topic: selectedText)
        }
    }

    func findVideos(topic: String) async {
        do {
            guard let url = URL(string: "https://api.pexels.com/videos/search?query=\(topic.lowercased())&per_page=10&orientation=portrait") else {
                fatalError("Missing URL")
            }

            var urlRequest = URLRequest(url: url)

            urlRequest.setValue("563492ad6f91700001000001b9fd1c6814414e01bf6c9cd7b4bcdcc0", forHTTPHeaderField: "Authorization")

            let (data, response) = try await URLSession.shared.data(for: urlRequest)

            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                fatalError("Error while fetching data")
            }

            let decoder = JSONDecoder()

            decoder.keyDecodingStrategy = .convertFromSnakeCase

            let decodedData = try decoder.decode(ResponseBody.self, from: data)

            DispatchQueue.main.async {
                self.videos = []

                self.videos = decodedData.videos
            }

        } catch {
            print("Error fetching data from Pexels: \(error)")
        }
    }
}
