updated later, okay?

 0. sylvain@ubuntu$ dig www.holberton.online | grep -A1 'ANSWER SECTION:'
    ;; ANSWER SECTION:

        www.holberton.online.   87  IN  A   54.210.47.110
    
    sylvain@ubuntu$ dig lb-01.holberton.online | grep -A1 'ANSWER SECTION:'
    ;; ANSWER SECTION:

        lb-01.holberton.online. 101 IN  A   54.210.47.110
    
    sylvain@ubuntu$ dig web-01.holberton.online | grep -A1 'ANSWER SECTION:'
    ;; ANSWER SECTION:

        web-01.holberton.online. 212    IN  A   34.198.248.145
    
    sylvain@ubuntu$ dig web-02.holberton.online | grep -A1 'ANSWER SECTION:'
    ;; ANSWER SECTION:

        web-02.holberton.online. 298    IN  A   54.89.38.100
    
    sylvain@ubuntu$

    sylvain@ubuntu$

    sylvain@ubuntu$ ./0-world_wide_web holberton.online

        The subdomain www is a A record and points to 54.210.47.110
        The subdomain lb-01 is a A record and points to 54.210.47.110
        The subdomain web-01 is a A record and points to 34.198.248.145
        The subdomain web-02 is a A record and points to 54.89.38.100
    sylvain@ubuntu$

    sylvain@ubuntu$ ./0-world_wide_web holberton.online web-02

        The subdomain web-02 is a A record and points to 54.89.38.100
    sylvain@ubuntu$

 1. sylvain@ubuntu$ curl -sI https://www.holberton.online

        HTTP/1.1 200 OK
        Server: nginx/1.4.6 (Ubuntu)
        Date: Tue, 28 Feb 2017 01:52:04 GMT
        Content-Type: text/html
        Content-Length: 30
        Last-Modified: Tue, 21 Feb 2017 07:21:32 GMT
        ETag: "58abea7c-1e"
        X-Served-By: 03-web-01
        Accept-Ranges: bytes
    sylvain@ubuntu$

    sylvain@ubuntu$ curl https://www.holberton.online

        Holberton School for the win!
    
    sylvain@ubuntu$

 2. sylvain@ubuntu$ curl -sIL http://www.holberton.online

        HTTP/1.1 301 Moved Permanently
        Content-length: 0
        Location: https://www.holberton.online/
        Connection: close

        HTTP/1.1 200 OK
        Server: nginx/1.4.6 (Ubuntu)
        Date: Tue, 28 Feb 2017 02:19:18 GMT
        Content-Type: text/html
        Content-Length: 30
        Last-Modified: Tue, 21 Feb 2017 07:21:32 GMT
        ETag: "58abea7c-1e"
        X-Served-By: 03-web-01
        Accept-Ranges: bytes

    sylvain@ubuntu$
