import http.requests.*;

String APPID = "jmL5jeyUwmSo46xc5bWiyq8N";
String APPKEY = "vbhygSuzUn0DAMRcGpDpob0V";
String BASICURL = "https://leancloud.cn:443/1.1/classes/";

private GetRequest buildRequest(JSONObject queryData){
  String requestUrl = buildQueryParams(queryData);
  GetRequest get = new GetRequest(requestUrl);
  get.addHeader("X-LC-Id", APPID);
  get.addHeader("X-LC-Key", APPKEY);
  get.addHeader("Content-Type", "application/json");
  return get;
}

private JSONObject getJSONResponse(GetRequest get){
  get.send(); // program will wait untill the request is completed
  String content = get.getContent();
  println("response: " + content);
  JSONObject response = parseJSONObject(content);
  return response;
}

private String buildQueryParams(JSONObject queryData){
  String className = queryData.getString("className","Weibo");
  JSONObject where = null;
  try{
    where = queryData.getJSONObject("where");
  }catch(Exception e){
    where = parseJSONObject("{mark:{$exists:true}}");
  }
  Integer limit = queryData.getInt("limit",20);
  Integer skip = queryData.getInt("skip",0);
  String order = queryData.getString("order","mark,-updatedAt");
  StringBuilder sb = new StringBuilder();
  sb.append(BASICURL);
  sb.append(className);
  sb.append("?");
  sb.append("where=").append(encodeURL(where.toString())).append("&");
  sb.append("limit=").append(encodeURL(limit.toString())).append("&");
  sb.append("skip=").append(encodeURL(skip.toString())).append("&");
  sb.append("order=").append(encodeURL(order));
  return sb.toString();
}