import SwiftUI

struct OrderForms: View {
    
    @Binding var showOrderSheet: Bool
    
    var body: some View {
        NavigationView{
            Form {
                UserRequest()
                UserDataFormSection()
                RatingSlider()
                OrderButton()
            }
            .navigationBarTitle(Text("Welcome!"))
            .navigationBarItems(leading:
                Button(action: {self.showOrderSheet = false}) {
                    Text("Cancel")
                }
            )
            
        }
    }
}

struct UserRequest: View {
    @State var specialRequests = true
    
    var body: some View {
        Section{
            AllowSpecialRequest(specialRequests: $specialRequests)
            if specialRequests {
                AddRequestTextField()
            }
            AmountOfFoodSelector()
        }
    }
}

struct AllowSpecialRequest: View {
    @Binding var specialRequests: Bool
    
    var body: some View {
        Toggle(isOn: $specialRequests){
            Text("Any Special requests?")
        }
        
    }
}

struct AddRequestTextField: View {
    @State var specialRequestContent = ""
    
    var body: some View {
        TextField("Enter your whishes", text: $specialRequestContent)
    }
}

struct AmountOfFoodSelector: View{
    @State var orderAmount = 1
    
    var body: some View {
        Stepper(value: $orderAmount, in: 1...10, label: {
            Text("Number of items: \(orderAmount)")
        })
    }
}

struct UserDataFormSection: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var city = ""
    @State var zip = ""
    
    var body: some View {
        Section {
            TextField("First Name: ", text: $firstName)
            TextField("Last Name: ", text: $lastName)
            TextField("City: ", text: $city)
            TextField("Zip: ", text: $zip)
        }
    }
}

struct RatingSlider: View {
    @State var userFeedback = 0.0
    
    var body: some View {
        Section {
            VStack{
                Text("How happy were you with the user experience?")
                    .padding(.top,10)
                HStack {
                    Image(systemName: "hand.thumbsdown")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Slider(value: $userFeedback, in: 0.0...10.0)
                    Image(systemName: "hand.thumbsup")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
        }
    }
}

struct OrderButton: View {
    var body: some View {
        Section {
            Button(action: {
                print("Placed")
            }){
                Text("Placed order")
            }
        }
    }
}

struct OrderForms_Previews: PreviewProvider {
    static var previews: some View {
        OrderForms(showOrderSheet: .constant(true))
    }
}
