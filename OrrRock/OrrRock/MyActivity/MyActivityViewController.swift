//
//  MyActivityViewController.swift
//  OrrRock
//
//  Created by Park Sungmin on 2022/11/19.
//

import SwiftUI
import UIKit

import SnapKit

class MyActivityViewController: UIViewController {
    
    private lazy var DEBUGBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .orrGray2
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .orrGray2
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
         contentView.backgroundColor = .orrGray2
         contentView.translatesAutoresizingMaskIntoConstraints = false
        
         return contentView
    }()
    
    private lazy var summaryView: UIView = {
        let VC = UIHostingController(rootView: SummaryView())
        VC.view.backgroundColor = .clear
        return VC.view
    }()
    
    private lazy var challengeChartView: UIView = {
        let VC = UIHostingController(rootView: ChallengeChartView())
        VC.view.backgroundColor = .clear
        return VC.view
    }()
    
    private lazy var solvedProblemsChartView: UIView = {
        let VC = UIHostingController(rootView: SolvedProblemsChartView())
        VC.view.backgroundColor = .clear
        return VC.view
    }()
    
    private lazy var paddingView: UIView = {
        return UIView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.backgroundColor = .clear
    }
}

extension MyActivityViewController {
    func setUpLayout() {
        
        view.addSubview(DEBUGBackgroundView)
        DEBUGBackgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.bottom.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.centerX.width.equalToSuperview()
            $0.top.bottom.equalToSuperview()
            
            $0.height.greaterThanOrEqualTo(UIScreen.main.bounds.height + 100)
        }
        
        contentView.addSubview(summaryView)
        summaryView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(contentView)
        }
        
        contentView.addSubview(challengeChartView)
        challengeChartView.snp.makeConstraints {
            $0.leading.trailing.equalTo(contentView)
            $0.top.equalTo(summaryView.snp.bottom).offset(16)
        }
        
        contentView.addSubview(solvedProblemsChartView)
        solvedProblemsChartView.snp.makeConstraints {
            $0.leading.trailing.equalTo(contentView)
            $0.top.equalTo(challengeChartView.snp.bottom).offset(16)
        }
        
        contentView.addSubview(paddingView)
        paddingView.snp.makeConstraints {
            $0.leading.trailing.equalTo(contentView)
            $0.top.equalTo(solvedProblemsChartView.snp.bottom)
            $0.bottom.equalToSuperview()
        }
    }
}
