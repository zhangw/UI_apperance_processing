public void setup() {
  size(400, 400);
  smooth();
  println("zhe shi yi ge huoqu weibo shuju de li zi");
  JSONObject jsonobj = new JSONObject();
  GetRequest request = buildRequest(jsonobj);
  JSONObject response = getJSONResponse(request);
  JSONArray weibos = response.getJSONArray("results");
  println(weibos.toString());
}