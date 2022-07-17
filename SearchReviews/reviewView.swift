//
//  reviewView.swift
//  Hackathon
//
//  Created by Rose DiPietro on 7/16/22.
//

import SwiftUI

struct reviewView: View {
    
    var my_cource_num: String

    
    var data = loadCSV(from: "Duke CSA Academic Database 2019 Spring - Sheet1")
    
    
    var body: some View {
        Text("Showing reviews for \(my_cource_num)").font(.title)
        List{
            ForEach(data.filter {$0.cource_num.contains(my_cource_num)}) {
                rev in
                Text(rev.review)
            }
        }
    }
}



struct reviewView_Previews: PreviewProvider {
    static var previews: some View {
        reviewView(my_cource_num: "AAAS 212")
    }
}
