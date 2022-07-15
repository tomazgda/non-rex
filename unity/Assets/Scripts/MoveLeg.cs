using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using System;
using System.Collections;
using System.Collections.Generic;
//using Unity.MLAgents;
//using Unity.MLAgents.Actuators;

public class MoveLeg : MonoBehaviour
{
    protected HingeJoint jointController;

    private GameObject leg;
    private Vector3 position;
    private float velocity;
    private int frameCount;
    private float force;
    private float targetVelocity;
    
    // Start is called before the first frame update
    void Start()
    {
        print("hi "+this.name);
       // GameObject bottomJaw = GameObject.Find("bottom_jaw"); 
        jointController = GetComponent<HingeJoint>();
        if (jointController == null) print("Couldn't find HingeJoint");
        else print("got a joint controller");
        force = 0;
        var motor = jointController.motor;
        motor.force = force;
        motor.freeSpin = false;
        jointController.motor = motor;
        jointController.useMotor = true;
      
    }

    // Update is called once per frame
    void Update()
    {
        var motor = jointController.motor;
        motor.targetVelocity = targetVelocity;
        motor.force = force;
        jointController.motor = motor; 
    }

    public void moveForward() {
        //var motor = jointController.motor;
        targetVelocity = 1000;
        force = 1000;
        print("FORWARD  "+jointController.transform.rotation);
        return;
    }

    public void moveBack() {
        targetVelocity = 1000;
        force = 1000;
        print("BACK "+jointController.transform.rotation);
        return;
    }    
}

