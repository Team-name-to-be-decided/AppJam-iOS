import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "AppJam",
    product: .app,
    dependencies: [
        .SPM.RxSwift,
        .SPM.RxCocoa,
        .SPM.RxRelay,
        .SPM.SnapKit,
        .SPM.Then,
        .SPM.Reusable,
        .SPM.ViewAnimator
    ],
    resources: ["Resources/**"],
    infoPlist: .file(path: "Support/Info.plist")
)
