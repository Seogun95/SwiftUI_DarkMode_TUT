

import SwiftUI

struct ContentView: View {
    //Alert
    @State private var showingAlert = false
    //다크모드인지 아닌지를 정해주는 환경설정
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        ZStack {
//            Color.yellow
            Theme.myBackgroundColor(forScheme: scheme)
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                Spacer()
                
                Button(action: {
                    print("버튼이 눌렸습니다.")
                    self.showingAlert.toggle()
                }) {
                    Text("서근 블로그")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
                }
                .alert(isPresented: $showingAlert, content: {
                    Alert(title: Text("열심히 코딩합시다😁"), message: Text("나태해 지지 말자🔥"), dismissButton: .default(Text("닫기")))
                })
                
                Spacer().frame(height:100)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//다크모드 테마 생성
struct Theme {
    static func myBackgroundColor(forScheme scheme: ColorScheme) -> Color {
        let lightColor = Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        let darckColor = Color.black
        
        switch scheme {
        case .light : return lightColor
        case .dark : return darckColor
        @unknown default: return lightColor
        }
    }
}



