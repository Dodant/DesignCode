//
//  LoadingView.swift
//  DesignCode
//
//  Created by Junggyun Oh on 2020/10/07.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
		VStack {
			LottieView(filename: "loading")
				.frame(width: 200, height: 200)
		}
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
