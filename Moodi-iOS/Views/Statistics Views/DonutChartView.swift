//
//  DonutChartMoodView.swift
//  Moodi-iOS
//
//  Created by Santiago del Castillo Gonzaga on 11/05/21.
//

import Foundation
import SwiftUI
import Charts

func dataDonutChart(last30days: [Day]) -> [PieChartDataEntry] {
    var moodDonutChart: [PieChartDataEntry]
    var veryHappyCount, happyCount, neutralCount, sadCount, verySadCount: Double
    verySadCount = 0
    sadCount = 0
    neutralCount = 0
    veryHappyCount = 0
    happyCount = 0
    
    for day in last30days {
        switch day.mood {
        case .veryHappy:
            veryHappyCount += 1
        case .happy:
            happyCount += 1
        case .neutral:
            neutralCount += 1
        case .sad:
            sadCount += 1
        case .verySad:
            verySadCount += 1
        }
    }
    
    moodDonutChart = [PieChartDataEntry(value: veryHappyCount, label: NSLocalizedString("veryHappy", comment: "")), PieChartDataEntry(value: happyCount, label: NSLocalizedString("happy", comment: "")), PieChartDataEntry(value: neutralCount, label: NSLocalizedString("neutral", comment: "")), PieChartDataEntry(value: sadCount, label: NSLocalizedString("sad", comment: "")), PieChartDataEntry(value: verySadCount, label: NSLocalizedString("verySad", comment: ""))]
    
    return moodDonutChart
}

func dataDonutChart2(last30days: [Day]) -> [PieChartDataEntry] {
    var feelingDonutChart: [PieChartDataEntry]
    var anxietyCount, angryCount, insecureCount, tiredCount, confidentCount, proudCount, relaxedCount, lovingCount: Double
    anxietyCount = 0
    angryCount = 0
    insecureCount = 0
    tiredCount = 0
    confidentCount = 0
    proudCount = 0
    relaxedCount = 0
    lovingCount = 0
    
    for day in last30days {
        let feelings: Set<Feeling> = day.feelings
        
        for feeling in feelings {
            switch feeling {
            case .angry:
                angryCount += 1
            case .anxiety:
                anxietyCount += 1
            case .confident:
                confidentCount += 1
            case .insecure:
                insecureCount += 1
            case .loving:
                lovingCount += 1
            case .proud:
                proudCount += 1
            case .relaxed:
                relaxedCount += 1
            case .tired:
                tiredCount += 1
            }
        }
    }
    
    feelingDonutChart = [PieChartDataEntry(value: relaxedCount, label: NSLocalizedString("relaxed", comment: "")), PieChartDataEntry(value: confidentCount, label: NSLocalizedString("confident", comment: "")), PieChartDataEntry(value: insecureCount, label: NSLocalizedString("insecure", comment: "")), PieChartDataEntry(value: tiredCount, label: NSLocalizedString("tired", comment: "")), PieChartDataEntry(value: anxietyCount, label: NSLocalizedString("anxiety", comment: "")), PieChartDataEntry(value: angryCount, label: NSLocalizedString("angry", comment: "")), PieChartDataEntry(value: lovingCount, label: NSLocalizedString("loving", comment: "")), PieChartDataEntry(value: proudCount, label: NSLocalizedString("proud", comment: ""))]
    
    return feelingDonutChart
}

struct PieChart: UIViewRepresentable {
    var entries: [PieChartDataEntry]
    let pieChart = PieChartView()
    
    func makeUIView(context: Context) -> PieChartView {
        pieChart.delegate = context.coordinator
        return pieChart
    }
    
    func updateUIView(_ uiView: PieChartView, context: Context) {
        let dataSet = PieChartDataSet(entries: entries)
        dataSet.colors = [UIColor(Color("customYellow")), UIColor(Color("customOrange")), UIColor(Color("customPurple")), UIColor(Color("customLightBlue")), UIColor(Color("customBlue")), UIColor(Color("customRed")), UIColor(Color("customPink")), UIColor(Color("customGreen"))]
        let pieChartData = PieChartData(dataSet: dataSet)
        uiView.data = pieChartData
        configureChart(uiView)
        formatCenter(uiView)
        formatLegend(uiView.legend)
        formatDataSet(dataSet)
        uiView.notifyDataSetChanged()
    }
    
    class Coordinator: NSObject, ChartViewDelegate {
        var parent: PieChart
        init(parent: PieChart) {
            self.parent = parent
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func configureChart( _ pieChart: PieChartView) {
        pieChart.animate(xAxisDuration: 1.5, easingOption: .easeOutBack)
        pieChart.drawEntryLabelsEnabled = false
    }
    
    func formatCenter(_ pieChart: PieChartView) {
        pieChart.holeColor = UIColor(Color("card"))
    }
    
    func formatLegend(_ legend: Legend) {
        legend.formSize = 20
        legend.yEntrySpace = 16
        legend.xEntrySpace = 16
    }
    
    func formatDataSet(_ dataSet: ChartDataSet) {
        dataSet.drawValuesEnabled = false
    }
    
}

struct PieChart_Previews : PreviewProvider {
    static var previews: some View {
        PieChart(entries: dataDonutChart(last30days: DatabaseManager.shared.loadLastNDays(N: 30)))
            .frame(height: 300)
    }
}
