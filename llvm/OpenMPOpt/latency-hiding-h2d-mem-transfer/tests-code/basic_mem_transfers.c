int rand();

double heavyComputation1() {
  double a = rand() % 777;
  double random = rand();

#pragma omp target data map(a)
#pragma omp target teams
  for (int i = 0; i < 1000; ++i) {
    a *= i*i / 2;
  }

  return random + a;
}

int heavyComputation2(double *a, unsigned size) {
  int random = rand() % 7;

#pragma omp target data map(a[0:size], size)
#pragma omp target teams
  for (int i = 0; i < size; ++i) {
    a[i] = ++a[i] * 3.141624;
  }

  return random;
}

int heavyComputation3(double * restrict a, unsigned size) {
  int random = rand() % 7;

#pragma omp target data map(a[0:size], size)
#pragma omp target teams
  for (int i = 0; i < size; ++i) {
    a[i] = ++a[i] * 3.141624;
  }

  return random;
}

int dataTransferOnly1(double * restrict a, unsigned size) {
  int random = rand();

#pragma omp target data map(to: a[0:size])

  random %= size;
  return random;
}