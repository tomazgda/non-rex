using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Runtime.InteropServices;

public class WebSockets : MonoBehaviour
{
    // to store the last recieved message
    string command;

    private MoveLowerJaw jawScript;

    	// EXAMPLE CODE FOR MOVING LEGS
    
    	// private MoveLeg leftLegScript;
    	// private MoveLeg rightLegScript;

    // provide access to javascript method
    [DllImport("__Internal")]
    private static extern void WebSocketInit(string url);

    void Start() {
	WebSocketInit("ws://20.0.152.39:9010/");

	// access the GameObject bottom jaw
        GameObject bottomJaw = GameObject.Find("bottom_jaw");
        if (bottomJaw != null) {
	    // 
            jawScript = bottomJaw.GetComponent<MoveLowerJaw>();
        }

		// EXAMPLE CODE FOR MOVING LEGS

		// GameObject leftLeg = GameObject.Find("left_hip");
        	// if (leftLeg != null) {
	        //     leftLegScript = leftLeg.GetComponent<MoveLeg>();
        	// }

		// GameObject rightLeg = GameObject.Find("right_hip");
        	// if (rightLeg != null) {
	        //     rightLegScript = rightLeg.GetComponent<MoveLeg>();
        	// }
    }

    // recieves messages, called from javascript
    // and also handles signals that trigger events handled by other functions like opening and closing the jaw
    void RecieveMessage(string message) {
	switch (message) {

	    // EXAMPLE CODE FOR MOVING LEGS
	    
	    // case "left-forward":
	    //     leftLegScript.moveForward();
	    //     break;
	    // case "left-back":
	    //     leftLegScript.moveBack();
	    //     break;
	    // case "right-forward":
	    //     rightLegScript.moveForward();
	    //     break;
	    // case "right-back":
	    //     rightLegScript.moveBack();
	    //     break;
	    
	    
	case "open":
	    jawScript.OpenJaw();
	    break;
	case "close":
	    jawScript.CloseJaw();
	    break;
	case "stop":
	    command = "";	// sets command to an empty sting so that Rex doesn't move
	    break;
	default:
	    command = message; 	// sets command to the message so that Rex does move
	    break;
	}
    }
    
    // Update is called once per frame
    void Update()
    {
	// Just transforms Rex's position depending on the last recieved message of any of the below strings
     	switch (command) {
	case "left":
	    transform.position += new Vector3(-1, 0, 0) * Time.deltaTime * 10;
	    break;
	case "right":
	    transform.position += new Vector3(1, 0, 0) * Time.deltaTime * 10;
	    break;
	case "up":
	    transform.position += new Vector3(0, 0, 1) * Time.deltaTime * 10;
	    break;
	case "down":
	    transform.position += new Vector3(0, 0, -1) * Time.deltaTime * 10;
	    break;
	}   
    }
}
