//
//  LocationSearchReasultCell.swift
//  Uber_iOS
//
//  Created by Koulik Maity on 09/07/23.
//

import SwiftUI

struct LocationSearchReasultCell: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack{
            Image(systemName: "map.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .accentColor(.white)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 6){
                Text(title)
                    .font(.body)
                
                Text(subtitle)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                
                Divider()
            }
            .padding(.leading, 10)
            .padding(.vertical, 8)
        }
        .padding(.leading)
    }
}

struct LocationSearchReasultCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchReasultCell(title: "", subtitle: "")
    }
}
