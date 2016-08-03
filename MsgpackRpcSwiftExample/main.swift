//
//  main.swift
//  MsgpackRpcSwiftExample
//
//  Created by y-okubo on 2016/08/03.
//  Copyright © 2016 Nekojarashi Inc. All rights reserved.
//

import Foundation

func serverRequestHandler(messageId: NSNumber?, method: String?, params: [AnyObject]?, completion: (MPRequestCompletion)?) {
    print(method!)
    print(params!)
    completion!(nil, "OK")
}

// Client

var client: MPMessagePackClient = MPMessagePackClient()

client.openWithHost("127.0.0.1", port: 5000, completion: {error in
    client.sendRequestWithMethod("echo", params: ["Call From Swift"], messageId: 0, completion: {error, result in
        print(result)
    })
})

// Server

var server: MPMessagePackServer = MPMessagePackServer()

server.requestHandler = serverRequestHandler

do {
    try server.openWithPort(5001)
}
catch let error as NSError {
    print(error)
}

// Waiting
NSRunLoop.currentRunLoop().run()
