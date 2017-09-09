// 
// Created by the DataSnap proxy generator.
// 31/08/2017 14:50:44
// 

function DSAdmin(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("DSAdmin",connectionInfo);

  /*
   * @return result - Type on server: string
   */
  this.GetPlatformName = function() {
    var returnObject = this.executor.executeMethod('GetPlatformName', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GetPlatformName_URL = function() {
    return this.executor.getMethodURL("GetPlatformName", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: Boolean
   */
  this.ClearResources = function() {
    var returnObject = this.executor.executeMethod('ClearResources', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.ClearResources_URL = function() {
    return this.executor.getMethodURL("ClearResources", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDBXReader
   */
  this.FindPackages = function() {
    var returnObject = this.executor.executeMethod('FindPackages', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.FindPackages_URL = function() {
    return this.executor.getMethodURL("FindPackages", "GET", [], arguments[0])[0];
  };

  /*
   * @param PackageName [in] - Type on server: string
   * @param ClassPattern [in] - Type on server: string
   * @return result - Type on server: TDBXReader
   */
  this.FindClasses = function(PackageName, ClassPattern) {
    var returnObject = this.executor.executeMethod('FindClasses', "GET", [PackageName, ClassPattern], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.PackageName = PackageName;
        resultObject.ClassPattern = ClassPattern;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.FindClasses_URL = function(PackageName, ClassPattern) {
    return this.executor.getMethodURL("FindClasses", "GET", [PackageName, ClassPattern], arguments[2])[0];
  };

  /*
   * @param PackageName [in] - Type on server: string
   * @param ClassPattern [in] - Type on server: string
   * @param MethodPattern [in] - Type on server: string
   * @return result - Type on server: TDBXReader
   */
  this.FindMethods = function(PackageName, ClassPattern, MethodPattern) {
    var returnObject = this.executor.executeMethod('FindMethods', "GET", [PackageName, ClassPattern, MethodPattern], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.PackageName = PackageName;
        resultObject.ClassPattern = ClassPattern;
        resultObject.MethodPattern = MethodPattern;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.FindMethods_URL = function(PackageName, ClassPattern, MethodPattern) {
    return this.executor.getMethodURL("FindMethods", "GET", [PackageName, ClassPattern, MethodPattern], arguments[3])[0];
  };

  /*
   * @param ClassReader [in] - Type on server: TDBXReader
   */
  this.CreateServerClasses = function(ClassReader) {
    this.executor.executeMethod('"CreateServerClasses"', "POST", [ClassReader], arguments[1], false, arguments[2], arguments[3]);
  };

  /*
   * @param ClassReader [in] - Type on server: TDBXReader
   */
  this.DropServerClasses = function(ClassReader) {
    this.executor.executeMethod('"DropServerClasses"', "POST", [ClassReader], arguments[1], false, arguments[2], arguments[3]);
  };

  /*
   * @param MethodReader [in] - Type on server: TDBXReader
   */
  this.CreateServerMethods = function(MethodReader) {
    this.executor.executeMethod('"CreateServerMethods"', "POST", [MethodReader], arguments[1], false, arguments[2], arguments[3]);
  };

  /*
   * @param MethodReader [in] - Type on server: TDBXReader
   */
  this.DropServerMethods = function(MethodReader) {
    this.executor.executeMethod('"DropServerMethods"', "POST", [MethodReader], arguments[1], false, arguments[2], arguments[3]);
  };

  /*
   * @return result - Type on server: TDBXReader
   */
  this.GetServerClasses = function() {
    var returnObject = this.executor.executeMethod('GetServerClasses', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GetServerClasses_URL = function() {
    return this.executor.getMethodURL("GetServerClasses", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TJSONArray
   */
  this.ListClasses = function() {
    var returnObject = this.executor.executeMethod('ListClasses', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.ListClasses_URL = function() {
    return this.executor.getMethodURL("ListClasses", "GET", [], arguments[0])[0];
  };

  /*
   * @param ClassName [in] - Type on server: string
   * @return result - Type on server: TJSONObject
   */
  this.DescribeClass = function(ClassName) {
    var returnObject = this.executor.executeMethod('DescribeClass', "GET", [ClassName], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ClassName = ClassName;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.DescribeClass_URL = function(ClassName) {
    return this.executor.getMethodURL("DescribeClass", "GET", [ClassName], arguments[1])[0];
  };

  /*
   * @param ClassName [in] - Type on server: string
   * @return result - Type on server: TJSONArray
   */
  this.ListMethods = function(ClassName) {
    var returnObject = this.executor.executeMethod('ListMethods', "GET", [ClassName], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ClassName = ClassName;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.ListMethods_URL = function(ClassName) {
    return this.executor.getMethodURL("ListMethods", "GET", [ClassName], arguments[1])[0];
  };

  /*
   * @param ServerMethodName [in] - Type on server: string
   * @return result - Type on server: TJSONObject
   */
  this.DescribeMethod = function(ServerMethodName) {
    var returnObject = this.executor.executeMethod('DescribeMethod', "GET", [ServerMethodName], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ServerMethodName = ServerMethodName;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.DescribeMethod_URL = function(ServerMethodName) {
    return this.executor.getMethodURL("DescribeMethod", "GET", [ServerMethodName], arguments[1])[0];
  };

  /*
   * @return result - Type on server: TDBXReader
   */
  this.GetServerMethods = function() {
    var returnObject = this.executor.executeMethod('GetServerMethods', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GetServerMethods_URL = function() {
    return this.executor.getMethodURL("GetServerMethods", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDBXReader
   */
  this.GetServerMethodParameters = function() {
    var returnObject = this.executor.executeMethod('GetServerMethodParameters', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GetServerMethodParameters_URL = function() {
    return this.executor.getMethodURL("GetServerMethodParameters", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDBXReader
   */
  this.GetDatabaseConnectionProperties = function() {
    var returnObject = this.executor.executeMethod('GetDatabaseConnectionProperties', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GetDatabaseConnectionProperties_URL = function() {
    return this.executor.getMethodURL("GetDatabaseConnectionProperties", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: string
   */
  this.GetDSServerName = function() {
    var returnObject = this.executor.executeMethod('GetDSServerName', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GetDSServerName_URL = function() {
    return this.executor.getMethodURL("GetDSServerName", "GET", [], arguments[0])[0];
  };

  /*
   * @param ChannelName [in] - Type on server: string
   * @param ClientManagerId [in] - Type on server: string
   * @param CallbackId [in] - Type on server: string
   * @param ChannelNames [in] - Type on server: string
   * @param SecurityToken [in] - Type on server: string
   * @param ResponseData [in] - Type on server: TJSONValue
   * @return result - Type on server: TJSONValue
   */
  this.ConsumeClientChannel = function(ChannelName, ClientManagerId, CallbackId, ChannelNames, SecurityToken, ResponseData) {
    var returnObject = this.executor.executeMethod('"ConsumeClientChannel"', "POST", [ChannelName, ClientManagerId, CallbackId, ChannelNames, SecurityToken, ResponseData], arguments[6], true, arguments[7], arguments[8]);
    if (arguments[6] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ChannelName = ChannelName;
        resultObject.ClientManagerId = ClientManagerId;
        resultObject.CallbackId = CallbackId;
        resultObject.ChannelNames = ChannelNames;
        resultObject.SecurityToken = SecurityToken;
        resultObject.ResponseData = ResponseData;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param ChannelName [in] - Type on server: string
   * @param ClientManagerId [in] - Type on server: string
   * @param CallbackId [in] - Type on server: string
   * @param ChannelNames [in] - Type on server: string
   * @param SecurityToken [in] - Type on server: string
   * @param Timeout [in] - Type on server: Integer
   * @param ResponseData [in] - Type on server: TJSONValue
   * @return result - Type on server: TJSONValue
   */
  this.ConsumeClientChannelTimeout = function(ChannelName, ClientManagerId, CallbackId, ChannelNames, SecurityToken, Timeout, ResponseData) {
    var returnObject = this.executor.executeMethod('"ConsumeClientChannelTimeout"', "POST", [ChannelName, ClientManagerId, CallbackId, ChannelNames, SecurityToken, Timeout, ResponseData], arguments[7], true, arguments[8], arguments[9]);
    if (arguments[7] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ChannelName = ChannelName;
        resultObject.ClientManagerId = ClientManagerId;
        resultObject.CallbackId = CallbackId;
        resultObject.ChannelNames = ChannelNames;
        resultObject.SecurityToken = SecurityToken;
        resultObject.Timeout = Timeout;
        resultObject.ResponseData = ResponseData;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param ChannelId [in] - Type on server: string
   * @param SecurityToken [in] - Type on server: string
   * @return result - Type on server: Boolean
   */
  this.CloseClientChannel = function(ChannelId, SecurityToken) {
    var returnObject = this.executor.executeMethod('CloseClientChannel', "GET", [ChannelId, SecurityToken], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ChannelId = ChannelId;
        resultObject.SecurityToken = SecurityToken;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.CloseClientChannel_URL = function(ChannelId, SecurityToken) {
    return this.executor.getMethodURL("CloseClientChannel", "GET", [ChannelId, SecurityToken], arguments[2])[0];
  };

  /*
   * @param ChannelId [in] - Type on server: string
   * @param CallbackId [in] - Type on server: string
   * @param ChannelNames [in] - Type on server: string
   * @param SecurityToken [in] - Type on server: string
   * @return result - Type on server: Boolean
   */
  this.RegisterClientCallbackServer = function(ChannelId, CallbackId, ChannelNames, SecurityToken) {
    var returnObject = this.executor.executeMethod('RegisterClientCallbackServer', "GET", [ChannelId, CallbackId, ChannelNames, SecurityToken], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ChannelId = ChannelId;
        resultObject.CallbackId = CallbackId;
        resultObject.ChannelNames = ChannelNames;
        resultObject.SecurityToken = SecurityToken;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RegisterClientCallbackServer_URL = function(ChannelId, CallbackId, ChannelNames, SecurityToken) {
    return this.executor.getMethodURL("RegisterClientCallbackServer", "GET", [ChannelId, CallbackId, ChannelNames, SecurityToken], arguments[4])[0];
  };

  /*
   * @param ChannelId [in] - Type on server: string
   * @param CallbackId [in] - Type on server: string
   * @param SecurityToken [in] - Type on server: string
   * @return result - Type on server: Boolean
   */
  this.UnregisterClientCallback = function(ChannelId, CallbackId, SecurityToken) {
    var returnObject = this.executor.executeMethod('UnregisterClientCallback', "GET", [ChannelId, CallbackId, SecurityToken], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ChannelId = ChannelId;
        resultObject.CallbackId = CallbackId;
        resultObject.SecurityToken = SecurityToken;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.UnregisterClientCallback_URL = function(ChannelId, CallbackId, SecurityToken) {
    return this.executor.getMethodURL("UnregisterClientCallback", "GET", [ChannelId, CallbackId, SecurityToken], arguments[3])[0];
  };

  /*
   * @param ChannelName [in] - Type on server: string
   * @param Msg [in] - Type on server: TJSONValue
   * @return result - Type on server: Boolean
   */
  this.BroadcastToChannel = function(ChannelName, Msg) {
    var returnObject = this.executor.executeMethod('"BroadcastToChannel"', "POST", [ChannelName, Msg], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ChannelName = ChannelName;
        resultObject.Msg = Msg;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param ChannelName [in] - Type on server: string
   * @param Msg [in] - Type on server: TObject
   * @return result - Type on server: Boolean
   */
  this.BroadcastObjectToChannel = function(ChannelName, Msg) {
    var returnObject = this.executor.executeMethod('"BroadcastObjectToChannel"', "POST", [ChannelName, Msg], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ChannelName = ChannelName;
        resultObject.Msg = Msg;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param ClientId [in] - Type on server: string
   * @param CallbackId [in] - Type on server: string
   * @param Msg [in] - Type on server: TJSONValue
   * @param Response [out] - Type on server: TJSONValue
   * @return result - Type on server: Boolean
   */
  this.NotifyCallback = function(ClientId, CallbackId, Msg) {
    var returnObject = this.executor.executeMethod('"NotifyCallback"', "POST", [ClientId, CallbackId, Msg], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ClientId = ClientId;
        resultObject.CallbackId = CallbackId;
        resultObject.Msg = Msg;
        resultObject.Response = resultArray[0];
        resultObject.result = resultArray[1];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param ClientId [in] - Type on server: string
   * @param CallbackId [in] - Type on server: string
   * @param Msg [in] - Type on server: TObject
   * @param Response [out] - Type on server: TObject
   * @return result - Type on server: Boolean
   */
  this.NotifyObject = function(ClientId, CallbackId, Msg) {
    var returnObject = this.executor.executeMethod('"NotifyObject"', "POST", [ClientId, CallbackId, Msg], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ClientId = ClientId;
        resultObject.CallbackId = CallbackId;
        resultObject.Msg = Msg;
        resultObject.Response = resultArray[0];
        resultObject.result = resultArray[1];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };
}

function TServerMethods(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TServerMethods",connectionInfo);

  /*
   * @param Value [in] - Type on server: string
   * @return result - Type on server: string
   */
  this.EchoString = function(Value) {
    var returnObject = this.executor.executeMethod('EchoString', "GET", [Value], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.Value = Value;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.EchoString_URL = function(Value) {
    return this.executor.getMethodURL("EchoString", "GET", [Value], arguments[1])[0];
  };

  /*
   * @param Value [in] - Type on server: string
   * @return result - Type on server: string
   */
  this.ReverseString = function(Value) {
    var returnObject = this.executor.executeMethod('ReverseString', "GET", [Value], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.Value = Value;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.ReverseString_URL = function(Value) {
    return this.executor.getMethodURL("ReverseString", "GET", [Value], arguments[1])[0];
  };
}

function TTestMethod(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TTestMethod",connectionInfo);

  /*
   * @param aTanggal [in] - Type on server: TDateTime
   * @return result - Type on server: string
   */
  this.Hallo = function(aTanggal) {
    var returnObject = this.executor.executeMethod('Hallo', "GET", [aTanggal], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aTanggal = aTanggal;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Hallo_URL = function(aTanggal) {
    return this.executor.getMethodURL("Hallo", "GET", [aTanggal], arguments[1])[0];
  };
}

function TCrud(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TCrud",connectionInfo);

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.SaveToDB = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDB"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.DeleteFromDB = function(AObject) {
    var returnObject = this.executor.executeMethod('"DeleteFromDB"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param S [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.OpenQuery = function(S) {
    var returnObject = this.executor.executeMethod('OpenQuery', "GET", [S], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.S = S;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.OpenQuery_URL = function(S) {
    return this.executor.getMethodURL("OpenQuery", "GET", [S], arguments[1])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.Retrieve = function(ModClassName, AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [ModClassName, AID], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(ModClassName, AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [ModClassName, AID], arguments[2])[0];
  };

  /*
   * @param aTableName [in] - Type on server: string
   * @param aFieldName [in] - Type on server: string
   * @param aCountDigit [in] - Type on server: Integer
   * @return result - Type on server: string
   */
  this.GenerateCustomNo = function(aTableName, aFieldName, aCountDigit) {
    var returnObject = this.executor.executeMethod('GenerateCustomNo', "GET", [aTableName, aFieldName, aCountDigit], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aTableName = aTableName;
        resultObject.aFieldName = aFieldName;
        resultObject.aCountDigit = aCountDigit;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateCustomNo_URL = function(aTableName, aFieldName, aCountDigit) {
    return this.executor.getMethodURL("GenerateCustomNo", "GET", [aTableName, aFieldName, aCountDigit], arguments[3])[0];
  };

  /*
   * @param aClassName [in] - Type on server: string
   * @return result - Type on server: string
   */
  this.GenerateNo = function(aClassName) {
    var returnObject = this.executor.executeMethod('GenerateNo', "GET", [aClassName], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aClassName = aClassName;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateNo_URL = function(aClassName) {
    return this.executor.getMethodURL("GenerateNo", "GET", [aClassName], arguments[1])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.RetrieveSingle = function(ModClassName, AID) {
    var returnObject = this.executor.executeMethod('RetrieveSingle', "GET", [ModClassName, AID], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveSingle_URL = function(ModClassName, AID) {
    return this.executor.getMethodURL("RetrieveSingle", "GET", [ModClassName, AID], arguments[2])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param aCode [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.RetrieveByCode = function(ModClassName, aCode) {
    var returnObject = this.executor.executeMethod('RetrieveByCode', "GET", [ModClassName, aCode], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.aCode = aCode;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveByCode_URL = function(ModClassName, aCode) {
    return this.executor.getMethodURL("RetrieveByCode", "GET", [ModClassName, aCode], arguments[2])[0];
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.SaveToDBLog = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDBLog"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: string
   */
  this.SaveToDBID = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDBID"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: TStrings
   */
  this.TestGenerateSQL = function(AObject) {
    var returnObject = this.executor.executeMethod('"TestGenerateSQL"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param aDS [in] - Type on server: TDataSet
   * @param ModClassName [in] - Type on server: string
   * @return result - Type on server: TStrings
   */
  this.UpdateToDB = function(aDS, ModClassName) {
    var returnObject = this.executor.executeMethod('ToDB', "POST", [aDS, ModClassName], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aDS = aDS;
        resultObject.ModClassName = ModClassName;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.AfterExecuteMethod = function() {
    this.executor.executeMethod('AfterExecuteMethod', "GET", [], arguments[0], false, arguments[1], arguments[2]);
  };

  this.AfterExecuteMethod_URL = function() {
    return this.executor.getMethodURL("AfterExecuteMethod", "GET", [], arguments[0])[0];
  };
}

function TDSProvider(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TDSProvider",connectionInfo);

  /*
   * @return result - Type on server: TDataSet
   */
  this.Bank_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('Bank_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Bank_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("Bank_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @param RLevel [in] - Type on server: Integer
   * @return result - Type on server: TDataSet
   */
  this.Rekening_GetDSLookup = function(RLevel) {
    var returnObject = this.executor.executeMethod('Rekening_GetDSLookup', "GET", [RLevel], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.RLevel = RLevel;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Rekening_GetDSLookup_URL = function(RLevel) {
    return this.executor.getMethodURL("Rekening_GetDSLookup", "GET", [RLevel], arguments[1])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.RefPajak_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('RefPajak_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RefPajak_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("RefPajak_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.RefTipeBarang_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('RefTipeBarang_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RefTipeBarang_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("RefTipeBarang_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.GroupRekening_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('GroupRekening_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GroupRekening_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("GroupRekening_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Rekening_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('Rekening_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Rekening_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("Rekening_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Member_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('Member_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Member_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("Member_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.MemberActivasi_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('MemberActivasi_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.MemberActivasi_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("MemberActivasi_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.RefDiscMember_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('RefDiscMember_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RefDiscMember_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("RefDiscMember_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.MemberKeluarga_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('MemberKeluarga_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.MemberKeluarga_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("MemberKeluarga_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.RefGrupMember_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('RefGrupMember_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RefGrupMember_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("RefGrupMember_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Satuan_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('Satuan_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Satuan_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("Satuan_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.CostCenter_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('CostCenter_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.CostCenter_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("CostCenter_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Company_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('Company_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Company_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("Company_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.CostCenter_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('CostCenter_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.CostCenter_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("CostCenter_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Company_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('Company_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Company_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("Company_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.TipePembayaran_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('TipePembayaran_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.TipePembayaran_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("TipePembayaran_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.TipePerusahaan_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('TipePerusahaan_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.TipePerusahaan_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("TipePerusahaan_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Outlet_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('Outlet_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Outlet_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("Outlet_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Lokasi_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('Lokasi_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Lokasi_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("Lokasi_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Merchandise_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('Merchandise_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Merchandise_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("Merchandise_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.MerchandiseGroup_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('MerchandiseGroup_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.MerchandiseGroup_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("MerchandiseGroup_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.SubGroup_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('SubGroup_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.SubGroup_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("SubGroup_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Satuan_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('Satuan_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Satuan_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("Satuan_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Kategori_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('Kategori_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Kategori_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("Kategori_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Merk_GetDSLookUp = function() {
    var returnObject = this.executor.executeMethod('Merk_GetDSLookUp', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Merk_GetDSLookUp_URL = function() {
    return this.executor.getMethodURL("Merk_GetDSLookUp", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.RefPajak_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('RefPajak_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RefPajak_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("RefPajak_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.RefTipeBarang_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('RefTipeBarang_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RefTipeBarang_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("RefTipeBarang_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.TipeSuplier_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('TipeSuplier_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.TipeSuplier_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("TipeSuplier_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Unit_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('Unit_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Unit_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("Unit_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Unit_GetDSLookUp = function() {
    var returnObject = this.executor.executeMethod('Unit_GetDSLookUp', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Unit_GetDSLookUp_URL = function() {
    return this.executor.getMethodURL("Unit_GetDSLookUp", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.UnitType_GetDSLookUp = function() {
    var returnObject = this.executor.executeMethod('UnitType_GetDSLookUp', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.UnitType_GetDSLookUp_URL = function() {
    return this.executor.getMethodURL("UnitType_GetDSLookUp", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.UnitType_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('UnitType_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.UnitType_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("UnitType_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.App_GetDSLookUp = function() {
    var returnObject = this.executor.executeMethod('App_GetDSLookUp', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.App_GetDSLookUp_URL = function() {
    return this.executor.getMethodURL("App_GetDSLookUp", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.App_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('App_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.App_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("App_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Bank_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('Bank_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Bank_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("Bank_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @param aMerchanGroupID [in] - Type on server: string
   * @param AProductCode [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.Barang_GetDSOverview = function(aMerchanGroupID, AProductCode) {
    var returnObject = this.executor.executeMethod('Barang_GetDSOverview', "GET", [aMerchanGroupID, AProductCode], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aMerchanGroupID = aMerchanGroupID;
        resultObject.AProductCode = AProductCode;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Barang_GetDSOverview_URL = function(aMerchanGroupID, AProductCode) {
    return this.executor.getMethodURL("Barang_GetDSOverview", "GET", [aMerchanGroupID, AProductCode], arguments[2])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Gudang_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('Gudang_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Gudang_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("Gudang_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.RefTipeMember_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('RefTipeMember_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RefTipeMember_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("RefTipeMember_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.AutAPP_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('AutAPP_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.AutAPP_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("AutAPP_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.TipeKirimPO_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('TipeKirimPO_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.TipeKirimPO_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("TipeKirimPO_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.SuplierGroup_GetDSOverview1 = function() {
    var returnObject = this.executor.executeMethod('SuplierGroup_GetDSOverview1', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.SuplierGroup_GetDSOverview1_URL = function() {
    return this.executor.getMethodURL("SuplierGroup_GetDSOverview1", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.SuplierGroup_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('SuplierGroup_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.SuplierGroup_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("SuplierGroup_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Suplier_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('Suplier_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Suplier_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("Suplier_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.TipePerusahaan_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('TipePerusahaan_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.TipePerusahaan_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("TipePerusahaan_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.TipeSuplier_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('TipeSuplier_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.TipeSuplier_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("TipeSuplier_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Propinsi_GetDSLookUp = function() {
    var returnObject = this.executor.executeMethod('Propinsi_GetDSLookUp', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Propinsi_GetDSLookUp_URL = function() {
    return this.executor.getMethodURL("Propinsi_GetDSLookUp", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Kabupaten_GetDSLookUp = function() {
    var returnObject = this.executor.executeMethod('Kabupaten_GetDSLookUp', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Kabupaten_GetDSLookUp_URL = function() {
    return this.executor.getMethodURL("Kabupaten_GetDSLookUp", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.MataUang_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('MataUang_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.MataUang_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("MataUang_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Agama_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('Agama_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Agama_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("Agama_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.TipeBonus_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('TipeBonus_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.TipeBonus_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("TipeBonus_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Document_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('Document_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Document_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("Document_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Agama_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('Agama_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Agama_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("Agama_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.AutUnit_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('AutUnit_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.AutUnit_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("AutUnit_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @param aMerchandise [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.BarangSupp_GetDSLookup = function(aMerchandise) {
    var returnObject = this.executor.executeMethod('BarangSupp_GetDSLookup', "GET", [aMerchandise], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aMerchandise = aMerchandise;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.BarangSupp_GetDSLookup_URL = function(aMerchandise) {
    return this.executor.getMethodURL("BarangSupp_GetDSLookup", "GET", [aMerchandise], arguments[1])[0];
  };

  /*
   * @param aSuplierMerchanID [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.BarangQuotation_GetDSLookup = function(aSuplierMerchanID) {
    var returnObject = this.executor.executeMethod('BarangQuotation_GetDSLookup', "GET", [aSuplierMerchanID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aSuplierMerchanID = aSuplierMerchanID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.BarangQuotation_GetDSLookup_URL = function(aSuplierMerchanID) {
    return this.executor.getMethodURL("BarangQuotation_GetDSLookup", "GET", [aSuplierMerchanID], arguments[1])[0];
  };

  /*
   * @param aMerchandise [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
   */
  this.BarangSupp_GetDSLookup2 = function(aMerchandise) {
    var returnObject = this.executor.executeMethod('BarangSupp_GetDSLookup2', "GET", [aMerchandise], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aMerchandise = aMerchandise;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.BarangSupp_GetDSLookup2_URL = function(aMerchandise) {
    return this.executor.getMethodURL("BarangSupp_GetDSLookup2", "GET", [aMerchandise], arguments[1])[0];
  };

  /*
   * @param APONO [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.Barang_ByPOLookUp = function(APONO) {
    var returnObject = this.executor.executeMethod('Barang_ByPOLookUp', "GET", [APONO], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.APONO = APONO;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Barang_ByPOLookUp_URL = function(APONO) {
    return this.executor.getMethodURL("Barang_ByPOLookUp", "GET", [APONO], arguments[1])[0];
  };

  /*
   * @param aMerchanGroupID [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.Barang_GetDSLookup = function(aMerchanGroupID) {
    var returnObject = this.executor.executeMethod('Barang_GetDSLookup', "GET", [aMerchanGroupID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aMerchanGroupID = aMerchanGroupID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Barang_GetDSLookup_URL = function(aMerchanGroupID) {
    return this.executor.getMethodURL("Barang_GetDSLookup", "GET", [aMerchanGroupID], arguments[1])[0];
  };

  /*
   * @param aStartDate [in] - Type on server: TDateTime
   * @param aEndDate [in] - Type on server: TDateTime
   * @return result - Type on server: TDataSet
   */
  this.Quotation_GetDSOverview = function(aStartDate, aEndDate) {
    var returnObject = this.executor.executeMethod('Quotation_GetDSOverview', "GET", [aStartDate, aEndDate], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aStartDate = aStartDate;
        resultObject.aEndDate = aEndDate;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Quotation_GetDSOverview_URL = function(aStartDate, aEndDate) {
    return this.executor.getMethodURL("Quotation_GetDSOverview", "GET", [aStartDate, aEndDate], arguments[2])[0];
  };

  /*
   * @param ATPMEMBER [in] - Type on server: string
   * @return result - Type on server: string
   */
  this.GET_MEMBER_PAS_NO = function(ATPMEMBER) {
    var returnObject = this.executor.executeMethod('GET_MEMBER_PAS_NO', "GET", [ATPMEMBER], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATPMEMBER = ATPMEMBER;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GET_MEMBER_PAS_NO_URL = function(ATPMEMBER) {
    return this.executor.getMethodURL("GET_MEMBER_PAS_NO", "GET", [ATPMEMBER], arguments[1])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Merchandise_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('Merchandise_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Merchandise_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("Merchandise_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @param ID [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.SupMGByOutstandingSO_GetDSLookup = function(ID) {
    var returnObject = this.executor.executeMethod('SupMGByOutstandingSO_GetDSLookup', "GET", [ID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ID = ID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.SupMGByOutstandingSO_GetDSLookup_URL = function(ID) {
    return this.executor.getMethodURL("SupMGByOutstandingSO_GetDSLookup", "GET", [ID], arguments[1])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.StatusPO_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('StatusPO_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.StatusPO_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("StatusPO_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.TipeHarga_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('TipeHarga_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.TipeHarga_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("TipeHarga_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.RefWilayah_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('RefWilayah_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RefWilayah_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("RefWilayah_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Suplier_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('Suplier_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Suplier_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("Suplier_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.RefTipeMember_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('RefTipeMember_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RefTipeMember_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("RefTipeMember_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.TipePO_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('TipePO_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.TipePO_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("TipePO_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.TipeCN_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('TipeCN_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.TipeCN_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("TipeCN_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @param ATglAwal [in] - Type on server: TDateTime
   * @param ATglAkhir [in] - Type on server: TDateTime
   * @param AUnit [in] - Type on server: TModUnit
   * @return result - Type on server: TDataSet
   */
  this.SO_GetDSOverview = function(ATglAwal, ATglAkhir, AUnit) {
    var returnObject = this.executor.executeMethod('"SO_GetDSOverview"', "POST", [ATglAwal, ATglAkhir, AUnit], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.ATglAkhir = ATglAkhir;
        resultObject.AUnit = AUnit;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AUnit [in] - Type on server: TModUnit
   * @return result - Type on server: TDataSet
   */
  this.SO_GetDSOLookUp = function(AUnit) {
    var returnObject = this.executor.executeMethod('"SO_GetDSOLookUp"', "POST", [AUnit], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AUnit = AUnit;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.SubGroup_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('SubGroup_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.SubGroup_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("SubGroup_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.SuplierMerchan_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('SuplierMerchan_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.SuplierMerchan_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("SuplierMerchan_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.DO_GetDSLookUp = function() {
    var returnObject = this.executor.executeMethod('DO_GetDSLookUp', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.DO_GetDSLookUp_URL = function() {
    return this.executor.getMethodURL("DO_GetDSLookUp", "GET", [], arguments[0])[0];
  };

  /*
   * @param ATglAwal [in] - Type on server: TDateTime
   * @param ATglAkhir [in] - Type on server: TDateTime
   * @param AUnitID [in] - Type on server: string
   * @param ASupMGCodeID [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.DO_GetDSOverview = function(ATglAwal, ATglAkhir, AUnitID, ASupMGCodeID) {
    var returnObject = this.executor.executeMethod('DO_GetDSOverview', "GET", [ATglAwal, ATglAkhir, AUnitID, ASupMGCodeID], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.ATglAkhir = ATglAkhir;
        resultObject.AUnitID = AUnitID;
        resultObject.ASupMGCodeID = ASupMGCodeID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.DO_GetDSOverview_URL = function(ATglAwal, ATglAkhir, AUnitID, ASupMGCodeID) {
    return this.executor.getMethodURL("DO_GetDSOverview", "GET", [ATglAwal, ATglAkhir, AUnitID, ASupMGCodeID], arguments[4])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Gudang_GetDSLookUp = function() {
    var returnObject = this.executor.executeMethod('Gudang_GetDSLookUp', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Gudang_GetDSLookUp_URL = function() {
    return this.executor.getMethodURL("Gudang_GetDSLookUp", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Kompetitor_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('Kompetitor_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Kompetitor_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("Kompetitor_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @param AUnit [in] - Type on server: TModUnit
   * @return result - Type on server: TDataSet
   */
  this.SO_GetDSOLookUpGeneratePO = function(AUnit) {
    var returnObject = this.executor.executeMethod('"SO_GetDSOLookUpGeneratePO"', "POST", [AUnit], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AUnit = AUnit;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AUnitID [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.PO_GetDSOLookUp = function(AUnitID) {
    var returnObject = this.executor.executeMethod('PO_GetDSOLookUp', "GET", [AUnitID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AUnitID = AUnitID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.PO_GetDSOLookUp_URL = function(AUnitID) {
    return this.executor.getMethodURL("PO_GetDSOLookUp", "GET", [AUnitID], arguments[1])[0];
  };

  /*
   * @param ID [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.PORevisi_GetDSOverview = function(ID) {
    var returnObject = this.executor.executeMethod('PORevisi_GetDSOverview', "GET", [ID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ID = ID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.PORevisi_GetDSOverview_URL = function(ID) {
    return this.executor.getMethodURL("PORevisi_GetDSOverview", "GET", [ID], arguments[1])[0];
  };

  /*
   * @param ANOPO [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.PO_DSLookUpDetail = function(ANOPO) {
    var returnObject = this.executor.executeMethod('PO_DSLookUpDetail', "GET", [ANOPO], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ANOPO = ANOPO;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.PO_DSLookUpDetail_URL = function(ANOPO) {
    return this.executor.getMethodURL("PO_DSLookUpDetail", "GET", [ANOPO], arguments[1])[0];
  };

  /*
   * @param APeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @return result - Type on server: TDataSet
   */
  this.PO_GetDSByPeriod = function(APeriodeAwal, APeriodeAkhir) {
    var returnObject = this.executor.executeMethod('PO_GetDSByPeriod', "GET", [APeriodeAwal, APeriodeAkhir], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.APeriodeAwal = APeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.PO_GetDSByPeriod_URL = function(APeriodeAwal, APeriodeAkhir) {
    return this.executor.getMethodURL("PO_GetDSByPeriod", "GET", [APeriodeAwal, APeriodeAkhir], arguments[2])[0];
  };

  /*
   * @param AUnitID [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.PO_GetDSOLookUpForGR = function(AUnitID) {
    var returnObject = this.executor.executeMethod('PO_GetDSOLookUpForGR', "GET", [AUnitID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AUnitID = AUnitID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.PO_GetDSOLookUpForGR_URL = function(AUnitID) {
    return this.executor.getMethodURL("PO_GetDSOLookUpForGR", "GET", [AUnitID], arguments[1])[0];
  };

  /*
   * @param APONO [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.PO_SKULookUP = function(APONO) {
    var returnObject = this.executor.executeMethod('PO_SKULookUP', "GET", [APONO], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.APONO = APONO;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.PO_SKULookUP_URL = function(APONO) {
    return this.executor.getMethodURL("PO_SKULookUP", "GET", [APONO], arguments[1])[0];
  };

  /*
   * @param ATglAwal [in] - Type on server: TDateTime
   * @param ATglAkhir [in] - Type on server: TDateTime
   * @param AUnit [in] - Type on server: TModUnit
   * @return result - Type on server: TDataSet
   */
  this.PO_SLIP_GetDSOverview = function(ATglAwal, ATglAkhir, AUnit) {
    var returnObject = this.executor.executeMethod('"PO_SLIP_GetDSOverview"', "POST", [ATglAwal, ATglAkhir, AUnit], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.ATglAkhir = ATglAkhir;
        resultObject.AUnit = AUnit;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param ATglAwal [in] - Type on server: TDateTime
   * @param ATglAkhir [in] - Type on server: TDateTime
   * @param AUnit [in] - Type on server: TModUnit
   * @return result - Type on server: TDataSet
   */
  this.PO_GetDSOverviewDetil = function(ATglAwal, ATglAkhir, AUnit) {
    var returnObject = this.executor.executeMethod('"PO_GetDSOverviewDetil"', "POST", [ATglAwal, ATglAkhir, AUnit], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.ATglAkhir = ATglAkhir;
        resultObject.AUnit = AUnit;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param ATglAwal [in] - Type on server: TDateTime
   * @param ATglAkhir [in] - Type on server: TDateTime
   * @param AkodeSupplierMGAwal [in] - Type on server: string
   * @param AKodeSupplierMGAkhir [in] - Type on server: string
   * @param AStatusPOID [in] - Type on server: string
   * @param AUnit [in] - Type on server: TModUnit
   * @return result - Type on server: TDataSet
   */
  this.PO_GetDSOverview = function(ATglAwal, ATglAkhir, AkodeSupplierMGAwal, AKodeSupplierMGAkhir, AStatusPOID, AUnit) {
    var returnObject = this.executor.executeMethod('"PO_GetDSOverview"', "POST", [ATglAwal, ATglAkhir, AkodeSupplierMGAwal, AKodeSupplierMGAkhir, AStatusPOID, AUnit], arguments[6], true, arguments[7], arguments[8]);
    if (arguments[6] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.ATglAkhir = ATglAkhir;
        resultObject.AkodeSupplierMGAwal = AkodeSupplierMGAwal;
        resultObject.AKodeSupplierMGAkhir = AKodeSupplierMGAkhir;
        resultObject.AStatusPOID = AStatusPOID;
        resultObject.AUnit = AUnit;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.RefCreditCard_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('RefCreditCard_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RefCreditCard_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("RefCreditCard_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @param ATglAwal [in] - Type on server: TDateTime
   * @param ATglAkhir [in] - Type on server: TDateTime
   * @param AUnit [in] - Type on server: TModUnit
   * @return result - Type on server: TDataSet
   */
  this.CN_RCV_GetDSOverview = function(ATglAwal, ATglAkhir, AUnit) {
    var returnObject = this.executor.executeMethod('"CN_RCV_GetDSOverview"', "POST", [ATglAwal, ATglAkhir, AUnit], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.ATglAkhir = ATglAkhir;
        resultObject.AUnit = AUnit;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param ATglAwal [in] - Type on server: TDateTime
   * @param ATglAkhir [in] - Type on server: TDateTime
   * @param AUnit [in] - Type on server: TModUnit
   * @return result - Type on server: TDataSet
   */
  this.DN_RCV_GetDSOverview = function(ATglAwal, ATglAkhir, AUnit) {
    var returnObject = this.executor.executeMethod('"DN_RCV_GetDSOverview"', "POST", [ATglAwal, ATglAkhir, AUnit], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ATglAwal = ATglAwal;
        resultObject.ATglAkhir = ATglAkhir;
        resultObject.AUnit = AUnit;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param aStartDate [in] - Type on server: TDateTime
   * @param aEndDate [in] - Type on server: TDateTime
   * @return result - Type on server: TDataSet
   */
  this.AdjFaktur_GetDSOverview = function(aStartDate, aEndDate) {
    var returnObject = this.executor.executeMethod('AdjFaktur_GetDSOverview', "GET", [aStartDate, aEndDate], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aStartDate = aStartDate;
        resultObject.aEndDate = aEndDate;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.AdjFaktur_GetDSOverview_URL = function(aStartDate, aEndDate) {
    return this.executor.getMethodURL("AdjFaktur_GetDSOverview", "GET", [aStartDate, aEndDate], arguments[2])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.AP_GetDSLookUp = function() {
    var returnObject = this.executor.executeMethod('AP_GetDSLookUp', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.AP_GetDSLookUp_URL = function() {
    return this.executor.getMethodURL("AP_GetDSLookUp", "GET", [], arguments[0])[0];
  };

  /*
   * @param AOrgID [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.AP_GetDSLookUpPerOrganization = function(AOrgID) {
    var returnObject = this.executor.executeMethod('AP_GetDSLookUpPerOrganization', "GET", [AOrgID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AOrgID = AOrgID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.AP_GetDSLookUpPerOrganization_URL = function(AOrgID) {
    return this.executor.getMethodURL("AP_GetDSLookUpPerOrganization", "GET", [AOrgID], arguments[1])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Organization_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('Organization_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Organization_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("Organization_GetDSLookup", "GET", [], arguments[0])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.Shift_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('Shift_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Shift_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("Shift_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @param aDOID [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.DODetail_LookupAdjFak = function(aDOID) {
    var returnObject = this.executor.executeMethod('DODetail_LookupAdjFak', "GET", [aDOID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aDOID = aDOID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.DODetail_LookupAdjFak_URL = function(aDOID) {
    return this.executor.getMethodURL("DODetail_LookupAdjFak", "GET", [aDOID], arguments[1])[0];
  };

  /*
   * @param aStartDate [in] - Type on server: TDateTime
   * @param aEndDate [in] - Type on server: TDateTime
   * @param aSuplierMerchanID [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.PO_GetDSOLookUpForAdj = function(aStartDate, aEndDate, aSuplierMerchanID) {
    var returnObject = this.executor.executeMethod('PO_GetDSOLookUpForAdj', "GET", [aStartDate, aEndDate, aSuplierMerchanID], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aStartDate = aStartDate;
        resultObject.aEndDate = aEndDate;
        resultObject.aSuplierMerchanID = aSuplierMerchanID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.PO_GetDSOLookUpForAdj_URL = function(aStartDate, aEndDate, aSuplierMerchanID) {
    return this.executor.getMethodURL("PO_GetDSOLookUpForAdj", "GET", [aStartDate, aEndDate, aSuplierMerchanID], arguments[3])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.AutUser_GetDSOverview = function() {
    var returnObject = this.executor.executeMethod('AutUser_GetDSOverview', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.AutUser_GetDSOverview_URL = function() {
    return this.executor.getMethodURL("AutUser_GetDSOverview", "GET", [], arguments[0])[0];
  };

  /*
   * @param APeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @return result - Type on server: TDataSet
   */
  this.BankCashOut_GetDSByPeriod = function(APeriodeAwal, APeriodeAkhir) {
    var returnObject = this.executor.executeMethod('BankCashOut_GetDSByPeriod', "GET", [APeriodeAwal, APeriodeAkhir], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.APeriodeAwal = APeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.BankCashOut_GetDSByPeriod_URL = function(APeriodeAwal, APeriodeAkhir) {
    return this.executor.getMethodURL("BankCashOut_GetDSByPeriod", "GET", [APeriodeAwal, APeriodeAkhir], arguments[2])[0];
  };

  /*
   * @return result - Type on server: TDataSet
   */
  this.RekeningBCOLain_GetDSLookup = function() {
    var returnObject = this.executor.executeMethod('RekeningBCOLain_GetDSLookup', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RekeningBCOLain_GetDSLookup_URL = function() {
    return this.executor.getMethodURL("RekeningBCOLain_GetDSLookup", "GET", [], arguments[0])[0];
  };
}

function TDSReport(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TDSReport",connectionInfo);

  /*
   * @param APeriodeAwal [in] - Type on server: TDateTime
   * @param APeriodeAkhir [in] - Type on server: TDateTime
   * @param ANoBukti [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
   */
  this.BankCashOut_GetDS_Slip = function(APeriodeAwal, APeriodeAkhir, ANoBukti) {
    var returnObject = this.executor.executeMethod('BankCashOut_GetDS_Slip', "GET", [APeriodeAwal, APeriodeAkhir, ANoBukti], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.APeriodeAwal = APeriodeAwal;
        resultObject.APeriodeAkhir = APeriodeAkhir;
        resultObject.ANoBukti = ANoBukti;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.BankCashOut_GetDS_Slip_URL = function(APeriodeAwal, APeriodeAkhir, ANoBukti) {
    return this.executor.getMethodURL("BankCashOut_GetDS_Slip", "GET", [APeriodeAwal, APeriodeAkhir, ANoBukti], arguments[3])[0];
  };

  /*
   * @param ANONP [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
   */
  this.DO_GetDSNP = function(ANONP) {
    var returnObject = this.executor.executeMethod('DO_GetDSNP', "GET", [ANONP], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ANONP = ANONP;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.DO_GetDSNP_URL = function(ANONP) {
    return this.executor.getMethodURL("DO_GetDSNP", "GET", [ANONP], arguments[1])[0];
  };

  /*
   * @param ANONP [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
   */
  this.DO_GetDS_CheckList = function(ANONP) {
    var returnObject = this.executor.executeMethod('DO_GetDS_CheckList', "GET", [ANONP], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ANONP = ANONP;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.DO_GetDS_CheckList_URL = function(ANONP) {
    return this.executor.getMethodURL("DO_GetDS_CheckList", "GET", [ANONP], arguments[1])[0];
  };

  /*
   * @param aStartDate [in] - Type on server: TDateTime
   * @param aEndDate [in] - Type on server: TDateTime
   * @return result - Type on server: TDataSet
   */
  this.DSA_GetDS = function(aStartDate, aEndDate) {
    var returnObject = this.executor.executeMethod('DSA_GetDS', "GET", [aStartDate, aEndDate], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aStartDate = aStartDate;
        resultObject.aEndDate = aEndDate;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.DSA_GetDS_URL = function(aStartDate, aEndDate) {
    return this.executor.getMethodURL("DSA_GetDS", "GET", [aStartDate, aEndDate], arguments[2])[0];
  };

  /*
   * @param aStartDate [in] - Type on server: TDateTime
   * @param aEndDate [in] - Type on server: TDateTime
   * @return result - Type on server: TFDJSONDataSets
   */
  this.DSR_GetDS = function(aStartDate, aEndDate) {
    var returnObject = this.executor.executeMethod('DSR_GetDS', "GET", [aStartDate, aEndDate], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aStartDate = aStartDate;
        resultObject.aEndDate = aEndDate;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.DSR_GetDS_URL = function(aStartDate, aEndDate) {
    return this.executor.getMethodURL("DSR_GetDS", "GET", [aStartDate, aEndDate], arguments[2])[0];
  };

  /*
   * @param aBarang_ID [in] - Type on server: string
   * @param aStartDate [in] - Type on server: TDateTime
   * @param aEndDate [in] - Type on server: TDateTime
   * @param aGudang_ID [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.KartuStock_GetDS = function(aBarang_ID, aStartDate, aEndDate, aGudang_ID) {
    var returnObject = this.executor.executeMethod('KartuStock_GetDS', "GET", [aBarang_ID, aStartDate, aEndDate, aGudang_ID], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aBarang_ID = aBarang_ID;
        resultObject.aStartDate = aStartDate;
        resultObject.aEndDate = aEndDate;
        resultObject.aGudang_ID = aGudang_ID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.KartuStock_GetDS_URL = function(aBarang_ID, aStartDate, aEndDate, aGudang_ID) {
    return this.executor.getMethodURL("KartuStock_GetDS", "GET", [aBarang_ID, aStartDate, aEndDate, aGudang_ID], arguments[4])[0];
  };

  /*
   * @param aEndDate [in] - Type on server: TDateTime
   * @param aGroup_ID [in] - Type on server: string
   * @param aSupplier_ID [in] - Type on server: string
   * @param aGudang_ID [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.StockProduct_GetDS = function(aEndDate, aGroup_ID, aSupplier_ID, aGudang_ID) {
    var returnObject = this.executor.executeMethod('StockProduct_GetDS', "GET", [aEndDate, aGroup_ID, aSupplier_ID, aGudang_ID], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aEndDate = aEndDate;
        resultObject.aGroup_ID = aGroup_ID;
        resultObject.aSupplier_ID = aSupplier_ID;
        resultObject.aGudang_ID = aGudang_ID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.StockProduct_GetDS_URL = function(aEndDate, aGroup_ID, aSupplier_ID, aGudang_ID) {
    return this.executor.getMethodURL("StockProduct_GetDS", "GET", [aEndDate, aGroup_ID, aSupplier_ID, aGudang_ID], arguments[4])[0];
  };

  /*
   * @param StartDate [in] - Type on server: TDateTime
   * @param EndDate [in] - Type on server: TDateTime
   * @return result - Type on server: TFDJSONDataSets
   */
  this.SO_ByDate = function(StartDate, EndDate) {
    var returnObject = this.executor.executeMethod('SO_ByDate', "GET", [StartDate, EndDate], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.StartDate = StartDate;
        resultObject.EndDate = EndDate;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.SO_ByDate_URL = function(StartDate, EndDate) {
    return this.executor.getMethodURL("SO_ByDate", "GET", [StartDate, EndDate], arguments[2])[0];
  };

  /*
   * @param StartDate [in] - Type on server: TDateTime
   * @param EndDate [in] - Type on server: TDateTime
   * @param aNoBuktiAwal [in] - Type on server: string
   * @param aNoBuktiAkhir [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
   */
  this.SO_ByDateNoBukti = function(StartDate, EndDate, aNoBuktiAwal, aNoBuktiAkhir) {
    var returnObject = this.executor.executeMethod('SO_ByDateNoBukti', "GET", [StartDate, EndDate, aNoBuktiAwal, aNoBuktiAkhir], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.StartDate = StartDate;
        resultObject.EndDate = EndDate;
        resultObject.aNoBuktiAwal = aNoBuktiAwal;
        resultObject.aNoBuktiAkhir = aNoBuktiAkhir;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.SO_ByDateNoBukti_URL = function(StartDate, EndDate, aNoBuktiAwal, aNoBuktiAkhir) {
    return this.executor.getMethodURL("SO_ByDateNoBukti", "GET", [StartDate, EndDate, aNoBuktiAwal, aNoBuktiAkhir], arguments[4])[0];
  };

  /*
   * @param StartDate [in] - Type on server: TDateTime
   * @param EndDate [in] - Type on server: TDateTime
   * @param aNoBuktiAwal [in] - Type on server: string
   * @param aNoBuktiAkhir [in] - Type on server: string
   * @return result - Type on server: TFDJSONDataSets
   */
  this.PO_SLIP_ByDateNoBukti = function(StartDate, EndDate, aNoBuktiAwal, aNoBuktiAkhir) {
    var returnObject = this.executor.executeMethod('PO_SLIP_ByDateNoBukti', "GET", [StartDate, EndDate, aNoBuktiAwal, aNoBuktiAkhir], arguments[4], true, arguments[5], arguments[6]);
    if (arguments[4] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.StartDate = StartDate;
        resultObject.EndDate = EndDate;
        resultObject.aNoBuktiAwal = aNoBuktiAwal;
        resultObject.aNoBuktiAkhir = aNoBuktiAkhir;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.PO_SLIP_ByDateNoBukti_URL = function(StartDate, EndDate, aNoBuktiAwal, aNoBuktiAkhir) {
    return this.executor.getMethodURL("PO_SLIP_ByDateNoBukti", "GET", [StartDate, EndDate, aNoBuktiAwal, aNoBuktiAkhir], arguments[4])[0];
  };

  /*
   * @return result - Type on server: TFDJSONDataSets
   */
  this.SO_Test = function() {
    var returnObject = this.executor.executeMethod('SO_Test', "GET", [], arguments[0], true, arguments[1], arguments[2]);
    if (arguments[0] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.SO_Test_URL = function() {
    return this.executor.getMethodURL("SO_Test", "GET", [], arguments[0])[0];
  };

  /*
   * @param aStartDate [in] - Type on server: TDateTime
   * @param aEndDate [in] - Type on server: TDateTime
   * @param aGroup_ID [in] - Type on server: string
   * @param aSupplier_ID [in] - Type on server: string
   * @param aGudang_ID [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.InvMovement_GetDS = function(aStartDate, aEndDate, aGroup_ID, aSupplier_ID, aGudang_ID) {
    var returnObject = this.executor.executeMethod('InvMovement_GetDS', "GET", [aStartDate, aEndDate, aGroup_ID, aSupplier_ID, aGudang_ID], arguments[5], true, arguments[6], arguments[7]);
    if (arguments[5] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aStartDate = aStartDate;
        resultObject.aEndDate = aEndDate;
        resultObject.aGroup_ID = aGroup_ID;
        resultObject.aSupplier_ID = aSupplier_ID;
        resultObject.aGudang_ID = aGudang_ID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.InvMovement_GetDS_URL = function(aStartDate, aEndDate, aGroup_ID, aSupplier_ID, aGudang_ID) {
    return this.executor.getMethodURL("InvMovement_GetDS", "GET", [aStartDate, aEndDate, aGroup_ID, aSupplier_ID, aGudang_ID], arguments[5])[0];
  };
}

function TSuggestionOrder(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TSuggestionOrder",connectionInfo);

  /*
   * @param aTanggal [in] - Type on server: TDateTime
   * @param aMerchan_ID [in] - Type on server: string
   * @param aSupplierMerchan_ID [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.GenerateSO = function(aTanggal, aMerchan_ID, aSupplierMerchan_ID) {
    var returnObject = this.executor.executeMethod('GenerateSO', "GET", [aTanggal, aMerchan_ID, aSupplierMerchan_ID], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aTanggal = aTanggal;
        resultObject.aMerchan_ID = aMerchan_ID;
        resultObject.aSupplierMerchan_ID = aSupplierMerchan_ID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateSO_URL = function(aTanggal, aMerchan_ID, aSupplierMerchan_ID) {
    return this.executor.getMethodURL("GenerateSO", "GET", [aTanggal, aMerchan_ID, aSupplierMerchan_ID], arguments[3])[0];
  };

  /*
   * @param aID [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.RetrieveDetails = function(aID) {
    var returnObject = this.executor.executeMethod('RetrieveDetails', "GET", [aID], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aID = aID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveDetails_URL = function(aID) {
    return this.executor.getMethodURL("RetrieveDetails", "GET", [aID], arguments[1])[0];
  };

  this.AfterExecuteMethod = function() {
    this.executor.executeMethod('AfterExecuteMethod', "GET", [], arguments[0], false, arguments[1], arguments[2]);
  };

  this.AfterExecuteMethod_URL = function() {
    return this.executor.getMethodURL("AfterExecuteMethod", "GET", [], arguments[0])[0];
  };
}

function TCrudSupplier(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TCrudSupplier",connectionInfo);

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.BeforeSaveToDB = function(AObject) {
    var returnObject = this.executor.executeMethod('"BeforeSaveToDB"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.SaveToDB = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDB"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.DeleteFromDB = function(AObject) {
    var returnObject = this.executor.executeMethod('"DeleteFromDB"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param S [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.OpenQuery = function(S) {
    var returnObject = this.executor.executeMethod('OpenQuery', "GET", [S], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.S = S;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.OpenQuery_URL = function(S) {
    return this.executor.getMethodURL("OpenQuery", "GET", [S], arguments[1])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.Retrieve = function(ModClassName, AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [ModClassName, AID], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(ModClassName, AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [ModClassName, AID], arguments[2])[0];
  };

  /*
   * @param aTableName [in] - Type on server: string
   * @param aFieldName [in] - Type on server: string
   * @param aCountDigit [in] - Type on server: Integer
   * @return result - Type on server: string
   */
  this.GenerateCustomNo = function(aTableName, aFieldName, aCountDigit) {
    var returnObject = this.executor.executeMethod('GenerateCustomNo', "GET", [aTableName, aFieldName, aCountDigit], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aTableName = aTableName;
        resultObject.aFieldName = aFieldName;
        resultObject.aCountDigit = aCountDigit;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateCustomNo_URL = function(aTableName, aFieldName, aCountDigit) {
    return this.executor.getMethodURL("GenerateCustomNo", "GET", [aTableName, aFieldName, aCountDigit], arguments[3])[0];
  };

  /*
   * @param aClassName [in] - Type on server: string
   * @return result - Type on server: string
   */
  this.GenerateNo = function(aClassName) {
    var returnObject = this.executor.executeMethod('GenerateNo', "GET", [aClassName], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aClassName = aClassName;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateNo_URL = function(aClassName) {
    return this.executor.getMethodURL("GenerateNo", "GET", [aClassName], arguments[1])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.RetrieveSingle = function(ModClassName, AID) {
    var returnObject = this.executor.executeMethod('RetrieveSingle', "GET", [ModClassName, AID], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveSingle_URL = function(ModClassName, AID) {
    return this.executor.getMethodURL("RetrieveSingle", "GET", [ModClassName, AID], arguments[2])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param aCode [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.RetrieveByCode = function(ModClassName, aCode) {
    var returnObject = this.executor.executeMethod('RetrieveByCode', "GET", [ModClassName, aCode], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.aCode = aCode;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveByCode_URL = function(ModClassName, aCode) {
    return this.executor.getMethodURL("RetrieveByCode", "GET", [ModClassName, aCode], arguments[2])[0];
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.SaveToDBLog = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDBLog"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: string
   */
  this.SaveToDBID = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDBID"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: TStrings
   */
  this.TestGenerateSQL = function(AObject) {
    var returnObject = this.executor.executeMethod('"TestGenerateSQL"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param aDS [in] - Type on server: TDataSet
   * @param ModClassName [in] - Type on server: string
   * @return result - Type on server: TStrings
   */
  this.UpdateToDB = function(aDS, ModClassName) {
    var returnObject = this.executor.executeMethod('ToDB', "POST", [aDS, ModClassName], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aDS = aDS;
        resultObject.ModClassName = ModClassName;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.AfterExecuteMethod = function() {
    this.executor.executeMethod('AfterExecuteMethod', "GET", [], arguments[0], false, arguments[1], arguments[2]);
  };

  this.AfterExecuteMethod_URL = function() {
    return this.executor.getMethodURL("AfterExecuteMethod", "GET", [], arguments[0])[0];
  };
}

function TCrudPO(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TCrudPO",connectionInfo);

  /*
   * @param ASOID [in] - Type on server: string
   * @param ASupMGID [in] - Type on server: string
   * @return result - Type on server: Boolean
   */
  this.GeneratePO = function(ASOID, ASupMGID) {
    var returnObject = this.executor.executeMethod('GeneratePO', "GET", [ASOID, ASupMGID], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ASOID = ASOID;
        resultObject.ASupMGID = ASupMGID;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GeneratePO_URL = function(ASOID, ASupMGID) {
    return this.executor.getMethodURL("GeneratePO", "GET", [ASOID, ASupMGID], arguments[2])[0];
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.SaveToDB = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDB"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.DeleteFromDB = function(AObject) {
    var returnObject = this.executor.executeMethod('"DeleteFromDB"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param S [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.OpenQuery = function(S) {
    var returnObject = this.executor.executeMethod('OpenQuery', "GET", [S], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.S = S;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.OpenQuery_URL = function(S) {
    return this.executor.getMethodURL("OpenQuery", "GET", [S], arguments[1])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.Retrieve = function(ModClassName, AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [ModClassName, AID], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(ModClassName, AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [ModClassName, AID], arguments[2])[0];
  };

  /*
   * @param aTableName [in] - Type on server: string
   * @param aFieldName [in] - Type on server: string
   * @param aCountDigit [in] - Type on server: Integer
   * @return result - Type on server: string
   */
  this.GenerateCustomNo = function(aTableName, aFieldName, aCountDigit) {
    var returnObject = this.executor.executeMethod('GenerateCustomNo', "GET", [aTableName, aFieldName, aCountDigit], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aTableName = aTableName;
        resultObject.aFieldName = aFieldName;
        resultObject.aCountDigit = aCountDigit;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateCustomNo_URL = function(aTableName, aFieldName, aCountDigit) {
    return this.executor.getMethodURL("GenerateCustomNo", "GET", [aTableName, aFieldName, aCountDigit], arguments[3])[0];
  };

  /*
   * @param aClassName [in] - Type on server: string
   * @return result - Type on server: string
   */
  this.GenerateNo = function(aClassName) {
    var returnObject = this.executor.executeMethod('GenerateNo', "GET", [aClassName], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aClassName = aClassName;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateNo_URL = function(aClassName) {
    return this.executor.getMethodURL("GenerateNo", "GET", [aClassName], arguments[1])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.RetrieveSingle = function(ModClassName, AID) {
    var returnObject = this.executor.executeMethod('RetrieveSingle', "GET", [ModClassName, AID], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveSingle_URL = function(ModClassName, AID) {
    return this.executor.getMethodURL("RetrieveSingle", "GET", [ModClassName, AID], arguments[2])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param aCode [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.RetrieveByCode = function(ModClassName, aCode) {
    var returnObject = this.executor.executeMethod('RetrieveByCode', "GET", [ModClassName, aCode], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.aCode = aCode;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveByCode_URL = function(ModClassName, aCode) {
    return this.executor.getMethodURL("RetrieveByCode", "GET", [ModClassName, aCode], arguments[2])[0];
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.SaveToDBLog = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDBLog"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: string
   */
  this.SaveToDBID = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDBID"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: TStrings
   */
  this.TestGenerateSQL = function(AObject) {
    var returnObject = this.executor.executeMethod('"TestGenerateSQL"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param aDS [in] - Type on server: TDataSet
   * @param ModClassName [in] - Type on server: string
   * @return result - Type on server: TStrings
   */
  this.UpdateToDB = function(aDS, ModClassName) {
    var returnObject = this.executor.executeMethod('ToDB', "POST", [aDS, ModClassName], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aDS = aDS;
        resultObject.ModClassName = ModClassName;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.AfterExecuteMethod = function() {
    this.executor.executeMethod('AfterExecuteMethod', "GET", [], arguments[0], false, arguments[1], arguments[2]);
  };

  this.AfterExecuteMethod_URL = function() {
    return this.executor.getMethodURL("AfterExecuteMethod", "GET", [], arguments[0])[0];
  };
}

function TCrudDO(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TCrudDO",connectionInfo);

  /*
   * @param APONO [in] - Type on server: string
   * @return result - Type on server: TModDO
   */
  this.RetrieveByPO = function(APONO) {
    var returnObject = this.executor.executeMethod('RetrieveByPO', "GET", [APONO], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.APONO = APONO;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveByPO_URL = function(APONO) {
    return this.executor.getMethodURL("RetrieveByPO", "GET", [APONO], arguments[1])[0];
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.SaveToDB = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDB"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.DeleteFromDB = function(AObject) {
    var returnObject = this.executor.executeMethod('"DeleteFromDB"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param S [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.OpenQuery = function(S) {
    var returnObject = this.executor.executeMethod('OpenQuery', "GET", [S], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.S = S;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.OpenQuery_URL = function(S) {
    return this.executor.getMethodURL("OpenQuery", "GET", [S], arguments[1])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.Retrieve = function(ModClassName, AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [ModClassName, AID], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(ModClassName, AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [ModClassName, AID], arguments[2])[0];
  };

  /*
   * @param aTableName [in] - Type on server: string
   * @param aFieldName [in] - Type on server: string
   * @param aCountDigit [in] - Type on server: Integer
   * @return result - Type on server: string
   */
  this.GenerateCustomNo = function(aTableName, aFieldName, aCountDigit) {
    var returnObject = this.executor.executeMethod('GenerateCustomNo', "GET", [aTableName, aFieldName, aCountDigit], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aTableName = aTableName;
        resultObject.aFieldName = aFieldName;
        resultObject.aCountDigit = aCountDigit;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateCustomNo_URL = function(aTableName, aFieldName, aCountDigit) {
    return this.executor.getMethodURL("GenerateCustomNo", "GET", [aTableName, aFieldName, aCountDigit], arguments[3])[0];
  };

  /*
   * @param aClassName [in] - Type on server: string
   * @return result - Type on server: string
   */
  this.GenerateNo = function(aClassName) {
    var returnObject = this.executor.executeMethod('GenerateNo', "GET", [aClassName], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aClassName = aClassName;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateNo_URL = function(aClassName) {
    return this.executor.getMethodURL("GenerateNo", "GET", [aClassName], arguments[1])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.RetrieveSingle = function(ModClassName, AID) {
    var returnObject = this.executor.executeMethod('RetrieveSingle', "GET", [ModClassName, AID], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveSingle_URL = function(ModClassName, AID) {
    return this.executor.getMethodURL("RetrieveSingle", "GET", [ModClassName, AID], arguments[2])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param aCode [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.RetrieveByCode = function(ModClassName, aCode) {
    var returnObject = this.executor.executeMethod('RetrieveByCode', "GET", [ModClassName, aCode], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.aCode = aCode;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveByCode_URL = function(ModClassName, aCode) {
    return this.executor.getMethodURL("RetrieveByCode", "GET", [ModClassName, aCode], arguments[2])[0];
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.SaveToDBLog = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDBLog"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: string
   */
  this.SaveToDBID = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDBID"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: TStrings
   */
  this.TestGenerateSQL = function(AObject) {
    var returnObject = this.executor.executeMethod('"TestGenerateSQL"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param aDS [in] - Type on server: TDataSet
   * @param ModClassName [in] - Type on server: string
   * @return result - Type on server: TStrings
   */
  this.UpdateToDB = function(aDS, ModClassName) {
    var returnObject = this.executor.executeMethod('ToDB', "POST", [aDS, ModClassName], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aDS = aDS;
        resultObject.ModClassName = ModClassName;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.AfterExecuteMethod = function() {
    this.executor.executeMethod('AfterExecuteMethod', "GET", [], arguments[0], false, arguments[1], arguments[2]);
  };

  this.AfterExecuteMethod_URL = function() {
    return this.executor.getMethodURL("AfterExecuteMethod", "GET", [], arguments[0])[0];
  };
}

function TCrudCNRecv(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TCrudCNRecv",connectionInfo);

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.SaveToDB = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDB"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.DeleteFromDB = function(AObject) {
    var returnObject = this.executor.executeMethod('"DeleteFromDB"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param S [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.OpenQuery = function(S) {
    var returnObject = this.executor.executeMethod('OpenQuery', "GET", [S], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.S = S;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.OpenQuery_URL = function(S) {
    return this.executor.getMethodURL("OpenQuery", "GET", [S], arguments[1])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.Retrieve = function(ModClassName, AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [ModClassName, AID], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(ModClassName, AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [ModClassName, AID], arguments[2])[0];
  };

  /*
   * @param aTableName [in] - Type on server: string
   * @param aFieldName [in] - Type on server: string
   * @param aCountDigit [in] - Type on server: Integer
   * @return result - Type on server: string
   */
  this.GenerateCustomNo = function(aTableName, aFieldName, aCountDigit) {
    var returnObject = this.executor.executeMethod('GenerateCustomNo', "GET", [aTableName, aFieldName, aCountDigit], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aTableName = aTableName;
        resultObject.aFieldName = aFieldName;
        resultObject.aCountDigit = aCountDigit;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateCustomNo_URL = function(aTableName, aFieldName, aCountDigit) {
    return this.executor.getMethodURL("GenerateCustomNo", "GET", [aTableName, aFieldName, aCountDigit], arguments[3])[0];
  };

  /*
   * @param aClassName [in] - Type on server: string
   * @return result - Type on server: string
   */
  this.GenerateNo = function(aClassName) {
    var returnObject = this.executor.executeMethod('GenerateNo', "GET", [aClassName], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aClassName = aClassName;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateNo_URL = function(aClassName) {
    return this.executor.getMethodURL("GenerateNo", "GET", [aClassName], arguments[1])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.RetrieveSingle = function(ModClassName, AID) {
    var returnObject = this.executor.executeMethod('RetrieveSingle', "GET", [ModClassName, AID], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveSingle_URL = function(ModClassName, AID) {
    return this.executor.getMethodURL("RetrieveSingle", "GET", [ModClassName, AID], arguments[2])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param aCode [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.RetrieveByCode = function(ModClassName, aCode) {
    var returnObject = this.executor.executeMethod('RetrieveByCode', "GET", [ModClassName, aCode], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.aCode = aCode;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveByCode_URL = function(ModClassName, aCode) {
    return this.executor.getMethodURL("RetrieveByCode", "GET", [ModClassName, aCode], arguments[2])[0];
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.SaveToDBLog = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDBLog"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: string
   */
  this.SaveToDBID = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDBID"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: TStrings
   */
  this.TestGenerateSQL = function(AObject) {
    var returnObject = this.executor.executeMethod('"TestGenerateSQL"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param aDS [in] - Type on server: TDataSet
   * @param ModClassName [in] - Type on server: string
   * @return result - Type on server: TStrings
   */
  this.UpdateToDB = function(aDS, ModClassName) {
    var returnObject = this.executor.executeMethod('ToDB', "POST", [aDS, ModClassName], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aDS = aDS;
        resultObject.ModClassName = ModClassName;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.AfterExecuteMethod = function() {
    this.executor.executeMethod('AfterExecuteMethod', "GET", [], arguments[0], false, arguments[1], arguments[2]);
  };

  this.AfterExecuteMethod_URL = function() {
    return this.executor.getMethodURL("AfterExecuteMethod", "GET", [], arguments[0])[0];
  };
}

function TCrudDNRecv(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TCrudDNRecv",connectionInfo);

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.SaveToDB = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDB"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.DeleteFromDB = function(AObject) {
    var returnObject = this.executor.executeMethod('"DeleteFromDB"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param S [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.OpenQuery = function(S) {
    var returnObject = this.executor.executeMethod('OpenQuery', "GET", [S], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.S = S;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.OpenQuery_URL = function(S) {
    return this.executor.getMethodURL("OpenQuery", "GET", [S], arguments[1])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.Retrieve = function(ModClassName, AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [ModClassName, AID], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(ModClassName, AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [ModClassName, AID], arguments[2])[0];
  };

  /*
   * @param aTableName [in] - Type on server: string
   * @param aFieldName [in] - Type on server: string
   * @param aCountDigit [in] - Type on server: Integer
   * @return result - Type on server: string
   */
  this.GenerateCustomNo = function(aTableName, aFieldName, aCountDigit) {
    var returnObject = this.executor.executeMethod('GenerateCustomNo', "GET", [aTableName, aFieldName, aCountDigit], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aTableName = aTableName;
        resultObject.aFieldName = aFieldName;
        resultObject.aCountDigit = aCountDigit;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateCustomNo_URL = function(aTableName, aFieldName, aCountDigit) {
    return this.executor.getMethodURL("GenerateCustomNo", "GET", [aTableName, aFieldName, aCountDigit], arguments[3])[0];
  };

  /*
   * @param aClassName [in] - Type on server: string
   * @return result - Type on server: string
   */
  this.GenerateNo = function(aClassName) {
    var returnObject = this.executor.executeMethod('GenerateNo', "GET", [aClassName], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aClassName = aClassName;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateNo_URL = function(aClassName) {
    return this.executor.getMethodURL("GenerateNo", "GET", [aClassName], arguments[1])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.RetrieveSingle = function(ModClassName, AID) {
    var returnObject = this.executor.executeMethod('RetrieveSingle', "GET", [ModClassName, AID], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveSingle_URL = function(ModClassName, AID) {
    return this.executor.getMethodURL("RetrieveSingle", "GET", [ModClassName, AID], arguments[2])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param aCode [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.RetrieveByCode = function(ModClassName, aCode) {
    var returnObject = this.executor.executeMethod('RetrieveByCode', "GET", [ModClassName, aCode], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.aCode = aCode;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveByCode_URL = function(ModClassName, aCode) {
    return this.executor.getMethodURL("RetrieveByCode", "GET", [ModClassName, aCode], arguments[2])[0];
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.SaveToDBLog = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDBLog"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: string
   */
  this.SaveToDBID = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDBID"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: TStrings
   */
  this.TestGenerateSQL = function(AObject) {
    var returnObject = this.executor.executeMethod('"TestGenerateSQL"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param aDS [in] - Type on server: TDataSet
   * @param ModClassName [in] - Type on server: string
   * @return result - Type on server: TStrings
   */
  this.UpdateToDB = function(aDS, ModClassName) {
    var returnObject = this.executor.executeMethod('ToDB', "POST", [aDS, ModClassName], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aDS = aDS;
        resultObject.ModClassName = ModClassName;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.AfterExecuteMethod = function() {
    this.executor.executeMethod('AfterExecuteMethod', "GET", [], arguments[0], false, arguments[1], arguments[2]);
  };

  this.AfterExecuteMethod_URL = function() {
    return this.executor.getMethodURL("AfterExecuteMethod", "GET", [], arguments[0])[0];
  };
}

function TCrudSettingApp(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TCrudSettingApp",connectionInfo);

  /*
   * @param ACabang [in] - Type on server: TModUnit
   * @return result - Type on server: TModSettingApp
   */
  this.RetrieveByCabang = function(ACabang) {
    var returnObject = this.executor.executeMethod('"RetrieveByCabang"', "POST", [ACabang], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ACabang = ACabang;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.SaveToDB = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDB"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.DeleteFromDB = function(AObject) {
    var returnObject = this.executor.executeMethod('"DeleteFromDB"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param S [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.OpenQuery = function(S) {
    var returnObject = this.executor.executeMethod('OpenQuery', "GET", [S], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.S = S;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.OpenQuery_URL = function(S) {
    return this.executor.getMethodURL("OpenQuery", "GET", [S], arguments[1])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.Retrieve = function(ModClassName, AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [ModClassName, AID], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(ModClassName, AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [ModClassName, AID], arguments[2])[0];
  };

  /*
   * @param aTableName [in] - Type on server: string
   * @param aFieldName [in] - Type on server: string
   * @param aCountDigit [in] - Type on server: Integer
   * @return result - Type on server: string
   */
  this.GenerateCustomNo = function(aTableName, aFieldName, aCountDigit) {
    var returnObject = this.executor.executeMethod('GenerateCustomNo', "GET", [aTableName, aFieldName, aCountDigit], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aTableName = aTableName;
        resultObject.aFieldName = aFieldName;
        resultObject.aCountDigit = aCountDigit;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateCustomNo_URL = function(aTableName, aFieldName, aCountDigit) {
    return this.executor.getMethodURL("GenerateCustomNo", "GET", [aTableName, aFieldName, aCountDigit], arguments[3])[0];
  };

  /*
   * @param aClassName [in] - Type on server: string
   * @return result - Type on server: string
   */
  this.GenerateNo = function(aClassName) {
    var returnObject = this.executor.executeMethod('GenerateNo', "GET", [aClassName], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aClassName = aClassName;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateNo_URL = function(aClassName) {
    return this.executor.getMethodURL("GenerateNo", "GET", [aClassName], arguments[1])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.RetrieveSingle = function(ModClassName, AID) {
    var returnObject = this.executor.executeMethod('RetrieveSingle', "GET", [ModClassName, AID], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveSingle_URL = function(ModClassName, AID) {
    return this.executor.getMethodURL("RetrieveSingle", "GET", [ModClassName, AID], arguments[2])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param aCode [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.RetrieveByCode = function(ModClassName, aCode) {
    var returnObject = this.executor.executeMethod('RetrieveByCode', "GET", [ModClassName, aCode], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.aCode = aCode;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveByCode_URL = function(ModClassName, aCode) {
    return this.executor.getMethodURL("RetrieveByCode", "GET", [ModClassName, aCode], arguments[2])[0];
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.SaveToDBLog = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDBLog"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: string
   */
  this.SaveToDBID = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDBID"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: TStrings
   */
  this.TestGenerateSQL = function(AObject) {
    var returnObject = this.executor.executeMethod('"TestGenerateSQL"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param aDS [in] - Type on server: TDataSet
   * @param ModClassName [in] - Type on server: string
   * @return result - Type on server: TStrings
   */
  this.UpdateToDB = function(aDS, ModClassName) {
    var returnObject = this.executor.executeMethod('ToDB', "POST", [aDS, ModClassName], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aDS = aDS;
        resultObject.ModClassName = ModClassName;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.AfterExecuteMethod = function() {
    this.executor.executeMethod('AfterExecuteMethod', "GET", [], arguments[0], false, arguments[1], arguments[2]);
  };

  this.AfterExecuteMethod_URL = function() {
    return this.executor.getMethodURL("AfterExecuteMethod", "GET", [], arguments[0])[0];
  };
}

function TCrudQuotation(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TCrudQuotation",connectionInfo);

  /*
   * @param AModQuotation [in] - Type on server: TModQuotation
   * @return result - Type on server: Boolean
   */
  this.ActivateQuotation = function(AModQuotation) {
    var returnObject = this.executor.executeMethod('"ActivateQuotation"', "POST", [AModQuotation], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AModQuotation = AModQuotation;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.SaveToDB = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDB"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.DeleteFromDB = function(AObject) {
    var returnObject = this.executor.executeMethod('"DeleteFromDB"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param S [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.OpenQuery = function(S) {
    var returnObject = this.executor.executeMethod('OpenQuery', "GET", [S], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.S = S;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.OpenQuery_URL = function(S) {
    return this.executor.getMethodURL("OpenQuery", "GET", [S], arguments[1])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.Retrieve = function(ModClassName, AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [ModClassName, AID], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(ModClassName, AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [ModClassName, AID], arguments[2])[0];
  };

  /*
   * @param aTableName [in] - Type on server: string
   * @param aFieldName [in] - Type on server: string
   * @param aCountDigit [in] - Type on server: Integer
   * @return result - Type on server: string
   */
  this.GenerateCustomNo = function(aTableName, aFieldName, aCountDigit) {
    var returnObject = this.executor.executeMethod('GenerateCustomNo', "GET", [aTableName, aFieldName, aCountDigit], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aTableName = aTableName;
        resultObject.aFieldName = aFieldName;
        resultObject.aCountDigit = aCountDigit;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateCustomNo_URL = function(aTableName, aFieldName, aCountDigit) {
    return this.executor.getMethodURL("GenerateCustomNo", "GET", [aTableName, aFieldName, aCountDigit], arguments[3])[0];
  };

  /*
   * @param aClassName [in] - Type on server: string
   * @return result - Type on server: string
   */
  this.GenerateNo = function(aClassName) {
    var returnObject = this.executor.executeMethod('GenerateNo', "GET", [aClassName], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aClassName = aClassName;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateNo_URL = function(aClassName) {
    return this.executor.getMethodURL("GenerateNo", "GET", [aClassName], arguments[1])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.RetrieveSingle = function(ModClassName, AID) {
    var returnObject = this.executor.executeMethod('RetrieveSingle', "GET", [ModClassName, AID], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveSingle_URL = function(ModClassName, AID) {
    return this.executor.getMethodURL("RetrieveSingle", "GET", [ModClassName, AID], arguments[2])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param aCode [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.RetrieveByCode = function(ModClassName, aCode) {
    var returnObject = this.executor.executeMethod('RetrieveByCode', "GET", [ModClassName, aCode], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.aCode = aCode;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveByCode_URL = function(ModClassName, aCode) {
    return this.executor.getMethodURL("RetrieveByCode", "GET", [ModClassName, aCode], arguments[2])[0];
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.SaveToDBLog = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDBLog"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: string
   */
  this.SaveToDBID = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDBID"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: TStrings
   */
  this.TestGenerateSQL = function(AObject) {
    var returnObject = this.executor.executeMethod('"TestGenerateSQL"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param aDS [in] - Type on server: TDataSet
   * @param ModClassName [in] - Type on server: string
   * @return result - Type on server: TStrings
   */
  this.UpdateToDB = function(aDS, ModClassName) {
    var returnObject = this.executor.executeMethod('ToDB', "POST", [aDS, ModClassName], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aDS = aDS;
        resultObject.ModClassName = ModClassName;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.AfterExecuteMethod = function() {
    this.executor.executeMethod('AfterExecuteMethod', "GET", [], arguments[0], false, arguments[1], arguments[2]);
  };

  this.AfterExecuteMethod_URL = function() {
    return this.executor.getMethodURL("AfterExecuteMethod", "GET", [], arguments[0])[0];
  };
}

function TCrudAdjFaktur(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TCrudAdjFaktur",connectionInfo);

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.SaveToDB = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDB"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.DeleteFromDB = function(AObject) {
    var returnObject = this.executor.executeMethod('"DeleteFromDB"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param S [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.OpenQuery = function(S) {
    var returnObject = this.executor.executeMethod('OpenQuery', "GET", [S], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.S = S;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.OpenQuery_URL = function(S) {
    return this.executor.getMethodURL("OpenQuery", "GET", [S], arguments[1])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.Retrieve = function(ModClassName, AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [ModClassName, AID], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(ModClassName, AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [ModClassName, AID], arguments[2])[0];
  };

  /*
   * @param aTableName [in] - Type on server: string
   * @param aFieldName [in] - Type on server: string
   * @param aCountDigit [in] - Type on server: Integer
   * @return result - Type on server: string
   */
  this.GenerateCustomNo = function(aTableName, aFieldName, aCountDigit) {
    var returnObject = this.executor.executeMethod('GenerateCustomNo', "GET", [aTableName, aFieldName, aCountDigit], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aTableName = aTableName;
        resultObject.aFieldName = aFieldName;
        resultObject.aCountDigit = aCountDigit;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateCustomNo_URL = function(aTableName, aFieldName, aCountDigit) {
    return this.executor.getMethodURL("GenerateCustomNo", "GET", [aTableName, aFieldName, aCountDigit], arguments[3])[0];
  };

  /*
   * @param aClassName [in] - Type on server: string
   * @return result - Type on server: string
   */
  this.GenerateNo = function(aClassName) {
    var returnObject = this.executor.executeMethod('GenerateNo', "GET", [aClassName], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aClassName = aClassName;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateNo_URL = function(aClassName) {
    return this.executor.getMethodURL("GenerateNo", "GET", [aClassName], arguments[1])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.RetrieveSingle = function(ModClassName, AID) {
    var returnObject = this.executor.executeMethod('RetrieveSingle', "GET", [ModClassName, AID], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveSingle_URL = function(ModClassName, AID) {
    return this.executor.getMethodURL("RetrieveSingle", "GET", [ModClassName, AID], arguments[2])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param aCode [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.RetrieveByCode = function(ModClassName, aCode) {
    var returnObject = this.executor.executeMethod('RetrieveByCode', "GET", [ModClassName, aCode], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.aCode = aCode;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveByCode_URL = function(ModClassName, aCode) {
    return this.executor.getMethodURL("RetrieveByCode", "GET", [ModClassName, aCode], arguments[2])[0];
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.SaveToDBLog = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDBLog"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: string
   */
  this.SaveToDBID = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDBID"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: TStrings
   */
  this.TestGenerateSQL = function(AObject) {
    var returnObject = this.executor.executeMethod('"TestGenerateSQL"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param aDS [in] - Type on server: TDataSet
   * @param ModClassName [in] - Type on server: string
   * @return result - Type on server: TStrings
   */
  this.UpdateToDB = function(aDS, ModClassName) {
    var returnObject = this.executor.executeMethod('ToDB', "POST", [aDS, ModClassName], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aDS = aDS;
        resultObject.ModClassName = ModClassName;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.AfterExecuteMethod = function() {
    this.executor.executeMethod('AfterExecuteMethod', "GET", [], arguments[0], false, arguments[1], arguments[2]);
  };

  this.AfterExecuteMethod_URL = function() {
    return this.executor.getMethodURL("AfterExecuteMethod", "GET", [], arguments[0])[0];
  };
}

function TCrudBankCashOut(connectionInfo)
{
  this.executor = new ServerFunctionExecutor("TCrudBankCashOut",connectionInfo);

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.SaveToDB = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDB"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.DeleteFromDB = function(AObject) {
    var returnObject = this.executor.executeMethod('"DeleteFromDB"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param S [in] - Type on server: string
   * @return result - Type on server: TDataSet
   */
  this.OpenQuery = function(S) {
    var returnObject = this.executor.executeMethod('OpenQuery', "GET", [S], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.S = S;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.OpenQuery_URL = function(S) {
    return this.executor.getMethodURL("OpenQuery", "GET", [S], arguments[1])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.Retrieve = function(ModClassName, AID) {
    var returnObject = this.executor.executeMethod('Retrieve', "GET", [ModClassName, AID], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.Retrieve_URL = function(ModClassName, AID) {
    return this.executor.getMethodURL("Retrieve", "GET", [ModClassName, AID], arguments[2])[0];
  };

  /*
   * @param aTableName [in] - Type on server: string
   * @param aFieldName [in] - Type on server: string
   * @param aCountDigit [in] - Type on server: Integer
   * @return result - Type on server: string
   */
  this.GenerateCustomNo = function(aTableName, aFieldName, aCountDigit) {
    var returnObject = this.executor.executeMethod('GenerateCustomNo', "GET", [aTableName, aFieldName, aCountDigit], arguments[3], true, arguments[4], arguments[5]);
    if (arguments[3] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aTableName = aTableName;
        resultObject.aFieldName = aFieldName;
        resultObject.aCountDigit = aCountDigit;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateCustomNo_URL = function(aTableName, aFieldName, aCountDigit) {
    return this.executor.getMethodURL("GenerateCustomNo", "GET", [aTableName, aFieldName, aCountDigit], arguments[3])[0];
  };

  /*
   * @param aClassName [in] - Type on server: string
   * @return result - Type on server: string
   */
  this.GenerateNo = function(aClassName) {
    var returnObject = this.executor.executeMethod('GenerateNo', "GET", [aClassName], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aClassName = aClassName;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  this.GenerateNo_URL = function(aClassName) {
    return this.executor.getMethodURL("GenerateNo", "GET", [aClassName], arguments[1])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param AID [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.RetrieveSingle = function(ModClassName, AID) {
    var returnObject = this.executor.executeMethod('RetrieveSingle', "GET", [ModClassName, AID], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.AID = AID;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveSingle_URL = function(ModClassName, AID) {
    return this.executor.getMethodURL("RetrieveSingle", "GET", [ModClassName, AID], arguments[2])[0];
  };

  /*
   * @param ModClassName [in] - Type on server: string
   * @param aCode [in] - Type on server: string
   * @return result - Type on server: TModApp
   */
  this.RetrieveByCode = function(ModClassName, aCode) {
    var returnObject = this.executor.executeMethod('RetrieveByCode', "GET", [ModClassName, aCode], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.ModClassName = ModClassName;
        resultObject.aCode = aCode;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.RetrieveByCode_URL = function(ModClassName, aCode) {
    return this.executor.getMethodURL("RetrieveByCode", "GET", [ModClassName, aCode], arguments[2])[0];
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: Boolean
   */
  this.SaveToDBLog = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDBLog"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: string
   */
  this.SaveToDBID = function(AObject) {
    var returnObject = this.executor.executeMethod('"SaveToDBID"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param AObject [in] - Type on server: TModApp
   * @return result - Type on server: TStrings
   */
  this.TestGenerateSQL = function(AObject) {
    var returnObject = this.executor.executeMethod('"TestGenerateSQL"', "POST", [AObject], arguments[1], true, arguments[2], arguments[3]);
    if (arguments[1] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.AObject = AObject;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  /*
   * @param aDS [in] - Type on server: TDataSet
   * @param ModClassName [in] - Type on server: string
   * @return result - Type on server: TStrings
   */
  this.UpdateToDB = function(aDS, ModClassName) {
    var returnObject = this.executor.executeMethod('ToDB', "POST", [aDS, ModClassName], arguments[2], true, arguments[3], arguments[4]);
    if (arguments[2] == null) {
      if (returnObject != null && returnObject.result != null && isArray(returnObject.result)) {
        var resultArray = returnObject.result;
        var resultObject = new Object();
        resultObject.aDS = aDS;
        resultObject.ModClassName = ModClassName;
        resultObject.result = resultArray[0];
        if (returnObject.cacheId != null && returnObject.cmdIndex != null) {
          resultObject._cacheId = returnObject.cacheId;
          resultObject._cmdIndex = returnObject.cmdIndex;
        }
        return resultObject;
      }
      return returnObject;
    }
  };

  this.AfterExecuteMethod = function() {
    this.executor.executeMethod('AfterExecuteMethod', "GET", [], arguments[0], false, arguments[1], arguments[2]);
  };

  this.AfterExecuteMethod_URL = function() {
    return this.executor.getMethodURL("AfterExecuteMethod", "GET", [], arguments[0])[0];
  };
}

var JSProxyClassList = {
  "DSAdmin": ["GetPlatformName","ClearResources","FindPackages","FindClasses","FindMethods","CreateServerClasses","DropServerClasses","CreateServerMethods","DropServerMethods","GetServerClasses","ListClasses","DescribeClass","ListMethods","DescribeMethod","GetServerMethods","GetServerMethodParameters","GetDatabaseConnectionProperties","GetDSServerName","ConsumeClientChannel","ConsumeClientChannelTimeout","CloseClientChannel","RegisterClientCallbackServer","UnregisterClientCallback","BroadcastToChannel","BroadcastObjectToChannel","NotifyCallback","NotifyObject"],
  "TServerMethods": ["EchoString","ReverseString"],
  "TTestMethod": ["Hallo"],
  "TCrud": ["SaveToDB","DeleteFromDB","OpenQuery","Retrieve","GenerateCustomNo","GenerateNo","RetrieveSingle","RetrieveByCode","SaveToDBLog","SaveToDBID","TestGenerateSQL","UpdateToDB","AfterExecuteMethod"],
  "TDSProvider": ["Bank_GetDSOverview","Rekening_GetDSLookup","RefPajak_GetDSOverview","RefTipeBarang_GetDSOverview","GroupRekening_GetDSLookup","Rekening_GetDSOverview","Member_GetDSOverview","MemberActivasi_GetDSOverview","RefDiscMember_GetDSOverview","MemberKeluarga_GetDSOverview","RefGrupMember_GetDSOverview","Satuan_GetDSLookup","CostCenter_GetDSLookup","Company_GetDSLookup","CostCenter_GetDSOverview","Company_GetDSOverview","TipePembayaran_GetDSOverview","TipePerusahaan_GetDSOverview","Outlet_GetDSLookup","Lokasi_GetDSLookup","Merchandise_GetDSLookup","MerchandiseGroup_GetDSLookup","SubGroup_GetDSLookup","Satuan_GetDSOverview","Kategori_GetDSLookup","Merk_GetDSLookUp","RefPajak_GetDSLookup","RefTipeBarang_GetDSLookup","TipeSuplier_GetDSOverview","Unit_GetDSOverview","Unit_GetDSLookUp","UnitType_GetDSLookUp","UnitType_GetDSOverview","App_GetDSLookUp","App_GetDSOverview","Bank_GetDSLookup","Barang_GetDSOverview","Gudang_GetDSOverview","RefTipeMember_GetDSOverview","AutAPP_GetDSLookup","TipeKirimPO_GetDSOverview","SuplierGroup_GetDSOverview1","SuplierGroup_GetDSLookup","Suplier_GetDSOverview","TipePerusahaan_GetDSLookup","TipeSuplier_GetDSLookup","Propinsi_GetDSLookUp","Kabupaten_GetDSLookUp","MataUang_GetDSOverview","Agama_GetDSLookup","TipeBonus_GetDSOverview","Document_GetDSOverview","Agama_GetDSOverview","AutUnit_GetDSLookup","BarangSupp_GetDSLookup","BarangQuotation_GetDSLookup","BarangSupp_GetDSLookup2","Barang_ByPOLookUp","Barang_GetDSLookup","Quotation_GetDSOverview","GET_MEMBER_PAS_NO","Merchandise_GetDSOverview","SupMGByOutstandingSO_GetDSLookup","StatusPO_GetDSLookup","TipeHarga_GetDSLookup","RefWilayah_GetDSLookup","Suplier_GetDSLookup","RefTipeMember_GetDSLookup","TipePO_GetDSOverview","TipeCN_GetDSOverview","SO_GetDSOverview","SO_GetDSOLookUp","SubGroup_GetDSOverview","SuplierMerchan_GetDSLookup","DO_GetDSLookUp","DO_GetDSOverview","Gudang_GetDSLookUp","Kompetitor_GetDSOverview","SO_GetDSOLookUpGeneratePO","PO_GetDSOLookUp","PORevisi_GetDSOverview","PO_DSLookUpDetail","PO_GetDSByPeriod","PO_GetDSOLookUpForGR","PO_SKULookUP","PO_SLIP_GetDSOverview","PO_GetDSOverviewDetil","PO_GetDSOverview","RefCreditCard_GetDSOverview","CN_RCV_GetDSOverview","DN_RCV_GetDSOverview","AdjFaktur_GetDSOverview","AP_GetDSLookUp","AP_GetDSLookUpPerOrganization","Organization_GetDSLookup","Shift_GetDSOverview","DODetail_LookupAdjFak","PO_GetDSOLookUpForAdj","AutUser_GetDSOverview","BankCashOut_GetDSByPeriod","RekeningBCOLain_GetDSLookup"],
  "TDSReport": ["BankCashOut_GetDS_Slip","DO_GetDSNP","DO_GetDS_CheckList","DSA_GetDS","DSR_GetDS","KartuStock_GetDS","StockProduct_GetDS","SO_ByDate","SO_ByDateNoBukti","PO_SLIP_ByDateNoBukti","SO_Test","InvMovement_GetDS"],
  "TSuggestionOrder": ["GenerateSO","RetrieveDetails","AfterExecuteMethod"],
  "TCrudSupplier": ["BeforeSaveToDB","SaveToDB","DeleteFromDB","OpenQuery","Retrieve","GenerateCustomNo","GenerateNo","RetrieveSingle","RetrieveByCode","SaveToDBLog","SaveToDBID","TestGenerateSQL","UpdateToDB","AfterExecuteMethod"],
  "TCrudPO": ["GeneratePO","SaveToDB","DeleteFromDB","OpenQuery","Retrieve","GenerateCustomNo","GenerateNo","RetrieveSingle","RetrieveByCode","SaveToDBLog","SaveToDBID","TestGenerateSQL","UpdateToDB","AfterExecuteMethod"],
  "TCrudDO": ["RetrieveByPO","SaveToDB","DeleteFromDB","OpenQuery","Retrieve","GenerateCustomNo","GenerateNo","RetrieveSingle","RetrieveByCode","SaveToDBLog","SaveToDBID","TestGenerateSQL","UpdateToDB","AfterExecuteMethod"],
  "TCrudCNRecv": ["SaveToDB","DeleteFromDB","OpenQuery","Retrieve","GenerateCustomNo","GenerateNo","RetrieveSingle","RetrieveByCode","SaveToDBLog","SaveToDBID","TestGenerateSQL","UpdateToDB","AfterExecuteMethod"],
  "TCrudDNRecv": ["SaveToDB","DeleteFromDB","OpenQuery","Retrieve","GenerateCustomNo","GenerateNo","RetrieveSingle","RetrieveByCode","SaveToDBLog","SaveToDBID","TestGenerateSQL","UpdateToDB","AfterExecuteMethod"],
  "TCrudSettingApp": ["RetrieveByCabang","SaveToDB","DeleteFromDB","OpenQuery","Retrieve","GenerateCustomNo","GenerateNo","RetrieveSingle","RetrieveByCode","SaveToDBLog","SaveToDBID","TestGenerateSQL","UpdateToDB","AfterExecuteMethod"],
  "TCrudQuotation": ["ActivateQuotation","SaveToDB","DeleteFromDB","OpenQuery","Retrieve","GenerateCustomNo","GenerateNo","RetrieveSingle","RetrieveByCode","SaveToDBLog","SaveToDBID","TestGenerateSQL","UpdateToDB","AfterExecuteMethod"],
  "TCrudAdjFaktur": ["SaveToDB","DeleteFromDB","OpenQuery","Retrieve","GenerateCustomNo","GenerateNo","RetrieveSingle","RetrieveByCode","SaveToDBLog","SaveToDBID","TestGenerateSQL","UpdateToDB","AfterExecuteMethod"],
  "TCrudBankCashOut": ["SaveToDB","DeleteFromDB","OpenQuery","Retrieve","GenerateCustomNo","GenerateNo","RetrieveSingle","RetrieveByCode","SaveToDBLog","SaveToDBID","TestGenerateSQL","UpdateToDB","AfterExecuteMethod"]
};

