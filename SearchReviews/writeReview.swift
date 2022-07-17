//
//  writeReview.swift
//  Hackathon
//
//  Created by Rose DiPietro on 7/16/22.
//

import SwiftUI

struct writeReview: View {
    @State private var class_num: String = " "
    @State private var review: String = " "
    var body: some View {
        TextField(text: $class_num, prompt: Text("Required")) {
            Text("Cource Code")
        }
        TextField(text:$review, prompt: Text("Required")) {
            Text("Review")
        }
        .textInputAutocapitalization(.never)
        .navigationTitle("Enter Cource Code and Write Review")
    }
}

struct writeReview_Previews: PreviewProvider {
    static var previews: some View {
        writeReview()
    }
}
