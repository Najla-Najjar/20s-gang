import SwiftUI

struct roro: View {
    @State private var showSplash = true
    @State private var showContentView = false
    
    var body: some View {
        ZStack {
            VStack {
                if showSplash {
                    Image("rawaf")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 388, height: 539)
                        .clipped()
                        .opacity(showSplash ? 1.0 : 0.0)
                        .animation(.easeInOut(duration: 2.0))
                        .onAppear  {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                withAnimation {
                                    showSplash = false
                                    showContentView = true
                                }
                            }
                        }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.clear)
            
            if showContentView {
                ContentView()
                    .opacity(showContentView ? 1.0 : 0.0)
                    .animation(.easeInOut(duration: 2.0))
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct roro_Previews: PreviewProvider {
    static var previews: some View {
        roro()
    }
}
