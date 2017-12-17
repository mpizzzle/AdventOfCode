spinlock_buffer = [0]

ptr = 0
step = 329

for i in range(1, 2018):
    ptr = ((ptr + step) % len(spinlock_buffer)) + 1
    spinlock_buffer.insert(ptr, i)

print spinlock_buffer[ptr + 1]
