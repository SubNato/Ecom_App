class PayWebViewStates {
  final String url;

  const PayWebViewStates({this.url = ""});

  //We are going to pass event.url, when we call it!
  PayWebViewStates copyWith({String? url}) {
    return PayWebViewStates(url: url ?? this.url);
  }
}
