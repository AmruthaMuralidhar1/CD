#include <stdio.h>
#include <string.h>

int A();
char str[15];
int isave, curr_ptr = 0;

int main(void)
{
    printf("1.S->cAd\n2.A->ab/a\n");
    printf("This is a parser for the above grammar:\n");
    printf("Enter any string:");
    scanf("%s", str);

    while (curr_ptr < strlen(str))
    {
        if (str[curr_ptr] == 'c')
        {
            curr_ptr++;
            if (A())
            {
                curr_ptr++;
                if (str[curr_ptr] == 'd' && str[curr_ptr + 1] == '\0')
                {
                    printf("String is accepted by the grammar\n");
                    return 1;
                }
                else
                    break;
            }
            else
                break;
        }
        else
            break;
    }

    printf("String is not accepted by the grammar\n");
    return 0;
}

int A()
{
    isave = curr_ptr;

    if (str[curr_ptr] == 'a')
    {
        curr_ptr++;
        if (str[curr_ptr] == 'b')
            return 1;
    }

    curr_ptr = isave;

    if (str[curr_ptr] == 'a')
        return 1;
    else
        return 0;
}

