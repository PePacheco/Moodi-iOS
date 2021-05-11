//
//  Utilities.swift
//  MyMood-iOS
//
//  Created by Lucca Molon on 04/05/21.
//
import SwiftUI

class PreferencesStore: ObservableObject {
    @AppStorage(wrappedValue: 2, "colorScheme") public var appColorScheme:Int
    @Published public var colorScheme:InternalColorScheme = .initial

    public static var deviceColorScheme:ColorScheme = .light

    init() {
        self.colorScheme = InternalColorScheme(code: appColorScheme)
    }
    public func updateStoredColorScheme(colorScheme: InternalColorScheme) {
        if colorScheme == .auto {
            appColorScheme = 0
            if PreferencesStore.deviceColorScheme == .light {
                self.colorScheme = .light
            } else {
                self.colorScheme = .dark
            }
        } else if colorScheme == .light {
            appColorScheme = 1
            self.colorScheme = .light
        } else {
            appColorScheme = 2
            self.colorScheme = .dark
        }
    }
}

struct DynamicHeightTextField: UIViewRepresentable {
    @Binding var text: String
    @Binding var height: CGFloat
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        
        textView.isScrollEnabled = true
        textView.alwaysBounceVertical = false
        
        textView.text = text
        textView.backgroundColor = UIColor.clear
        
        context.coordinator.textView = textView
        textView.delegate = context.coordinator
        textView.layoutManager.delegate = context.coordinator
        
        return textView
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(dynamicHeightTextField: self)
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

class Coordinator: NSObject, UITextViewDelegate, NSLayoutManagerDelegate {
    
    var dynamicHeightTextField: DynamicHeightTextField
    weak var textView: UITextView?
    
    init(dynamicHeightTextField: DynamicHeightTextField) {
        self.dynamicHeightTextField = dynamicHeightTextField
    }
    
    func textViewDidChange(_ textView: UITextView) {
        self.dynamicHeightTextField.text = textView.text
    }
    
    func textView(
        _ textView: UITextView,
        shouldChangeTextIn range: NSRange,
        replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func layoutManager(
        _ layoutManager: NSLayoutManager,
        didCompleteLayoutFor textContainer: NSTextContainer?,
        atEnd layoutFinishedFlag: Bool) {
        
        DispatchQueue.main.async { [weak self] in
            guard let view = self?.textView else {
                return
            }
            let size = view.sizeThatFits(view.bounds.size)
            if self?.dynamicHeightTextField.height != size.height {
                self?.dynamicHeightTextField.height = size.height
            }
        }
        
    }
}
