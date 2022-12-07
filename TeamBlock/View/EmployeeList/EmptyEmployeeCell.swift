//
//  EmptyEmployeeCell.swift
//  TeamBlock
//
//  Created by James Layton on 12/3/22.
//

import SwiftUI

struct EmptyEmployeeCell: View {
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Image(systemName: K.Icon.noEmployees)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            Text("You don't have any employees")
            Text("Pull to Refresh")
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct EmptyEmployeeCell_Previews: PreviewProvider {
    static var previews: some View {
        EmptyEmployeeCell()
    }
}
