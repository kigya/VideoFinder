//
//  ContentView.swift
//  VideoFinder
//
//  Created by Kirill Borichevskiy on 19/04/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var videoManager = VideoManager()
    @StateObject var searchVideoManager = SearchVideoManager()
    @State private var searchText = ""
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]

    var body: some View {
        ZStack {
            VStack {
                Group {
                    SearchBar(text: $searchText)
                            .padding(.top)
                            .padding(.bottom)
                            .isHidden(PlayingState.isPlaying, remove: true)

                }
                        .onTapGesture {
                            searchVideoManager.selectedText = searchText.stripped
                        }

                if (searchText.isEmpty) {
                    NavigationView {
                        VStack {
                            HStack {
                                ForEach(Query.allCases, id: \.self) { searchQuery in
                                    QueryTag(query: searchQuery, isSelected: videoManager.selectedQuery == searchQuery)
                                            .onTapGesture {
                                                videoManager.selectedQuery = searchQuery
                                            }
                                }
                            }
                            ScrollView {
                                if videoManager.videos.isEmpty {
                                    ProgressView()
                                } else {
                                    LazyVGrid(columns: columns, spacing: 20) {
                                        ForEach(videoManager.videos, id: \.id) { video in
                                            NavigationLink {
                                                VideoView(video: video)
                                            } label: {
                                                VideoCard(video: video)
                                            }
                                        }
                                    }
                                            .padding()
                                }
                            }
                                    .frame(maxWidth: .infinity)
                        }
                                .background(Color("AccentColor"))
                                .navigationBarHidden(true)
                    }
                } else {
                    VStack {
                        Button {
                            searchVideoManager.selectedText = searchText.stripped
                        } label: {
                            Text("\(searchText)")
                                    .font(.caption)
                                    .bold()
                                    .foregroundColor(Color("AccentColor"))
                                    .padding(10)
                                    .background(Color("AccentOrange"))
                                    .cornerRadius(10)
                        }
                                .background(Color("AccentColor"))
                                .isHidden(PlayingState.isPlaying, remove: true)
                    }
                            .background(Color("AccentColor"))
                    NavigationView {
                        VStack {
                            ScrollView {
                                if searchVideoManager.videos.isEmpty {
                                    ProgressView()
                                } else {
                                    LazyVGrid(columns: columns, spacing: 20) {
                                        ForEach(searchVideoManager.videos, id: \.id) { video in
                                            NavigationLink {
                                                VideoView(video: video).onTapGesture {
                                                    PlayingState.isPlaying = true
                                                }
                                            } label: {
                                                VideoCard(video: video)
                                            }
                                        }
                                                .onTapGesture {
                                                    PlayingState.isPlaying = true
                                                }
                                    }
                                            .padding()
                                }
                            }
                                    .frame(maxWidth: .infinity)
                        }
                                .background(Color("AccentColor"))

                                .navigationBarHidden(true)
                    }
                }
            }
        }
                .background(Color("AccentColor"))
    }
}

extension View {
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}

struct PlayingState {
    public static var isPlaying = false
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
