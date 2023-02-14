#include <stdio.h>
#include <stdlib.h>
#include <string.h>
/* To shorten example, not using argp */
int main()
{
    struct personal_data
    {
        char name[100];
        char address[200];
        int year_of_birth;
        int month_of_birth;
        int day_of_birth;
    };
    struct personal_data person1 =
        {
            "Liddell, Alice",
            "Wonderland",
            1852,
            5,
            4};
    struct personal_data person2 =
        {
            "Hale-Evans, Ron",
            "Seattle, Washington",
            1965,
            6,
            27};
    struct personal_data *person_ptr1;
    struct personal_data *person_ptr2;
    person_ptr1 = (struct personal_data *)
        malloc(sizeof(struct personal_data));

    strcpy(person_ptr1->name, "Adams, Douglas");
    strcpy(person_ptr1->address, "The Galaxy");
    person_ptr1->year_of_birth = 1952;
    person_ptr1->month_of_birth = 3;
    /* Don’t know his exact birthday */
    person_ptr2 = (struct personal_data *)
        malloc(sizeof(struct personal_data));

    strcpy(person_ptr2->name, "Egan, Greg");
    strcpy(person_ptr2->address, "Permutation City");
    person_ptr2->year_of_birth = 1961;
    /* Don’t know his birthday */
    puts("Data contained:");
    puts(person1.name);
    puts(person2.name);
    puts(person_ptr1->name);
    puts(person_ptr2->name);
    
    return 0;
}