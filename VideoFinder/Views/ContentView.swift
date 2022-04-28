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
        SearchBar(text: $searchText)
            .padding(.top)
            .padding(.bottom)
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
            Button {
                searchVideoManager.selectedText = searchText
            } label: {
                Text("Show")
                        .font(.caption)
                        .bold()
                        .foregroundColor(Color("AccentColor"))
                        .padding(10)
                        .background(Color("AccentOrange"))
                        .cornerRadius(10)
            }

            NavigationView {
                VStack {

                    ScrollView {
                        if searchVideoManager.videos.isEmpty {
                            ProgressView()
                        } else {
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(searchVideoManager.videos, id: \.id) { video in
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
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
