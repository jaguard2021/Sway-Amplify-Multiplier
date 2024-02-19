contract;

abi AmplifyMultiplier {
  #[storage(write)]
  fn initialize_counter(value: u64) -> u64;

  #[storage(read, write)]
  fn multiply_counter(amount: u64) -> u64;

  #[storage(read, write)]
  fn increment_counter(amount: u64) -> u64; 
}

storage {
  counter: u64 = 0,
}

impl AmplifyMultiplier for Contract {
  #[storage(write)]
  fn initialize_counter(value: u64) -> u64 {
    storage.counter.write(value);
    value
  }

  #[storage(read, write)]
  fn multiply_counter(amount: u64) -> u64 {
    let multiplied = storage.counter.read() * amount;
    storage.counter.write(multiplied);
    multiplied
  }

  #[storage(read, write)]
  fn increment_counter(amount: u64) -> u64 { // Optional
    let incremented = storage.counter.read() + amount;
    storage.counter.write(incremented);
    incremented
  }
}
