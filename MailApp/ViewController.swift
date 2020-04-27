import UIKit

class ViewController: UIViewController {
    
    let idCell = "mailCell"
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    // Количество ячеек
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Если мы хотим разное количество ячеек в секции
        if section == 0 {
            return 2
        } else {
            return 5
        }
    }
    
    // Cама ячейка
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Переиспользуем ячейки которые у нас не видны на экране чтобы не расходовать память
        var cell = tableView.dequeueReusableCell(withIdentifier: idCell)
        // Если нечего переиспользовать, нет ячеек, тогда создаем новую
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: idCell)
            print("Create")
        }
        
        // Можно менять наполнение ячеек в различной секции
        if (indexPath.section == 0) {
            cell!.textLabel?.text = "Mail Subject"
            cell!.detailTextLabel?.text = "details text"
            cell!.imageView?.image = #imageLiteral(resourceName: "github")
        } else {
            cell!.textLabel?.text = "Mail Message"
            cell!.detailTextLabel?.text = "text"
        }
        return cell!
    }
    
    // Хедер (заголовок у секции)
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section"
    }
    
    // Высота нашей ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    // Выбор ячейки когда мы на неё нажимаем
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    
    // Количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}
