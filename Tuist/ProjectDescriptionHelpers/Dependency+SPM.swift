import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let RxSwift = TargetDependency.external(name: "RxSwift")
    static let RxCocoa = TargetDependency.external(name: "RxCocoa")
    static let RxRelay = TargetDependency.external(name: "RxRelay")
    static let SnapKit = TargetDependency.external(name: "SnapKit")
    static let Then = TargetDependency.external(name: "Then")
    static let Reusable = TargetDependency.external(name: "Reusable")
    static let Lottie = TargetDependency.external(name: "Lottie")
    static let ViewAnimator = TargetDependency.external(name: "ViewAnimator")
}

