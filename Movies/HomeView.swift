//
//  HomeView.swift
//  Movies
//
//  Created by Allen Wu on 05/11/2025.
//

import SwiftUI

struct HomeView: View {
    var heroTestTitle = Constants.testTitleURL
    var body: some View {
        
        // vstack aligns all content inside vertically
        GeometryReader { geo in
            ScrollView {
                // load view when loaded
                LazyVStack{
                    AsyncImage(url:URL(string:heroTestTitle)){
                        image in
                        image
                            .resizable()
                            .scaledToFit()
                            .overlay{
                                LinearGradient(
                                    stops:[Gradient.Stop(color: .clear, location:0.8),
                                           Gradient.Stop(color: .gradient,location: 1)],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            }
                    }placeholder:{
                        ProgressView()
                    }
                    .frame(width:geo.size.width,height: geo.size.height * 0.85)
                }
                // hstack -> horizontally
                HStack{
                    Button{
                        
                    }label: {
                        Text(Constants.playString)
                            .ghostButton()
                    }
                    Button{
                        
                    }label: {
                        Text(Constants.downloadString)
                            .ghostButton()
                    }
                }
                HorizontalListView(header: Constants.trendingMovieString)
                HorizontalListView(header: Constants.topRatedMovieString)
                HorizontalListView(header: Constants.trendingTVString)
                HorizontalListView(header: Constants.topRatedTVString)
            }
        }
    }
}

#Preview {
    HomeView()
}
