
//
//  DatePicker.swift
//  EyeRun
//
//  Created by Jonathan Tjahjadi on 25/03/25.
//

import SwiftUI

struct DatePicker: View {
    @State private var selectedDate = Date()
    let dates: [Date]
    
    init(selectedDate: Date = Date()) {
        self.selectedDate = selectedDate
        self.dates = Self.generateWeekDates(from: selectedDate)
    }
    
    private static func generateWeekDates(from date: Date) -> [Date] {
        let calendar = Calendar.current
        guard let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)) else {
            return []
        }
        
        return (-20..<5).map { index in
            calendar.date(byAdding: .day, value: index, to: startOfWeek)!
        }
    }
    
    var body: some View {
        ScrollViewReader { scrollProxy in
            ScrollView(.horizontal){
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
                        }
                        .opacity(isDateInFuture(date) ? 0.8 : 1.0)
                        
                    }
                }
                .padding(4)
                .cornerRadius(15)
                .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
            }
            .scrollIndicators(.hidden)
            .onAppear {
                // Find today's date and center it
                let today = Date()
                if let todayDate = dates.first(where: { isSameDay(date1: $0, date2: today) }) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        
                        scrollProxy.scrollTo(todayDate, anchor: .center)
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
        DatePicker()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

//#Preview {
//    DatePicker(.selectedDate: .constant(Date))
//}
