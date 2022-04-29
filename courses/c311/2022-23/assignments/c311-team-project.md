```scheme
#lang web-server/insta
(define (start request)
  (response/xexpr
   '(html
     (head (title "My Blog"))
     (body (h1 "Under construction")))))
```

```scheme
(struct post (title body))
```

```scheme
(struct post (title body))
  title : string?
  body : string?
```

```scheme
blog : (listof post?)
```

```scheme
(define BLOG (list (post "First Post!"
                         "Hey, this is my first post!")))
```

```scheme
#lang web-server/insta
 
; A blog is a (listof post)
; and a post is a (post title body)
(struct post (title body))
 
; BLOG: blog
; The static blog.
(define BLOG
  (list (post "Second Post" "This is another post")
        (post "First Post" "This is my first post")))
 
; start: request -> response
; Consumes a request, and produces a page that displays all of the
; web content.
(define (start request)
  (render-blog-page BLOG request))
 
; render-blog-page: blog request -> response
; Consumes a blog and a request, and produces an HTML page
; of the content of the blog.
(define (render-blog-page a-blog request)
  (response/xexpr
   `(html (head (title "My Blog"))
          (body (h1 "My Blog")
                ,(render-posts a-blog)))))
 
; render-post: post -> xexpr
; Consumes a post, produces an xexpr fragment of the post.
(define (render-post a-post)
  `(div ((class "post"))
        ,(post-title a-post)
        (p ,(post-body a-post))))
 
; render-posts: blog -> xexpr
; Consumes a blog, produces an xexpr fragment
; of all its posts.
(define (render-posts a-blog)
  `(div ((class "posts"))
        ,@(map render-post a-blog)))
```

Now that we have these helper functions, we can extend our web application to handle form input. We’ll add a small form at the bottom of the web page, and we’ll adjust our program to handle the addition of new posts. So our new start method will check that the request has a parsable post, will then try to extend the set of posts, and will finally display the new set of blog posts

```scheme
#lang web-server/insta
 
; A blog is a (listof post)
; and a post is a (post title body)
(struct post (title body))
 
; BLOG: blog
; The static blog.
(define BLOG
  (list (post "Second Post" "This is another post")
        (post "First Post" "This is my first post")))
 
; start: request -> response
; Consumes a request and produces a page that displays all of the
; web content.
(define (start request)
  (define a-blog
    (cond [(can-parse-post? (request-bindings request))
           (cons (parse-post (request-bindings request))
                 BLOG)]
          [else
           BLOG]))
  (render-blog-page a-blog request))
 
 
; can-parse-post?: bindings -> boolean
; Produces true if bindings contains values for 'title and 'body.
(define (can-parse-post? bindings)
  (and (exists-binding? 'title bindings)
       (exists-binding? 'body bindings)))
 
 
; parse-post: bindings -> post
; Consumes a bindings, and produces a post out of the bindings.
(define (parse-post bindings)
  (post (extract-binding/single 'title bindings)
        (extract-binding/single 'body bindings)))
 
; render-blog-page: blog request -> response
; Consumes a blog and a request, and produces an HTML page
; of the content of the blog.
(define (render-blog-page a-blog request)
  (response/xexpr
   `(html (head (title "My Blog"))
          (body
           (h1 "My Blog")
           ,(render-posts a-blog)
           (form
            (input ((name "title")))
            (input ((name "body")))
            (input ((type "submit"))))))))
 
; render-post: post -> xexpr
; Consumes a post, produces an xexpr fragment of the post.
(define (render-post a-post)
  `(div ((class "post"))
        ,(post-title a-post)
        (p ,(post-body a-post))))
 
 
; render-posts: blog -> xexpr
; Consumes a blog, produces an xexpr fragment
; of all its posts.
(define (render-posts a-blog)
  `(div ((class "posts"))
        ,@(map render-post a-blog)))
```