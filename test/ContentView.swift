//
//  ContentView.swift
//  test
//
//  Created by 潘傑恩 on 2023/6/10.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)

            VStack {
                CityTextView(cityName: "Taipei, Taiwan")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 32)
                
                Spacer()
                            
                HStack(spacing: 10) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 26)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.rain.fill", temperature: 28)
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.rain.fill", temperature: 30)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.bolt.fill", temperature: 32)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "thermometer.sun.fill", temperature: 36)
                    WeatherDayView(dayOfWeek: "SUN", imageName: "sunset.fill", temperature: 23)
                }
                
                Spacer()

                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day of Time", isNight: <#T##Binding<Bool>#>)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .foregroundColor(.white)
            
            Image(systemName: imageName).renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            Text("\(temperature)°")
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(Color.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Image(systemName: imageName).renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°C")
                .font(.system(size: 60, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
