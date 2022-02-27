// Seth Romanowski
// INFO-C307
// 
// Exam 2 - class Browser

public class Browser
{
    private Website current;

    public Browser()
    {
        this.current = null;
    }

    public Browser(String site)
    {
        this.current.url = site;
    }

    public void backward()
    {

    }

    public void forward()
    {

    }

    public void show()
    {
        System.out.println(current.url);
    }

    public void visit(Website w)
    {

    }

}