void main() async {
  task1();
  final downloadedPhoto = await task2();
  task3(photo: downloadedPhoto);
}

void task1() {
  print('Task 1 ran');
}

Future<String?> task2() async {
  //download high quality image
  await Future.delayed(Duration(seconds: 5)).then((_) {
    print('Task 2 ran');
  });
  return 'my photo';
}

task3({String? photo}) {
  // print('Task 3 ran');
  print(photo);
}
