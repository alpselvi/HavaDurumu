//
//  ContentView.swift
//  HavaDurumu
//
//  Created by Alp Selvi on 11.01.2024.
//

import SwiftUI



struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            GradientSubview(topColor: isNight ? .gray : .purple,
                            bottomColor: isNight ? .black : .cyan)
            
            // istanbul yazisi , hava sembolu ve derece
            VStack{
                CityTextView(cityName: "Istanbul")
                
                MainWeatherView(
                    imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                    degree: 4)
                
                
                //gunler , sembolleri ve dereceleri
                
                .padding(.bottom, 60)
                
//                Spacer()
                
                HStack(spacing:15){
                    
                    WeatherDay(dayOfTheWeek: "TUE", 
                               weatherOfThisDay: "cloud.bolt.rain.fill",
                               temp: 5)
                    
                    WeatherDay(dayOfTheWeek: "WED",
                               weatherOfThisDay: "cloud.drizzle.fill",
                               temp: 4)
                    
                    WeatherDay(dayOfTheWeek: "THU",
                               weatherOfThisDay: "snow",
                               temp: 4)
                    
                    WeatherDay(dayOfTheWeek: "FRI",
                               weatherOfThisDay: "wind.snow",
                               temp: 6)
                    
                    WeatherDay(dayOfTheWeek: "SAT",
                               weatherOfThisDay: "cloud.drizzle.fill",
                               temp: 3)
                    
                    WeatherDay(dayOfTheWeek: "SUN",
                               weatherOfThisDay: "cloud.fill",
                               temp: 3)
                    
                }
                
                Spacer()
                Spacer()
                
                Button {
                    
                    isNight.toggle()
                    print("tapped")
                    
                } label: {
                    
                    ChangeTheTimeView(
                        BackgroundColor: .white,
                        ForegroundColor: .indigo,
                        title: "Change Time of The Day")
                    
                }

                
                Spacer()
                    
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDay: View {
    
    var dayOfTheWeek : String
    var weatherOfThisDay : String
    var temp : Int
    
    var body: some View {
        VStack{
            Text(dayOfTheWeek)
                .foregroundStyle(.white)
                .font(.system(size: 23, weight: .medium, design: .monospaced))
//                .italic()
            
            
            Image(systemName: weatherOfThisDay)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            
            Text("\(temp)°")
                .foregroundStyle(.white)
                .font(.system(size: 30, weight: .semibold, design: .monospaced))
            
        }
    }
}

struct GradientSubview: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(colors: [topColor, bottomColor],
                       startPoint: .leading,
                       endPoint: .bottom)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .frame(width: 150, height: 50)
            .foregroundStyle(.white)
            .font(.system(size: 32, weight: .medium, design: .default))
//                    .italic()
            .padding()
    }
}

struct MainWeatherView : View {
    
    var imageName: String
    var degree : Int
    
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
        Text("\(degree)°")
                .foregroundStyle(.white)
                .font(.system(size: 65, weight: .bold, design: .monospaced))
                .padding()
                
        }
    }
}

struct ChangeTheTimeView: View {
    
    var BackgroundColor: Color
    var ForegroundColor: Color
    var title: String
    
    var body: some View {
        
        Text(title)
            .frame(width: 270,height: 50)
            .background(BackgroundColor)
            .foregroundColor(ForegroundColor)
            .font(.headline)
            .cornerRadius(10)
        
    }
}

//final version...
