String encodeURL(String str) {
  String encoded = null;
  try { encoded = java.net.URLEncoder.encode(str, "UTF-8"); } 
  catch (Exception e) {
  }
  return encoded;
}