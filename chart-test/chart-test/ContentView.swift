//
//  ContentView.swift
//  chart-test
//
//  Created by 潘傑恩 on 2023/6/25.
//

import SwiftUI
import Charts

struct ContentView: View {
    let viewMonths: [ViewMonth] = [
        .init(date: Date.from(year: 2023, month: 1, day: 1), viewCount: 55000),
        .init(date: Date.from(year: 2023, month: 2,  day: 1), viewCount: 65000),
        .init(date: Date.from(year: 2023, month: 3, day: 1), viewCount: 89000),
        .init(date: Date.from(year: 2023, month: 4, day: 1), viewCount: 55000),
        .init(date: Date.from(year: 2023, month: 5,  day: 1), viewCount: 134000),
        .init(date: Date.from(year: 2023, month: 6, day: 1), viewCount: 89000),
        .init(date: Date.from(year: 2023, month: 7, day: 1), viewCount: 124000),
        .init(date: Date.from(year: 2023, month: 8,  day: 1), viewCount: 82000),
        .init(date: Date.from(year: 2023, month: 9, day: 1), viewCount: 59942),
        .init(date: Date.from(year: 2023, month: 10, day: 1), viewCount: 43000),
        .init(date: Date.from(year: 2023, month: 11,  day: 1), viewCount: 56000),
        .init(date: Date.from(year: 2023, month: 12, day: 1), viewCount: 103000),
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Youtube Views")
            Text("Total: \(viewMonths.reduce(0, {$0 + $1.viewCount}))")
                .fontWeight(.semibold)
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.bottom, 12)
            
            Chart {
                RuleMark(y: .value("Goal", 80000))
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                    .foregroundStyle(.mint)
//                    .annotation(alignment: .leading){
//                        Text("Goal")
//                            .font(.caption)
//                            .foregroundColor(.secondary)
//
//                    }
                ForEach(viewMonths) { viewMonth in
                    BarMark(
                        x: .value("Month", viewMonth.date, unit: .month),
                        y: .value("Values", viewMonth.viewCount)
                    )
                    .foregroundStyle(Color.pink.gradient)
                    
                }
            }
            .frame(height: 180)
            .chartXAxis{
                AxisMarks(values: viewMonths.map { $0.date }) {date in
                    //                     AxisGridLine()
                    //                     AxisTick()
                    AxisValueLabel(format: .dateTime.month(.abbreviated))
                }
            }
            .chartYAxis {
                AxisMarks { mark in
                    AxisValueLabel()
                    //                     AxisGridLine()
                }
            }
            .padding(.bottom)
            //             .chartYScale(domain: 0...200000)
            //             .chartXAxis(.hidden)
            //             .chartPlotStyle{ plotContent in
            //                plotContent
            //                    .background(.black)
            //            }
            
            HStack {
                Image(systemName: "line.diagonal")
                    .rotationEffect(Angle(degrees: 45))
                    .foregroundColor(.mint)
                Text("Monthly Goal")
                    .foregroundColor(.secondary)
            }
            .font(.caption2)
            .padding(.leading, 4)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ViewMonth: Identifiable {
    let id = UUID()
    let date: Date
    let viewCount: Int
}

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        
        return Calendar.current.date(from: components)!
    }
}
