.data
N: .word 5  # Example with N = 5, but you can change it as per your needs

.text
.globl main

main:
    li a0, 1          # a0 will be our counter starting from 1
    li s0, 1          # s0 will hold our product, initialized to 1

loop:
    ble a0, N, multiply  # If a0 (counter) is less than or equal to N, continue to multiply
    j end                # If not, jump to end

multiply:
    mul s0, s0, a0        # s0 = s0 * a0, multiply current product by counter
    addi a0, a0, 1        # Increment counter by 1
    j loop                # Jump back to start of loop

end:
    # Here you would typically write the product s0 to a memory location or print it out
    # For now, we assume the program ends here
    # s0 now contains the factorial result