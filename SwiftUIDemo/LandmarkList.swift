//
//  LandmarkList.swift
//  SwiftUIDemo
//
//  Created by Sujan Vaidya on 12/31/19.
//  Copyright © 2019 Sujan Vaidya. All rights reserved.
//

import SwiftUI

struct LandmarkList<DetailView: View>: View {
    
    @EnvironmentObject var userData: UserData

    let detailViewProducer: (Landmark) -> DetailView
    
    var body: some View {
        List {
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Favorites only")
            }
            
            ForEach(self.userData.landmarks) { landmark in
                if !self.userData.showFavoritesOnly || landmark.isFavorite {
                    NavigationLink(
                    destination: self.detailViewProducer(landmark).environmentObject(self.userData)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Landmarks"))
    }
}

#if os(watchOS)
typealias PreviewDetailView = WatchLandmarkDetail
#else
typealias PreviewDetailView = LandmarkDetail
#endif

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList { PreviewDetailView(landmark: $0) }
            .environmentObject(UserData())
    }
}
