//
//  SortMenu.swift
//  TeamBlock
//
//  Created by James Layton on 12/5/22.
//

import SwiftUI

struct SortMenu: View {
    
    @ObservedObject var employeeProcessor: EmployeeProcessor
    
    var body: some View {
        Menu {
            Button("Name A to Z",
                   action: employeeProcessor.sortedByNameAscending)
            
            Button("Name Z to A",
                   action: employeeProcessor.sortedByNameDescending)
            
            Button("Team A to Z",
                   action: employeeProcessor.sortedByTeamAscending)
            
            Button("Team Z to A",
                   action: employeeProcessor.sortedByTeamDescending)
            
        } label: {
            Text("Sort by")
        }
    }
}

struct SortMenu_Previews: PreviewProvider {
    static var previews: some View {
        SortMenu(employeeProcessor: EmployeeProcessor())
    }
}
