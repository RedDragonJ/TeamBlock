//
//  EmployeeListCell.swift
//  TeamBlock
//
//  Created by James Layton on 12/4/22.
//

import SwiftUI
import CachedAsyncImage

struct EmployeeListCell: View {
    
    let employee: Employee
    
    var body: some View {
        HStack {
            
            if let smallPhotoURLStr = employee.smallPhoto {
                
                // Use this to download and cache the images
                CachedAsyncImage(url: URL(string: smallPhotoURLStr), urlCache: .imageCache) { image in
                    if let image = image.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .background(Color.gray)
                            .cornerRadius(100 / 2)
                    } else {
                        Image(systemName: K.Icon.employeePlaceholder)
                    }
                }
                
            } else {
                Image(systemName: K.Icon.employeePlaceholder)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(employee.fullName)
                    .font(.headline)
                Text(employee.team)
                    .font(.caption)
            }
        }
    }
}

struct EmployeeListCell_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListCell(employee: Employees().employees[0])
    }
}
