//
// PermissionType.swift
//
// Copyright (c) 2015-2019 Damien (http://delba.io)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

public enum PermissionType {
    case contacts
    case locationAlways
    case locationWhenInUse
    case notifications(UNAuthorizationOptions)
    case microphone
    case camera
    case photos
    case reminders
    case events
    case bluetooth
    case motion
    @available(iOS 10.0, *) case speechRecognizer
    @available(iOS 9.3, *) case mediaLibrary
    @available(iOS 10.0, *) case siri
    case never
}

extension PermissionType: CustomStringConvertible {
    public var description: String {
        switch self {
        case .contacts: return "Contacts".localizedString
        case .locationAlways: return "Location".localizedString
        case .locationWhenInUse: return "Location".localizedString
        case .notifications: return "Notifications".localizedString
        case .microphone: return "Microphone".localizedString
        case .camera: return "Camera".localizedString
        case .photos: return "Photos".localizedString
        case .reminders: return "Reminders".localizedString
        case .events: return "Events".localizedString
        case .bluetooth: return "Bluetooth".localizedString
        case .motion: return "Motion".localizedString
        case .speechRecognizer: return "Speech Recognizer".localizedString
        case .siri: return "SiriKit".localizedString
        case .mediaLibrary: return "Media Library".localizedString

        case .never: fatalError()
        }
    }
}
