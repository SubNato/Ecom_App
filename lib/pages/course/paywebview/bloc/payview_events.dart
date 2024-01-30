abstract class PayWebViewEvents{
  const PayWebViewEvents();
}
//inside add(TriggerWebView(url))
class TriggerWebView extends PayWebViewEvents{
  final String url;
  const TriggerWebView(this.url);
}

//You can trigger an event using the add method.