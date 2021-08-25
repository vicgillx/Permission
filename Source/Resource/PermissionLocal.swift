//
//  String+Extension.swift
//  Permission
//
//  Created by vicgil on 2021/8/25.
//  Copyright © 2021 delba. All rights reserved.
//

extension String{
    class NoUse {}
    var localizedString:String {
        let bundlePaths = Bundle(for: NoUse.self).paths(forResourcesOfType: "bundle", inDirectory: nil)
        guard bundlePaths.count > 0 , let resourcePath = bundlePaths.first, let bundle = Bundle(path: resourcePath) else {
            return ""
        }
        let msg = NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
        return msg
    }
}

