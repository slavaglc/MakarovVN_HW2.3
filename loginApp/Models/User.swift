

struct User {
    let name: String
    let password: String
    let description: String
    
    static func getAdminUser() -> User {
        User(name: "Slava", password: "mypass", description: "")
    }
    
}
