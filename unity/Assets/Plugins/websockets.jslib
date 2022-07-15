// Defines a plugin which is merged in Unity's library and so javascript functions can be called from within unity.

var plugin = {
    WebSocketInit: function(url)
    {
	var init_url = UTF8ToString(url);
	// requests WebSocket connection with web server
	window.wsclient = new WebSocket(init_url);
	window.wsclient.onopen = function(event) {
	    console.log("[open] Connection established");
	    window.wsclient.send("Unity");
	};

	// when a message is recieved send that message to trex in the unity scene
	window.wsclient.onmessage = function(event) {
	    var received_msg = event.data;
	    // console.log(recieved_msg);

	    // 'trex' is the name of the GameObjcet; 'RecievedMessage' the name of the funciton called
	    SendMessage('trex', 'RecieveMessage', received_msg);
	};
    }
};
mergeInto(LibraryManager.library, plugin);



