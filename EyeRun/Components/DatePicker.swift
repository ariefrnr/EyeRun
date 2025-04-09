
//
//  DatePicker.swift
//  EyeRun
//
//  Created by Jonathan Tjahjadi on 25/03/25.
//

import SwiftUI

struct DatePicker: View {
    @Binding private var selectedDate: Date
    let dates: [Date]
    
    init(selectedDate: Binding<Date>) {
        self._selectedDate = selectedDate
        self.dates = Self.generateDates(from: selectedDate.wrappedValue)
       
    }
    
    private static func generateDates(from date: Date) -> [Date] {
        let calendar = Calendar.current
        let today = Date()
        
        // Generate dates from 10 days before today to 3 days after today
        return (-10...3).map { index in
            calendar.date(byAdding: .day, value: index, to: today)!
        }
    }
    
    var body: some View {
        ScrollViewReader { scrollProxy in
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(dates, id: \.self) { date in
                        VStack {
                            Text(dayAbbreviation(from: date))
                                .font(.caption)
                                .foregroundColor(isSameDay(date1: date, date2: selectedDate) ? .white : .gray)
                            
                            Text(dayNumber(from: date))
                                .font(.system(size: 24))
                            
                        }
                        .frame(width: 45, height: 56)
                        .background(isSameDay(date1: date, date2: selectedDate) ? Color.customizedOrange : Color.white)
                        .foregroundColor(isSameDay(date1: date, date2: selectedDate) ? .white : isDateInFuture(date) ? .gray : Color.customizedOrange)
                        .cornerRadius(10)
                        .onTapGesture {
                            if !isDateInFuture(date) {
                                selectedDate = date
                            }
                            print(selectedDate)
                        }
                        .opacity(isDateInFuture(date) ? 0.8 : 1.0)
                        .id(date)
                    }
                }
                .padding(4)
                .cornerRadius(15)
                .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
            }
            .scrollIndicators(.hidden)
            .onAppear {
                let today = Date()
                if let todayDate = dates.first(where: { isSameDay(date1: $0, date2: today) }) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {scrollProxy.scrollTo(todayDate, anchor: .center)
                        
                        selectedDate = today
                    }
                }
            }
        }
    }
    
    private func isDateInFuture(_ date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.compare(date, to: Date(), toGranularity: .day) == .orderedDescending
    }
    
    private func dayAbbreviation(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter.string(from: date).uppercased()
    }
    
    private func dayNumber(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: date)
    }
    
    private func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
}

// Preview
struct DatePicker_Previews: PreviewProvider {
    static var previews: some View {
        // Create a static state wrapper for the preview
        PreviewWrapper()
    }
    
    // Helper struct to hold state for the preview
    private struct PreviewWrapper: View {
        @State private var selectedDate = Date()
        
        var body: some View {
            DatePicker(selectedDate: $selectedDate)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
