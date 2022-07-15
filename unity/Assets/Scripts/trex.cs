using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class trex : MonoBehaviour
{

    private GameObject rightCalf;
    private GameObject leftCalf;
    
    // Start is called before the first frame update
    void Start()
    {
	rightCalf = GameObject.Find("right_calf");
	leftCalf = GameObject.Find("left_calf");
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.LeftArrow)) {
	    leftCalf.transform.position += new Vector3(0, -5, 0);
	    Debug.Log("left");
	}
	if (Input.GetKeyDown(KeyCode.RightArrow)) {
	    rightCalf.transform.position += new Vector3(0, -5, 0);
	    Debug.Log("right");
	}
    }
}
