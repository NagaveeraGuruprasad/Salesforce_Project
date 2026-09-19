public class ApexRestCallout {
  public static void getUsersFromExternalSystem(){
      
    HTTP httpObj = new HTTP();
    HTTPRequest req = new HTTPRequest();
    
    req.setEndpoint('https://reqres.in/api/users');
    req.setHeader('Content-Type','application/json');
    req.setMethod('GET');
   // req.setbody('');
   HTTPResponse res = new HTTPResponse();
      res=httpObj.send(req);
      system.debug('@@@@@----'+res.getBody());
}
}