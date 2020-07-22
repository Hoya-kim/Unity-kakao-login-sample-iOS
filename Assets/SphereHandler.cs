using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SphereHandler : MonoBehaviour {

	// Use this for initialization
	void Start () {
		Debug.Log("Test function called");
		FrameworkBridge.SendLoginKakaoIOS();
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
