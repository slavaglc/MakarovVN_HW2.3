

struct User {
    let name: String
    let password: String
    let description: String
    let favouriteBooks: [Book]
    
    static func getAdminUser() -> User {
        User(name: "Slava", password: "mypass", description: """
Всем привет! Меня зовут Вячеслав. Мне 25 лет, я работаю инженером-электроником на военном заводе.
 Студент 5-ого курса, учусь по специальности "Электроэнергетика и электротехника. Технику любил с детства, уже в 13 лет изучал Visual Basic, писал моды для игр. Раньше изучал язык Java, потом решил перейти на Swift, так как я поклонники техники Apple
""", favouriteBooks: [Book(title: "Похождения Бравого Солдата Швейка", author: "Я.Гашек", description: ""), Book(title: "Изучаем Java", author: "Кэти Сьерра и Берт Бейтс", description: "Самоучитель по Java")])
    }
}
