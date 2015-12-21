import wsp5.*;

WsClient client;

import org.apache.commons.codec.binary.Base64;
import java.nio.file.Files;
import java.io.File;

String wsserver = "ws://dev.wsapperance.avosapps.com/weibo";
void setup(){
  // you need to wrap this in a try/catch for now...
  try {
    client = new WsClient( this, wsserver);
    client.connect();
  } catch ( Exception e ){
  }
}

void draw(){
}

void mousePressed(){
  //test that post weibo with picture and at a user by make a comment
  String pathOfPic = "/Users/vincent/Pictures/images_1x/Snip20151213_18.png";
  File pic = new File(pathOfPic);
  try{
  byte[] fileContent = Files.readAllBytes(pic.toPath());
    JSONObject postWeiboMsg = new JSONObject();
    postWeiboMsg.setString("atuser","\u5349\u6676\u5154\u7eb8");//user_nick_name
    postWeiboMsg.setString("text","the text content of this weibo");
    postWeiboMsg.setString("image",new String(Base64.encodeBase64(fileContent)));
    client.send(postWeiboMsg.toString());
  }
  catch(IOException e){
  }
}

void onWsOpen(){
  println("\u63a5\u53d7\u5fae\u535a/\u53d1\u9001\u5fae\u535a\u7684\u8fde\u63a5\u5df2\u7ecf\u5efa\u7acb");
}

void onWsMessage( String msg ){
  println("client: got a message "+msg);
  JSONObject result = parseJSONObject(msg);
  String errmsg = result.getString("errmsg","");
  if(errmsg != ""){
    //error
  }else{
    //successfully
    result.getString("msg","");
  }
}

void onWsClose(){
  println("\u8fde\u63a5\u5df2\u7ecf\u5173\u95ed");
}