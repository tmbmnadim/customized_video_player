class CachedConstructorTestVm {
  int age = 0;

  CachedConstructorTestVm._();

  static final CachedConstructorTestVm instance = CachedConstructorTestVm._();

  void incrementAndPrintAge() {
    age++;
    print(age);
  }
}

class ConstructorTestVm {
  int dage = 0;

  ConstructorTestVm();

  void incrementAndPrintAge() {
    dage++;
    print(dage);
  }
}
