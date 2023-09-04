# 1 "./main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./main.c"
# 14 "./main.c"
static inline void simpleDelay() {
  for (int i=0; i<1000000; i+=1) {
    __asm__("nop");
  }
}

int main() {
  *(unsigned int volatile *)(0x10010000U + 0x00U) = 0b0001U;

  while (1) {
    ((*(unsigned int volatile *)(0x10010000U + 0x00U)) |= (0b0001U));
    simpleDelay();

    ((*(unsigned int volatile *)(0x10010000U + 0x00U)) &= ~(0b0001U));
    simpleDelay();
  }
}
