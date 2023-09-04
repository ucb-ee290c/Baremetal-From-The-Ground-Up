#define SET_BITS(REG, BIT)            ((REG) |= (BIT))
#define CLEAR_BITS(REG, BIT)          ((REG) &= ~(BIT))

#define GPIOA_BASE                    0x10010000U

#define GPIO_PIN_0                    0b0001U
#define GPIO_PIN_1                    0b0001U
#define GPIO_PIN_2                    0b0001U
#define GPIO_PIN_3                    0b0001U




static inline void simpleDelay() {
  for (int i=0; i<1000000; i+=1) {
    __asm__("nop");
  }
}

int main() {
  *(unsigned int volatile *)(GPIOA_BASE + 0x00U) = GPIO_PIN_0;

  while (1) {
    SET_BITS(*(unsigned int volatile *)(GPIOA_BASE + 0x00U), GPIO_PIN_0);
    simpleDelay();
    
    CLEAR_BITS(*(unsigned int volatile *)(GPIOA_BASE + 0x00U), GPIO_PIN_0);
    simpleDelay();
  }
}
