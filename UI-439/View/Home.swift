//
//  Home.swift
//  UI-439
//
//  Created by nyannyan0328 on 2022/01/27.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 15) {
                
                
                GeometryReader{proxy in
                    
                    let size = proxy.size
                    
                    
                    Image("p1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .cornerRadius(20)
                    
                    
                    
                }
                .frame(height:250)
                .padding()
                
                
                
                MAQView(text: "Jacob Degrom.Aroldis Chapman.Roki Sasaki.Shohey Ohatani.CR7", font: UIFont.systemFont(ofSize: 20, weight: .semibold))
                
                
                
            }
            .navigationTitle("MARK")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct MAQView : View{
    
    
    @State var text : String
    var font : UIFont
    
    
    @State var offset : CGFloat = 0
    
    @State var stroreSize : CGSize = .zero
    
    
    var animatedSpeed : Double = 0.01
    
    @Environment(\.colorScheme) var schme
    var body: some View{
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            
            
            Text(text)
                .font(Font(font))
                .offset(x: offset)
            
            
            
            
            
            
        }
        .overlay(
            
         
        
            HStack{
                
                let color : Color = schme == .dark ? .black : .white
                LinearGradient(colors: [
                
                
                    color.opacity(0.7),
                    color.opacity(0.5),
                    color.opacity(0.3),
                
                
                
                ], startPoint: .leading, endPoint: .trailing).frame(width: 20)
                
                
                Spacer()
                
                
                LinearGradient(colors: [
                
                
                    color.opacity(0.7),
                    color.opacity(0.5),
                    color.opacity(0.3),
                
                
                
                ].reversed(), startPoint: .leading, endPoint: .trailing).frame(width: 20)
                
                
                
                
                
                
                
            }
        
        
        )
        .disabled(true)
        .onAppear {
            
            
            let basedText = text
            
            
            (1...15).forEach { _ in
                
                text.append(" ")
            }
            stroreSize = textSize()
            
            text.append(basedText)
            
            
            let timing = (animatedSpeed * stroreSize.width)
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
                withAnimation(.linear(duration: timing)){
                    
                    
                    offset = -stroreSize.width
                    
                }
                
                
            }
            
            
            
            
            
            
        }
        .onReceive(Timer.publish(every: ((animatedSpeed * stroreSize.width) + 0.1), on: .main, in: .default).autoconnect()) { _
            in
            
            offset = 0
            
            withAnimation(.linear(duration: animatedSpeed * stroreSize.width)){
                
                
                offset = -stroreSize.width
                
            }
            
        }
    }
    
    func textSize()->CGSize{
        
        let attributed = [NSAttributedString.Key.font:font]
        
        let size = (text as NSString).size(withAttributes: attributed)
        
        
        return size
        
        
        
    }
}
