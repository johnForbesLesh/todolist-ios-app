import UIKit

var taskMgr : TaskManager = TaskManager()

struct task: Codable {
    var name = "un-named"
    var desc = "un-descripted"
}

class TaskManager: NSObject {

    // ponytail: UserDefaults+JSON; move to a file or Core Data if lists get huge
    private let defaultsKey = "tasks"

    var tasks = [task]() {
        didSet { save() }
    }

    override init() {
        super.init()
        if let data = UserDefaults.standard.data(forKey: defaultsKey),
           let saved = try? JSONDecoder().decode([task].self, from: data) {
            tasks = saved
        }
    }

    func addTask(name: String, desc: String){
        tasks.append(task(name: name, desc: desc))
    }

    private func save() {
        if let data = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(data, forKey: defaultsKey)
        }
    }

}
