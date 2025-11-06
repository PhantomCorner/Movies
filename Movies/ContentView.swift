//
//  ContentView.swift
//  Movies
//
//  Created by Allen Wu on 05/11/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            //            Tab("Home", systemImage: "home"){
            //                Text("Home text")
            //            }
            HomeView()
                .tabItem {
                    // init comment
                    Label(Constants.homeString, systemImage: Constants.homeIconString)
                }
            
            Text(Constants.upcomingString)
                .tabItem {
                    Label(Constants.upcomingString, systemImage: Constants.upcomingIconString)
                }
            
            Text(Constants.searchString)
                .tabItem {
                    Label(Constants.searchString, systemImage: Constants.searchIconString)
                }
            
            Text(Constants.downloadString)
                .tabItem {
                    Label(Constants.downloadString, systemImage: Constants.downloadIconString)
                }
            
        }

    }
}

#Preview {
    ContentView()
}
