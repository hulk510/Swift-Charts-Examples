//
// Copyright © 2022 Swift Charts Examples.
// Open Source - MIT License

import SwiftUI

enum ChartCategory: String, CaseIterable, Hashable, Identifiable {
	case all
	case line
	case bar
	case area
	case range
	case heatMap
	case point

	var id: String { self.rawValue }

	var sfSymbolName: String {
		switch self {
		case .all:
			return ""
		case .line:
			return "chart.xyaxis.line"
		case .bar:
			return "chart.bar.fill"
		case .area:
			return "triangle.fill"
		case .range:
			return "trapezoid.and.line.horizontal.fill"
		case .heatMap:
			return "checkerboard.rectangle"
		case .point:
			return "point.3.connected.trianglepath.dotted"
		}
	}
}

enum ChartType: String, Identifiable, CaseIterable {
	// Line Charts
	case singleLine
	case singleLineLollipop
	case heartBeat
	case animatingLine
	case gradientLine
	case multiLine
	case linePoint

    // Bar Charts
    case singleBar
    case singleBarThreshold
    case twoBars
    case pyramid
    case oneDimensionalBar
    case timeSheetBar
    case soundBar

	// Area Charts
	case areaSimple
	case stackedArea

	// Range Charts
	case rangeSimple
	case rangeHeartRate
	case candleStick

	// HeatMap Charts
	case customizeableHeatMap
	case gitContributions

	// Point Charts
	case scatter
	case vectorField

	var id: String { self.rawValue }

    var title: String {
        switch self {
        case .singleLine:
            return "Line Chart"
        case .singleLineLollipop:
            return "Line Chart with Lollipop"
        case .heartBeat:
            return "Heart Beat / ECG Chart"
        case .animatingLine:
            return "Animating Line"
        case .gradientLine:
            return "Line with changing gradient"
        case .multiLine:
            return "Line Charts"
		case .linePoint:
			return "Line Point"
        case .singleBar:
            return "Single Bar"
        case .singleBarThreshold:
            return "Single Bar with Threshold Rule Mark"
        case .twoBars:
            return "Two Bars"
        case .pyramid:
            return "Pyramid"
        case .oneDimensionalBar:
            return "One Dimensional Bar"
        case .timeSheetBar:
            return "Time Sheet Bar"
        case .soundBar:
            return "Sound Bar"
        case .areaSimple:
            return "Area Chart"
        case .stackedArea:
            return "Stacked Area Chart"
        case .rangeSimple:
            return "Range Chart"
        case .rangeHeartRate:
            return "Heart Rate Range Chart"
        case .candleStick:
            return "Candle Stick Chart"
        case .customizeableHeatMap:
            return "Customizable Heat Map"
        case .gitContributions:
            return "GitHub Contributions Graph"
        case .scatter:
            return "Scatter Chart"
        case .vectorField:
            return "Vector Field"
        }
    }

    var category: ChartCategory {
        switch self {
		case .singleLine, .singleLineLollipop, .heartBeat, .animatingLine, .gradientLine, .multiLine, .linePoint:
            return .line
        case .singleBar, .singleBarThreshold, .twoBars, .pyramid, .oneDimensionalBar, .timeSheetBar, .soundBar:
            return .bar
        case .areaSimple, .stackedArea:
            return .area
        case .rangeSimple, .rangeHeartRate, .candleStick:
            return .range
        case .customizeableHeatMap, .gitContributions:
            return .heatMap
        case .scatter, .vectorField:
            return .point
        }
    }

    var view: some View {
        overviewOrDetailView(isOverview: true)
    }
    
    var chartDescriptor: AXChartDescriptor {
        // This is necessary since we use images for preview/overview
        // TODO: Use protocol coonformance to remove manual switch necessity
        switch self {
        case .singleLine:
            return SingleLine(isOverview: true).makeChartDescriptor()
        case .singleLineLollipop:
            return SingleLineLollipop(isOverview: true).makeChartDescriptor()
        case .multiLine:
            return MultiLine(isOverview: true).makeChartDescriptor()
        case .heartBeat:
            return HeartBeat(isOverview: true).makeChartDescriptor()
        case .animatingLine:
            return AnimatedChart(x: 0, isOverview: true).makeChartDescriptor()
        case .singleBar:
            return SingleBar(isOverview: true).makeChartDescriptor()
        case .singleBarThreshold:
            return SingleBarThreshold(isOverview: true).makeChartDescriptor()
        case .twoBars:
            return TwoBars(isOverview: true).makeChartDescriptor()
        case .oneDimensionalBar:
            return OneDimensionalBar(isOverview: true).makeChartDescriptor()
        case .candleStick:
            return CandleStickChart(isOverview: true).makeChartDescriptor()
        case .timeSheetBar:
            return TimeSheetBar(isOverview: true).makeChartDescriptor()
        case .pyramid:
            return PyramidChart(isOverview: true).makeChartDescriptor()
        case .areaSimple:
            return AreaSimple(isOverview: true).makeChartDescriptor()
        case .stackedArea:
            return StackedArea(isOverview: true).makeChartDescriptor()
        case .rangeSimple:
            return RangeSimple(isOverview: true).makeChartDescriptor()
        case .rangeHeartRate:
            return HeartRateRangeChart(isOverview: true).makeChartDescriptor()
        case .customizeableHeatMap:
            return HeatMap(isOverview: true).makeChartDescriptor()
        case .scatter:
            return ScatterChart(isOverview: true).makeChartDescriptor()
        case .vectorField:
            return VectorField(isOverview: true).makeChartDescriptor()
        case .gradientLine:
            return GradientLine(isOverview: true).makeChartDescriptor()
        case .soundBar:
            return SoundBars(isOverview: true).makeChartDescriptor()
        case .linePoint: fallthrough
        case .gitContributions: fallthrough
        default:
            return GradientLine(isOverview: true).makeChartDescriptor()

        }
    }

    var detailView: some View {
        overviewOrDetailView(isOverview: false)
    }

    @ViewBuilder
    private func overviewOrDetailView(isOverview: Bool) -> some View {
        switch self {
        case .singleLine:
            SingleLine(isOverview: isOverview)
        case .singleLineLollipop:
            SingleLineLollipop(isOverview: isOverview)
        case .heartBeat:
            HeartBeat(isOverview: isOverview)
        case .animatingLine:
            AnimatingLine(isOverview: isOverview)
        case .gradientLine:
            GradientLine(isOverview: isOverview)
        case .multiLine:
            MultiLine(isOverview: isOverview)
		case .linePoint:
			LinePlot(isOverview: isOverview)
        case .singleBar:
            SingleBar(isOverview: isOverview)
        case .singleBarThreshold:
            SingleBarThreshold(isOverview: isOverview)
        case .twoBars:
            TwoBars(isOverview: isOverview)
        case .pyramid:
            PyramidChart(isOverview: isOverview)
        case .oneDimensionalBar:
            OneDimensionalBar(isOverview: isOverview)
        case .timeSheetBar:
            TimeSheetBar(isOverview: isOverview)
        case .soundBar:
            SoundBars(isOverview: isOverview)
        case .areaSimple:
            AreaSimple(isOverview: isOverview)
        case .stackedArea:
            StackedArea(isOverview: isOverview)
        case .rangeSimple:
            RangeSimple(isOverview: isOverview)
        case .rangeHeartRate:
            HeartRateRangeChart(isOverview: isOverview)
        case .candleStick:
            CandleStickChart(isOverview: isOverview)
        case .customizeableHeatMap:
            HeatMap(isOverview: isOverview)
        case .gitContributions:
            GitHubContributionsGraph(isOverview: isOverview)
        case .scatter:
            ScatterChart(isOverview: isOverview)
        case .vectorField:
            VectorField(isOverview: isOverview)
        }
    }
}
