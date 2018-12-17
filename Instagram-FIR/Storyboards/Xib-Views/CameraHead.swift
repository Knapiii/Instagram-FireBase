//
//  Camera+Post.swift
//  Instagram-FIR
//
//  Created by Kristoffer Knape on 2018-10-17.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CameraHead: UIView {

    @IBOutlet var cameraHead: UIView!
    @IBOutlet weak var placeHolderImage: UIImageView!
    @IBOutlet weak var caption: UITextView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commitInit()
    }

    private func commitInit() {
        let bundle = Bundle(for: CameraHead.self)
        bundle.loadNibNamed(NibName.CameraHead, owner: self, options: nil)
        addSubview(cameraHead)
        cameraHead.frame = self.bounds
        cameraHead.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        caption.placeholder = "Write an awesome caption"
    }

}
