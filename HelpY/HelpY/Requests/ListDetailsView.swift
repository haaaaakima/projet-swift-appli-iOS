import SwiftUI
import MapKit

struct ListDetailsView: View {
    @Environment(\.dismiss) var dismiss // Permet de fermer la vue actuelle
    @State private var navigateToLogin = false // Contrôle de la navigation vers LoginFormView
    
    var requestData: RequestData
    
    var body: some View {
        NavigationStack {
            ZStack {
                ListRequestView()
                    .blur(radius: 5)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .shadow(radius: 5)
                        .frame(width: 360, height: 500)
                        .overlay(content: {
                            VStack(spacing: 15) {
                                
                                NavigationLink{
                                    ListRequestView()
                                }
                            label:
                                {
                                    Text("X")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                        .foregroundStyle(.gray)
                                        .padding(.leading, 280)
                                        .padding()
                                }
                                
                                HStack {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(requestData.organization.name)
                                            .font(.headline)
                                            .foregroundColor(.black)
                                        
                                        HStack {
                                            Image(systemName: requestData.icon)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 24, height: 24)
                                                .foregroundColor(.blue)
                                            Text(requestData.category)
                                                .fontWeight(.bold)
                                        }
                                        
                                        Text("\(requestData.duration) minutes")
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                    
                                    VStack(alignment: .trailing) {
                                        Text(requestData.date, style: .date)
                                            .foregroundColor(.gray)
                                        
                                        Text(requestData.statusRequired ? "Bénévole" : "Professionnel")
                                            .foregroundColor(.white)
                                            .padding(6)
                                            .background(requestData.statusRequired ? Color.green : Color.orange)
                                            .cornerRadius(8)
                                    }
                                }
                                .padding()
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(10)
                                .padding(.horizontal)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Description de l'offre")
                                        .font(.headline)
                                    
                                    Text(requestData.description)
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(Color(UIColor.systemGray5))
                                        .cornerRadius(10)
                                }
                                .padding(.horizontal)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Durée")
                                        .font(.headline)
                                    
                                    Text("\(requestData.duration) minutes")
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(Color(UIColor.systemGray5))
                                        .cornerRadius(10)
                                }
                                .padding(.horizontal)
                                
                                NavigationLink{
                                    LoginFormView()}
                                label:
                                {
                                    Text("Accepter")
                                        .foregroundColor(.white)
                                        .frame(width: 140, height: 45)
                                        .background(Color.blue)
                                        .cornerRadius(12)
                                        .padding(.top, 10)
                                }
                        }
                            .padding()
                        })
                } .padding(.bottom, 80)
            }
        }
    }
}

#Preview {
    ListDetailsView(requestData: requestsData.first!)
}
