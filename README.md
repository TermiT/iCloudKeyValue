# iCloudKeyValue
Tiny Unity plugin to add support for Apple iCloud Key-Value storage (iOS/OSX)

## iOS
Drag&Drop `iCloudKeyValue/Plugin.m` to `Plugins/iOS` in Unity. Add function signatures to your C# class.
```C#
using UnityEngine;
using System.Runtime.InteropServices;
public static class SomeClass

	[DllImport ("__Internal")]
	private static extern void iCloudKV_Synchronize();
	
	[DllImport ("__Internal")]
	private static extern void iCloudKV_SetInt(string key, int value);
	
	[DllImport ("__Internal")]
	private static extern void iCloudKV_SetFloat(string key, float value);
	
	[DllImport ("__Internal")]
	private static extern int iCloudKV_GetInt(string key);
	
	[DllImport ("__Internal")]
	private static extern float iCloudKV_GetFloat(string key);
	
	[DllImport ("__Internal")]
	private static extern void iCloudKV_Reset();
	
	// Use this for initialization
	void Start () {
	  iCloudKV_Synchronize();
	  int test = iCloudKV_GetInt("test");
	  Debug.Log("iCloud Key-Value test: " + test);
	  test++;
	  iCloudKV_SetInt("test", test);
	  iCloudKV_Synchronize();
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
```
## OS X
Build the project. Copy `iCloudKeyValue.bundle` to `Plugins` in Unity. Add function signatures to your C# class.

```C#
using UnityEngine;
using System.Runtime.InteropServices;
public static class SomeClass

	[DllImport ("iCloudKeyValue")]
	private static extern void iCloudKV_Synchronize();
	
	[DllImport ("iCloudKeyValue")]
	private static extern void iCloudKV_SetInt(string key, int value);
	
	[DllImport ("iCloudKeyValue")]
	private static extern void iCloudKV_SetFloat(string key, float value);
	
	[DllImport ("iCloudKeyValue")]
	private static extern int iCloudKV_GetInt(string key);
	
	[DllImport ("iCloudKeyValue")]
	private static extern float iCloudKV_GetFloat(string key);
	
	[DllImport ("iCloudKeyValue")]
	private static extern void iCloudKV_Reset();
	
	// Use this for initialization
	void Start () {
	  iCloudKV_Synchronize();
	  int test = iCloudKV_GetInt("test");
	  Debug.Log("iCloud Key-Value test: " + test);
	  test++;
	  iCloudKV_SetInt("test", test);
	  iCloudKV_Synchronize();
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}

