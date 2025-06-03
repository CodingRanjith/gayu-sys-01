/* 
class Ticker

@description  : Data provider for Timer app , tick till the input duration
@args         : int ticker duration
@return       : stream<int>

 */

class Ticker {
  const Ticker();

  Stream<int> tick({required int ticks}) {
    return Stream.periodic(
      Duration(seconds: 1),
      (x) => ticks - x - 1,
    ).take(ticks);
  }
}
