.data
N: .word 20  # Example with N = 20, but you can change it as per your needs

.text
.globl main

main:
    li s0, 0          # s0 will hold our sum of primes, initialized to 0
    li a0, 2          # Start checking primes from 2

outer_loop:
    blt a0, N, check_prime  # If a0 (current number) is less than N, check if it's prime
    j end                    # If not, jump to end

check_prime:
    li a1, 2
    li s1, 1          # s1 is our flag to indicate prime (1 means prime)

inner_loop:
    blt a1, a0, test_divisibility  # Test divisibility by numbers less than the current number
    beqz s1, update_sum            # If s1 is zero, it's not a prime, don't add to sum
    j continue_outer_loop

test_divisibility:
    rem t0, a0, a1        # t0 = a0 % a1
    beqz t0, not_prime    # If remainder is 0, it's not a prime
    addi a1, a1, 1        # Increment divisor
    j inner_loop          # Continue inner loop

not_prime:
    li s1, 0              # Set prime flag to 0
    j continue_outer_loop

update_sum:
    add s0, s0, a0        # Add current number to sum

continue_outer_loop:
    addi a0, a0, 1        # Increment number to check
    j outer_loop          # Jump back to start of outer loop

end:
    # Here you would typically write the sum s0 to a memory location or print it out
    # For now, we assume the program ends here
    # s0 now contains the sum of all prime numbers less than N