void main()
{
    extern int accerman(int m, int n);

    int result;

    result = accerman(0, 4);
    if (result != 5)
    {
        asm volatile("li a7, 93\nli a0, 1\necall");
    }

    result = accerman(1, 1);
    if (result != 3)
    {
        asm volatile("li a7, 93\nli a0, 2\necall");
    }

    result = accerman(4, 0);
    if (result != 13)
    {
        asm volatile("li a7, 93\nli a0, 3\necall");
    }

    result = accerman(3, 10);
    if (result != 8189)
    {
        asm volatile("li a7, 93\nli a0, 4\necall");
    }

    result = accerman(4, 1);

    if (result != 65533)
    {
        asm volatile("li a7, 93\nli a0, 5\necall");
    }

    asm volatile("li a7, 93\nli a0, 0\necall");
}