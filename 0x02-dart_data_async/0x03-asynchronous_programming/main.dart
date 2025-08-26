import 'dart:async';
import 'dart:convert';
import 'dart:math';

void main() async {
  print("Receiving...");
  print(await simulateNetworkCall());
  print(await multiStepProcess());
  List<int> list = [1, 2, 3, 4, 5];
  Stream<int> stream = emitWithDelay(list);
  listenAndCancel(stream);
  /**
   * Checking emitWithDelay() before creating listAndCancel()
   * 
    await for (var value in emitWithDelay(list)) {
      print (value);
    }
  */
  print(jsonEncode(await runParallelCalls()));
}

Future<String> simulateNetworkCall() {//=>
  // Commented lines in this function are solution for task 0
  //Future.delayed(const Duration(seconds: 2), () => "Data received");
  return Future.delayed(const Duration(seconds: 2), () {
    bool fail = Random().nextBool();
    if(fail) throw Exception("Network error");
    return "Data received";
  });
  }

Future<String> multiStepProcess() =>
  Future.delayed(const Duration(seconds: 1), () => print('"Step 1"'))
      .then((_) => Future.delayed(const Duration(seconds: 1), () => print('"Step 2"')))
      .then((_) => Future.delayed(const Duration(seconds: 1), () => '"Done"'));

Stream<int> emitWithDelay(List<int> values) async* {
  for(var value in values) {
    await Future.delayed(Duration(milliseconds: 500));
    yield value;
  }
}

void listenAndCancel(Stream<int> stream) {
  int count = 0;
  StreamSubscription<int>? subs;
  subs = stream.listen((value) {
    print(value);
    count++;
    if(count == 3) {
      subs?.cancel();
    }
  });
}

Future<String> safeNetworkCall() async {
  try {
    return await simulateNetworkCall();
  } catch (er) {
    return "Fallback data";
  }
}

Future<List<String>> runParallelCalls() async {
  Future<String> first = Future.delayed(const Duration(seconds: 1), () => "First");
  Future<String> second = Future.delayed(const Duration(seconds: 2), () => "Second");
  Future<String> third = Future.delayed(const Duration(seconds: 3), () => "Third");
  List<String> result = await Future.wait([first, second, third]);
  return result;
}
