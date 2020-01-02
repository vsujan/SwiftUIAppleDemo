//
//  UserData.swift
//  SwiftUIDemo
//
//  Created by Sujan Vaidya on 1/2/20.
//  Copyright © 2020 Sujan Vaidya. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
 
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    
}
