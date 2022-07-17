//
//  ContentView.swift
//  Hackathon
//
//  Created by Rose DiPietro on 7/16/22.
//

import SwiftUI


struct ContentView: View {


    var cources = loadCSV(from: "Duke CSA Academic Database 2019 Spring - Sheet1")
    
    var cource_list: [String] {
        var ret = [""]
        for cource in cources {
            ret.append(cource.cource_num)
        }
        return ret
    }

    
    @State private var searchText = " "
    //var names = ["CS201", "ECON101"]
    var majors = ["ARTVIS", "Bio", "CHEM", "COMPSCI", "ECE", "ECON", "MATH", "MMS", "PHIL", "PSY", "PUBPOL"]
    
    
    var body: some View {
        NavigationView {
            
            
            VStack {
                
                List {
                    ForEach(searchResults, id: \.self) { name in
                        NavigationLink(name, destination: reviewView(my_cource_num: name))
            
                    }
                }
                .searchable(text: $searchText, prompt: "Search Course Code", suggestions: {
                    ForEach(majorResults, id: \.self) { major in
                        Text("Are you looking for \(major) classes?").searchCompletion(major)
                    }
                })
                .navigationTitle("Search Course Code")
                
                Button(action: {print("hello")}, label: {Label("Write your own Review", systemImage: "pencil")})
            }
            
        }
    
    }
    

    
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return cource_list
        }
        else {
            return cource_list.filter({ $0.contains(searchText)})
        }
    }
    

    
    var majorResults: [String] {
        if searchText.isEmpty {
            return majors
        }
        else {
            return majors.filter({$0.contains(searchText)})
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
