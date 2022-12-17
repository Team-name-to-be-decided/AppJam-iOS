import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "AppJam",
    product: .app,
    packages: [
        
    ],
    dependencies: [
        
    ],
    resources: ["Resources/**"],
    infoPlist: .file(path: "Support/Info.plist")
)
