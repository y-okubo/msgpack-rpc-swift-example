//
//  main.swift
//  MsgpackRpcSwiftExample
//
//  Created by y-okubo on 2016/08/03.
//  Copyright © 2016 Nekojarashi Inc. All rights reserved.
//

import Foundation

var client: MPMessagePackClient = MPMessagePackClient()
var server: MPMessagePackServer = MPMessagePackServer()

client.openWithHost("127.0.0.1", port: 5000, completion: {error in
    client.sendRequestWithMethod("echo", params: ["Call From Swift"], messageId: 0, completion: {error, result in
        print(result)
    })
})

NSRunLoop.currentRunLoop().run()
