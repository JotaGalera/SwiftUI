import SwiftUI

struct OnBoardingView: View {
    var subviews = [
        UIHostingController(rootView: Subview(photoName: "meditating")),
        UIHostingController(rootView: Subview(photoName: "sitting")),
        UIHostingController(rootView: Subview(photoName: "skydiving"))
    ]
    
    @State var currentPageIndex = 0

    var body: some View {
        VStack(alignment: .leading){
            PageViewController(currentPageIndex: $currentPageIndex, viewController: subviews)
                .frame(minHeight: 350, maxHeight: 600)
            TextContent(currentPageIndex: currentPageIndex)
                .padding()
            HStack{
                PageControl(numberOfPages: subviews.count, currentPageIndex: $currentPageIndex)
                    .padding()
                Spacer()
                Button(action: {
                    if self.currentPageIndex + 1 == self.subviews.count {
                        self.currentPageIndex = 0
                    } else {
                        self.currentPageIndex += 1
                    }
                }) {
                    ButtonContent()
                }
                .padding()
            }
        }
    }
}

struct ButtonContent: View {
    var body: some View {
        VStack{
            Image(systemName: "arrow.right")
            .resizable()
            .foregroundColor(.white)
            .frame(width: 30, height: 30)
            .padding()
            .background(Color.orange)
            .cornerRadius(30)
        }
    }
}

struct TextContent: View {
    var currentPageIndex: Int
    
    var body: some View {
        Group{
           TittleTextContent(currentPageIndex: currentPageIndex)
           BodyTextContent(currentPageIndex: currentPageIndex)
        }
    }
}

struct TittleTextContent: View {
    var currentPageIndex: Int
    
    private let titles = ["Take some time out",
    "Conquer personal hindrances",
    "Create a peaceful mind"]
    
    var body: some View {
        Text(titles[currentPageIndex])
            .font(.title)
    }
}

struct BodyTextContent: View {
    var currentPageIndex: Int
    
    private let captions =  ["Take your time out and bring awareness into your everyday life",
    "Meditating helps you dealing with anxiety and other psychic problems",
    "Regular medidation sessions creates a peaceful inner mind"]
    
    var body: some View {
        Text(captions[currentPageIndex])
            .font(.subheadline)
            .foregroundColor(.gray)
            .frame(width: 300, height: 50, alignment: .leading)
            .lineLimit(nil)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
