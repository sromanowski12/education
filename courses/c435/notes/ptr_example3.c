#include <stdio.h>
int main();
void scale_dimensions (int *, int *);
/* Scale some measurements */
int main()
{
    int height,width;
    height = 4;
    width = 5;
    scale_dimensions (&height, &width);
    printf ("Scaled height = %d\n", height);
    printf ("Scaled width = %d\n", width);
    return 0;
}
void scale_dimensions (int *height_ptr, int *width_ptr)
{
    int hscale = 3; /* scale factors */
    int wscale = 5;
    *height_ptr = *height_ptr * hscale;
    *width_ptr = *width_ptr * wscale;
}