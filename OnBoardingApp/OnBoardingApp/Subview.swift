import SwiftUI

struct Subview: View {
    var photoName = ""
    
    var body: some View {
        Image(photoName)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .clipped()
    }
}

struct Subview_Previews: PreviewProvider {
    static var previews: some View {
        Subview(photoName: "meditating")
    }
}
