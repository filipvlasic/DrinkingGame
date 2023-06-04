//
//  SegeSaleViewController.swift
//  Drinking Game App
//
//  Created by Filip Vlašić on 04.06.2023..
//

import UIKit

class SegeSaleViewController: BaseViewController {
    private var gameDescription: String = "A - ti piješ\n2 - podijeli dva gutljaja\n3 - podijeli tri gutljaja\n4 - podijeli četiri gutljaja\n5 - svi piju\n6 - nabrajanje\n\todaberi neku kategoriju za nabrajanje - svaka osoba redom mora nabrojiti pojam iz te kategorije\n\tprvi tko ne zna ili ponovi - PIJE\n7 - glava dolje\n\tsvi moraju spustiti glavu dolje na stol\n\tosoba koja zadnja spusti glavu dolje - PIJE\n8 - odaberi prijatelja\n\todaberi osobu koja mora piti kad god ti piješ\n9 - nadimak\n\todaberi nadimak za neku osobu te svi moraju tu osobu oslovljavati tim nadimkom do kraja igre\n\ttko pogriješi - PIJE\n10 - SHEGA SHALA\n\tkrenite brojati u krug tako da prva osoba kaže 1, druga 2, ...\n\tno umjesto brojeva koji sadrže znamenku 3 ili su dijeljivi s 3 potrebno je reći “ŠEGA”\n\tumjesto brojeva koji sadrže znamenku 7 ili su djeljivi sa 7 potrebno je reći “ŠALA”\n\tkada broj zadovoljava oba kriterija potrebno je reći “ŠEGA ŠALA”\nJ - ruke gore\n\tsvi moraju dignuti ruke u zrak\n\tosoba koja zadnja podigne ruke - PIJE\nQ - pravilo\n\tizmisli pravilo i svi se moraju pridržavati tog pravila do kraja igre\n\tu protivnom - PIJU\nK - kraljev koktel\n\tza svaki od prva tri kralja potrebno je doliti vlastito piće u posebnu čašu\n\tonaj tko izvuće posljednjeg kralja mora popiti taj koktel"
    private var imageView: UIImageView!
    private var cardDescriptionLabel: UILabel!
    private var nextCardButton: UIButton!
    var router: AppRouter!
    
    private let cardImages: [UIImage] = [
        UIImage(named: "ace_h")!,
        UIImage(named: "ace_s")!,
        UIImage(named: "ace_c")!,
        UIImage(named: "ace_d")!,
        
        UIImage(named: "king_h")!,
        UIImage(named: "king_s")!,
        UIImage(named: "king_c")!,
        UIImage(named: "king_d")!,
        
        UIImage(named: "queen_h")!,
        UIImage(named: "queen_s")!,
        UIImage(named: "queen_c")!,
        UIImage(named: "queen_d")!,
        
        UIImage(named: "jack_h")!,
        UIImage(named: "jack_s")!,
        UIImage(named: "jack_c")!,
        UIImage(named: "jack_d")!,
        
        UIImage(named: "2_h")!,
        UIImage(named: "2_s")!,
        UIImage(named: "2_c")!,
        UIImage(named: "2_d")!,
        
        UIImage(named: "3_h")!,
        UIImage(named: "3_s")!,
        UIImage(named: "3_c")!,
        UIImage(named: "3_d")!,
        
        UIImage(named: "4_h")!,
        UIImage(named: "4_s")!,
        UIImage(named: "4_c")!,
        UIImage(named: "4_d")!,
        
        UIImage(named: "5_h")!,
        UIImage(named: "5_s")!,
        UIImage(named: "5_c")!,
        UIImage(named: "5_d")!,
        
        UIImage(named: "6_h")!,
        UIImage(named: "6_s")!,
        UIImage(named: "6_c")!,
        UIImage(named: "6_d")!,
        
        UIImage(named: "7_h")!,
        UIImage(named: "7_s")!,
        UIImage(named: "7_c")!,
        UIImage(named: "7_d")!,
        
        UIImage(named: "8_h")!,
        UIImage(named: "8_s")!,
        UIImage(named: "8_c")!,
        UIImage(named: "8_d")!,
        
        UIImage(named: "9_h")!,
        UIImage(named: "9_s")!,
        UIImage(named: "9_c")!,
        UIImage(named: "9_d")!,
        
        UIImage(named: "10_h")!,
        UIImage(named: "10_s")!,
        UIImage(named: "10_c")!,
        UIImage(named: "10_d")!
    ]
    
    private let cardDescriptions: [String] = [
        "TI PIJEŠ",
        "TI PIJEŠ",
        "TI PIJEŠ",
        "TI PIJEŠ",
        
        "KRALJEV KOKTEL",
        "KRALJEV KOKTEL",
        "KRALJEV KOKTEL",
        "KRALJEV KOKTEL",
        
        "PRAVILO",
        "PRAVILO",
        "PRAVILO",
        "PRAVILO",
        
        "RUKE GORE",
        "RUKE GORE",
        "RUKE GORE",
        "RUKE GORE",
        
        "PODIJELI 2 GUTLJAJA",
        "PODIJELI 2 GUTLJAJA",
        "PODIJELI 2 GUTLJAJA",
        "PODIJELI 2 GUTLJAJA",
        
        "PODIJELI 3 GUTLJAJA",
        "PODIJELI 3 GUTLJAJA",
        "PODIJELI 3 GUTLJAJA",
        "PODIJELI 3 GUTLJAJA",
        
        "PODIJELI 4 GUTLJAJA",
        "PODIJELI 4 GUTLJAJA",
        "PODIJELI 4 GUTLJAJA",
        "PODIJELI 4 GUTLJAJA",
        
        "SVI PIJU",
        "SVI PIJU",
        "SVI PIJU",
        "SVI PIJU",
        
        "NABRAJANJE",
        "NABRAJANJE",
        "NABRAJANJE",
        "NABRAJANJE",
        
        "GLAVA DOLJE",
        "GLAVA DOLJE",
        "GLAVA DOLJE",
        "GLAVA DOLJE",
        
        "ODABERI PRIJATELJA",
        "ODABERI PRIJATELJA",
        "ODABERI PRIJATELJA",
        "ODABERI PRIJATELJA",
        
        "NADIMAK",
        "NADIMAK",
        "NADIMAK",
        "NADIMAK",
        
        "ŠEGA ŠALA",
        "ŠEGA ŠALA",
        "ŠEGA ŠALA",
        "ŠEGA ŠALA"
    ]
    
    private var currentCardIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
        updateCard()
        addActions()
    }
    
    init(router: AppRouter) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViews() {
        createViews()
        layoutViews()
        styleViews()
    }

    private func createViews() {
        imageView = UIImageView()
        view.addSubview(imageView)
        
        cardDescriptionLabel = UILabel()
        view.addSubview(cardDescriptionLabel)
        
        nextCardButton = UIButton(type: .system)
        nextCardButton.setTitle("sljedeća karta", for: .normal)
        nextCardButton.addTarget(self, action: #selector(nextCardButtonTapped), for: .touchUpInside)
        view.addSubview(nextCardButton)
        
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    private func styleViews() {
        view.backgroundColor = UIColor(red: 0.96, green: 0.89, blue: 0.79, alpha: 1.00)
        self.title = "Šega šala"
        
        imageView.contentMode = .scaleAspectFit
        
        cardDescriptionLabel.textAlignment = .center
        cardDescriptionLabel.textColor = UIColor(red: 0.40, green: 0.26, blue: 0.13, alpha: 1.0)
        cardDescriptionLabel.font = .systemFont(ofSize: 30, weight: .bold)
        
        nextCardButton.setTitleColor(.white, for: .normal)
        nextCardButton.backgroundColor = .systemPurple
        nextCardButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        nextCardButton.layer.cornerRadius = 10
        
    }

    private func layoutViews() {
        imageView.autoPinEdge(toSuperviewSafeArea: .top, withInset: 50)
        imageView.autoSetDimensions(to: CGSize(width: 400, height: 500))
        imageView.autoAlignAxis(toSuperviewAxis: .vertical)
        
        cardDescriptionLabel.autoPinEdge(.top, to: .bottom, of: imageView, withOffset: 10)
        cardDescriptionLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        
        nextCardButton.autoPinEdge(.top, to: .bottom, of: cardDescriptionLabel, withOffset: 20)
        nextCardButton.autoSetDimensions(to: CGSize(width: 200, height: 50))
        nextCardButton.autoAlignAxis(toSuperviewAxis: .vertical)
    }
    
    private func updateCard() {
        let cardImage = cardImages[currentCardIndex]
        let cardDescription = cardDescriptions[currentCardIndex]
        
        imageView.image = cardImage
        cardDescriptionLabel.text = cardDescription
    }
    
    @objc private func nextCardButtonTapped() {
        let randomIndex = Int.random(in: 0..<cardImages.count)
        currentCardIndex = randomIndex
        updateCard()
    }
    
    private func addActions() {
        navigationItem.rightBarButtonItem?.target = self
        navigationItem.rightBarButtonItem?.action = #selector(infoButtonTapped)
    }
    
    @objc private func infoButtonTapped() {
        router.showGameDetailsScreen(gameTitle: title!, gameDescription: gameDescription)
    }
    
}
