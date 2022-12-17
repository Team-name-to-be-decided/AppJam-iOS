import Foundation
import UIKit

enum Major: String, CaseIterable {
    case all
    case pm
    case ios
    case android
    case frontend
    case backend
    case design
}

extension Major {
    var display: String {
        switch self {
        case .all:
            return "ALL"
        case .pm:
            return "PM"
        case .ios:
            return "iOS"
        case .android:
            return "Android"
        case .frontend:
            return "Frontend"
        case .backend:
            return "Backend"
        case .design:
            return "Design"
        }
    }

    var primaryColor: UIColor {
        switch self {
        case .all:
            return AppJamAsset.Colors.pmColor.color
        case .pm:
            return AppJamAsset.Colors.pmColor.color
        case .ios:
            return AppJamAsset.Colors.iosColor.color
        case .android:
            return AppJamAsset.Colors.androidColor.color
        case .frontend:
            return AppJamAsset.Colors.frontendColor.color
        case .backend:
            return AppJamAsset.Colors.backendColor.color
        case .design:
            return AppJamAsset.Colors.designColor.color
        }
    }

    var foregroundColor: UIColor {
        switch self {
        case .all, .pm, .android, .backend, .design:
            return AppJamAsset.Colors.white.color
        case .ios, .frontend:
            return AppJamAsset.Colors.black.color
        }
    }
}
