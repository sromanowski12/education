// Seth Romanowski
// INFO-C307

// class Website

public class Website
{
    public String url;
    public Website previous;
    public Website next;

    public Website(String site)
    {
        this.url = site;
        this.previous = null;
        this.next = null;
    }

}