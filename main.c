// some handy macros to do bit operations
#define SET_BITS(REG, BIT)              ((REG) |= (BIT))
#define CLEAR_BITS(REG, BIT)            ((REG) &= !(BIT))

// peripheral MMIO addresses
#define GPIOA_OUTPUT_VAL                0x1001000CUL
#define GPIOA_OUTPUT_EN                 0x10010008UL
#define CLINT_MTIME                     0x0200BFF8UL

// the pin we are using
const unsigned int GPIO_PIN = 0x01;

// a global counter
volatile unsigned int counter;

// A simple delay function. 
void delay(unsigned int ticks) {
  unsigned int mtime_start;
  while ((*(volatile unsigned int *)CLINT_MTIME) - mtime_start < ticks) {}
}

void main() {
  // enable GPIOA as output
  SET_BITS(*(volatile unsigned int *)GPIOA_OUTPUT_EN, GPIO_PIN);

  while (1) {
    // if counter is even, turn on the LED, otherwise turn it off
    if (counter % 2 == 0) {
      SET_BITS(*(volatile unsigned int *)GPIOA_OUTPUT_VAL, GPIO_PIN);
    } else {
      CLEAR_BITS(*(volatile unsigned int *)GPIOA_OUTPUT_VAL, GPIO_PIN);
    }

    // delay for 1 second
    delay(1000);
    
    // increment the counter
    counter += 1;
  }

  // we won't reach here if everything is working
}