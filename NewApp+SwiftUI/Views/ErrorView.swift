//
//  ErrorVire.swift
//  NewApp+SwiftUI
//
//  Created by саргашкаева on 20.02.2023.
//

import SwiftUI

struct ErrorView: View {
  
    typealias ErrorViewActionHandle = () -> Void
    let error: Error
    let handler: ErrorViewActionHandle
    
    internal init(error: Error, handler: @escaping ErrorView.ErrorViewActionHandle) {
        self.error = error
        self.handler = handler
    }
    

    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 50, weight: .heavy))
            Text("Oops")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .heavy))
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .padding(.vertical, 4)
            Button {
               handler()
            } label: {
                Text("Retry")
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 30)
            .backgroundStyle(Color.blue)
            .foregroundColor(.white)
            .font(.system(size: 15, weight: .heavy))
            .cornerRadius(10)

        }
    }
}

