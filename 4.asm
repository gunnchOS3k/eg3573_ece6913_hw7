.data
N: .word 5  # Example with N = 5 terms, but you can change it as per your needs

.text
.globl main

main:
    li a0, 1          # a0 will hold the current term, starting with a = 1
    li s0, 0          # s0 will hold our sum of terms, initialized to 0
    li t0, -3         # t0 holds the common ratio r = -3
    li t1, 0          # t1 is our loop counter

loop:
    bge t1, N, end    # If we've added N terms, exit the loop
    add s0, s0, a0    # Add the current term to the sum
    mul a0, a0, t0    # Calculate the next term: current term * ratio
    addi t1, t1, 1    # Increment our counter
    j loop            # Continue the loop

end:
    # Here you would typically write the sum s0 to a memory location or print it out
    # For now, we assume the program ends here
    # s0 now contains the result