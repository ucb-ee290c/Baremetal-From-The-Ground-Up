
ENTRY(main)

MEMORY {
  SCRATCHPAD(rwx): ORIGIN = 0x08000000, LENGTH = 4K
}

SECTIONS {
  .text : {
    *(.text)
  }> SCRATCHPAD
}
