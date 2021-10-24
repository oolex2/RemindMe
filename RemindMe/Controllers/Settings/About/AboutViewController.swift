//
//  AboutViewController.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 24.10.2021.
//

import SwiftUI

struct AboutViewController: View {
    
    private struct Constants {
        static let title = Text("RemindMe")
        static let description = "Current product has been developed as an Individual Development Practice (IDP).\nAll right reserved"
        static let copyright = "GlobalLogic 2021"
    }
    
    var body: some View {
        VStack {
            Text(Constants.description).font(.title).frame(maxHeight: .infinity, alignment: .center)
            Text(Constants.copyright).font(.body).frame(maxHeight: .infinity, alignment: .bottom).padding(EdgeInsets(top: .zero, leading: .zero, bottom: 16, trailing: .zero))
        }
        .multilineTextAlignment(.center)
        .navigationBarTitle(Constants.title)
    }
}

struct AboutViewController_Previews: PreviewProvider {
    static var previews: some View {
        AboutViewController()
    }
}
