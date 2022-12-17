// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(OSX)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
public enum AppJamFontFamily {
  public enum SpoqaHanSansNeo {
    public static let bold = AppJamFontConvertible(name: "SpoqaHanSansNeo-Bold", family: "Spoqa Han Sans Neo", path: "SpoqaHanSansNeo-Bold.otf")
    public static let light = AppJamFontConvertible(name: "SpoqaHanSansNeo-Light", family: "Spoqa Han Sans Neo", path: "SpoqaHanSansNeo-Light.otf")
    public static let medium = AppJamFontConvertible(name: "SpoqaHanSansNeo-Medium", family: "Spoqa Han Sans Neo", path: "SpoqaHanSansNeo-Medium.otf")
    public static let regular = AppJamFontConvertible(name: "SpoqaHanSansNeo-Regular", family: "Spoqa Han Sans Neo", path: "SpoqaHanSansNeo-Regular.otf")
    public static let thin = AppJamFontConvertible(name: "SpoqaHanSansNeo-Thin", family: "Spoqa Han Sans Neo", path: "SpoqaHanSansNeo-Thin.otf")
    public static let all: [AppJamFontConvertible] = [bold, light, medium, regular, thin]
  }
  public static let allCustomFonts: [AppJamFontConvertible] = [SpoqaHanSansNeo.all].flatMap { $0 }
  public static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

public struct AppJamFontConvertible {
  public let name: String
  public let family: String
  public let path: String

  #if os(OSX)
  public typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Font = UIFont
  #endif

  public func font(size: CGFloat) -> Font {
    guard let font = Font(font: self, size: size) else {
      fatalError("Unable to initialize font '\(name)' (\(family))")
    }
    return font
  }

  public func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    // swiftlint:disable:next implicit_return
    return Bundle.module.url(forResource: path, withExtension: nil)
  }
}

public extension AppJamFontConvertible.Font {
  convenience init?(font: AppJamFontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(OSX)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}
// swiftlint:enable all
// swiftformat:enable all
