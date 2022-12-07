//
//  EmployeeListView.swift
//  TeamBlock
//
//  Created by James Layton on 12/2/22.
//

import SwiftUI

struct EmployeeListView: View {
    
    /// An app state environment object to keep track if need to present the loading spinner throughout the app
    @EnvironmentObject var appState: AppState
    
    @StateObject private var employeeProcessor = EmployeeProcessor()
    
    @State private var showAlert = false
    @State private var alertDetails: AlertDetails?
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    if employeeProcessor.employees.employees.count > 0 {
                        ForEach(employeeProcessor.employees.employees) { employee in
                            EmployeeListCell(employee: employee)
                        }
                    } else {
                        EmptyEmployeeCell()
                    }
                }
                .toolbar {
                    ToolbarItemGroup {
                        if employeeProcessor.employees.employees.count > 0 {
                            SortMenu(employeeProcessor: employeeProcessor)
                        }
                    }
                }
                .navigationTitle("Employees")
                .refreshable {
                    Task {
                        await loadEmployees()
                    }
                }
                .task {
                    await loadEmployees()
                }
            }

            SpinnerView(isVisible: appState.isTaskLoading)
        }
        .onReceive(NotificationCenter.default.publisher(for: .showAlert)) { notification in
            if let alertDetails = notification.object as? AlertDetails {
                self.alertDetails = alertDetails
                showAlert = true
            }
        }
        .alert(Text(""), isPresented: $showAlert, presenting: alertDetails) { detail in
            ForEach(detail.buttons, id: \.title) { button in
                Button("\(button.title)") {
                    button.action()
                }
            }
        } message: { detail in
            Text("\(detail.message)")
        }
    }
    
    private func loadEmployees() async {
        do {
            appState.isTaskLoading = true
            try await employeeProcessor.fetchEmployees()
            appState.isTaskLoading = false
            
        } catch let error {
            appState.isTaskLoading = false
            NotificationCenter.default.showAlert(AlertDetails(title: K.Alert.errorTitle,
                                                              message: error.localizedDescription))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListView()
    }
}
