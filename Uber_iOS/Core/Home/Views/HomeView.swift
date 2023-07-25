//
//  HomeView.swift
//  Uber_iOS
//
//  Created by Koulik Maity on 08/07/23.
//

import SwiftUI

struct HomeView: View {
    
//    @State private var showLoactionSearchView = false
    @State private var mapState = MapViewState.noInput
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    var body: some View {
        ZStack(alignment: .bottom){
            ZStack(alignment: .top){
                UberMapViewRepresentable(mapState: $mapState)
                    .ignoresSafeArea()
                
                
                if mapState == .searchingForLocation {
                    LocationSearchView(mapState: $mapState)
                }
                else if(mapState == .noInput){
                    LocationSearchActivationView()
                        .padding(.top, 72)
                        .onTapGesture {
                            withAnimation(.spring()){
                                mapState = .searchingForLocation
                            }
                        }
                }
                
                MapViewActionButton(mapState: $mapState)
                    .padding(.leading)
                    .padding(.top, 4)
            }
            
            if mapState == .locationSelected || mapState == .polylineAdded {
                RideRequestView()
                    .transition(.move(edge: .bottom))
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .onReceive(LocationManager.shared.$userLocation) { location in
            if let location = location {
                print("DEBUG: User location in home view is \(location)")
                locationViewModel.userLocation = location
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}