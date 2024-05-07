.data
N: .word 99  # Example with N = 99, but you can change it as per your needs

.text
.globl main

main:
    li a0, 1       # Initialize a0 with 1, starting point for our odd numbers
    li s0, 0       # s0 will hold our sum, initialized to 0

loop:
    blt a0, N, compute  # If a0 (current number) is less than N, continue to compute
    j end              # If not, jump to end

compute:
    mul t0, a0, a0      # t0 = a0 * a0, square the current number
    add s0, s0, t0      # s0 = s0 + t0, add the square to the sum
    addi a0, a0, 2      # Increment a0 by 2 to get the next odd number
    j loop              # Jump back to start of loop

end:
    # Here you would typically write the sum s0 to a memory location or print it out
    # For now, we assume the program ends here
    # s0 now contains the result