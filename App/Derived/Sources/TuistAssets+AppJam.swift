// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum AppJamAsset {
  public enum Assets {
    public static let accentColor = AppJamColors(name: "AccentColor")
  }
  public enum Colors {
    public static let bg = AppJamColors(name: "BG")
    public static let black = AppJamColors(name: "Black")
    public static let darkGray = AppJamColors(name: "DarkGray")
    public static let gray = AppJamColors(name: "Gray")
    public static let lightGray = AppJamColors(name: "LightGray")
    public static let lightPrimary = AppJamColors(name: "LightPrimary")
    public static let androidColor = AppJamColors(name: "AndroidColor")
    public static let backendColor = AppJamColors(name: "BackendColor")
    public static let designColor = AppJamColors(name: "DesignColor")
    public static let frontendColor = AppJamColors(name: "FrontendColor")
    public static let iosColor = AppJamColors(name: "iOSColor")
    public static let pmColor = AppJamColors(name: "PMColor")
    public static let primary = AppJamColors(name: "Primary")
    public static let veryDarkGray = AppJamColors(name: "VeryDarkGray")
    public static let white = AppJamColors(name: "White")
  }
  public enum Icons {
    public static let lock = AppJamImages(name: "Lock")
    public static let logo = AppJamImages(name: "Logo")
    public static let person = AppJamImages(name: "Person")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class AppJamColors {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension AppJamColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: AppJamColors) {
    let bundle = AppJamResources.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
public extension SwiftUI.Color {
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  init(asset: AppJamColors) {
    let bundle = AppJamResources.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct AppJamImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = AppJamResources.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

public extension AppJamImages.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the AppJamImages.image property")
  convenience init?(asset: AppJamImages) {
    #if os(iOS) || os(tvOS)
    let bundle = AppJamResources.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Image {
  init(asset: AppJamImages) {
    let bundle = AppJamResources.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: AppJamImages, label: Text) {
    let bundle = AppJamResources.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: AppJamImages) {
    let bundle = AppJamResources.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
