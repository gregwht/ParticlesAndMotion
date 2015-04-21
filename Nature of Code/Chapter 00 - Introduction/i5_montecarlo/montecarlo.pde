float montecarlo() {

  while (true) {

    float r1 = random(1);    // Pick a random value
    float probability = r1;  // Assign a probability

    float r2 = random(1);    // Pick another random value

    if (r2 < probability) {
      println(r1);
      return r1;
    }
  }
}

