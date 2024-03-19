//
//  SOSwidget.swift
//  SOSwidget
//
//  Created by Krish Mittal on 19/03/24.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entry = SimpleEntry(date: Date())
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct SOSwidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack{
            Circle()
                .frame(width: 300)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.orange, .red]), startPoint: .top, endPoint: .bottom))
                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
            
            Text("SOS")
                .font(.system(size: 40, weight: .bold))
                .foregroundStyle(.white)
        }
    }
}

struct SOSwidget: Widget {
    let kind: String = "SOSwidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                SOSwidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                SOSwidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("SOS Widget")
        .description("Tap to send SOS.")
        .supportedFamilies([.systemSmall])
    }
}

#Preview(as: .systemSmall) {
    SOSwidget()
} timeline: {
    SimpleEntry(date: .now)
}
