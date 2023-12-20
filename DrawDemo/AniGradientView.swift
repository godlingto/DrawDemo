//
//  AniGradientView.swift
//  DrawDemo
//
//  Created by 박준영 on 12/20/23.
//

import SwiftUI

struct AniGradientView: View {
    var body: some View {
        StartEndAniGradientView()
    }
}

// 시작점과 끝점을 변경하여 그라디언트에 애니메이션 적용
struct StartEndAniGradientView: View {
    
    // 애니메이션 상태를 유지하는 상태 변수를 선언
    @State private var animateGradient = false
    
    var body: some View {
        // 왼쪽 상단에서 오른쪽 하단으로 보라색과 노란색의 그라데이션
        // 애니메이션이 시작되면 시작점을 왼쪽 상단에서 왼쪽 하단으로 변경하고, 종료점을 오른쪽 하단에서 오른쪽 상단으로 변경
        LinearGradient(colors: [.purple, .yellow],
                       startPoint: animateGradient ? .topLeading : .bottomLeading,
                       endPoint: animateGradient ? .bottomTrailing : .topTrailing)
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.linear(duration: 3).repeatForever(autoreverses: true)) {
                animateGradient.toggle()
            }
        }
    }
}

#Preview {
    AniGradientView()
}
