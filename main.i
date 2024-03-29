# 1 "./main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./main.c"
# 11 "./main.c"
const unsigned int GPIO_PIN = 0x01;


volatile unsigned int counter;


void delay(unsigned int ticks) {
  unsigned int mtime_start;
  while ((*(volatile unsigned int *)0x0200BFF8UL) - mtime_start < ticks) {}
}

void main() {

  ((*(volatile unsigned int *)0x10010008UL) |= (GPIO_PIN));

  while (1) {

    if (counter % 2 == 0) {
      ((*(volatile unsigned int *)0x1001000CUL) |= (GPIO_PIN));
    } else {
      ((*(volatile unsigned int *)0x1001000CUL) &= !(GPIO_PIN));
    }


    delay(1000);


    counter += 1;
  }


}