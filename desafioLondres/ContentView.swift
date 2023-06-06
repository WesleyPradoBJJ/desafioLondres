//
//  ContentView.swift
//  desafioLondres
//
//  Created by Wesley Prado on 05/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var userName = ""
    @State var password = ""
    @State var rememberMe = false
    @State var showAlert = false
    @State var showSheet = false
    
    var body: some View {
        
        VStack{
            
            Image("irmandadeLogo")
                .resizable()
                .frame(width: 180, height: 180)
                .background(RoundedRectangle(cornerRadius: 100).stroke(Color.purple, lineWidth:10))
            
            Text("Irmandade Swift")
                .font(.title)
                .fontWeight(.bold)
            
            TextField("Username", text: $userName)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(Color.purple, lineWidth:1.5))
                .padding()
            
            SecureField("Password", text: $password)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(Color.purple, lineWidth:1.5))
                .padding()
            
            VStack(spacing: 50){
                Toggle("Lembrar de mim", isOn: $rememberMe)
                    .padding()
                    .fontWeight(.medium)
                
                Button("Entrar"){
                    if userName == "Wesley" && password == "12345" {
                        showSheet = true
                    } else {
                        showAlert = true
                    }
                }
                .foregroundColor(.white)
                .fontWeight(.bold)
                .frame(width: 80, height: 35)
                .background(.purple)
                .cornerRadius(5)
                
                .alert("Opss...Algo deu errado.", isPresented: $showAlert){
                    Button("Cancel", role: .cancel){}
                } message: {
                    Text("Complete todos os campos corretamente e confira se sua senha está correta!")
                }
                
                .sheet(isPresented: $showSheet){
                    VStack(spacing: 80){
                        
                        VStack(spacing: 20){
                            
                            Image("irmandadeLogo")
                                .resizable()
                                .frame(width: 180, height: 180)
                                .background(RoundedRectangle(cornerRadius: 100).stroke(Color.purple, lineWidth:10))
                            
                            Text("IRMANDADE SWIFT!")
                                .fontWeight(.bold)
                                .foregroundColor(.purple)
                                .font(.callout)
                        }
                        
                        Text("Seja bem vindo Wesley Prado!")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                        
                        Button("Sair"){
                            showSheet = false
                        }
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(width: 80, height: 35)
                        .background(.purple)
                        .cornerRadius(5)
                    }
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(Color.purple, lineWidth:1.5))
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

