# Starting with Octopress

I decided to give octopress a try because I found out the nginx + static blogging really benefit from the very small memory footprint, especially comparing to the JVM-based stuff I ever did and used.

And the octopress is mature now. So I want to give it a try.

Since I'm experienced with the jekyll system when I was playing with github pages, it's not painful for me to restart with octopress.

Here is my quick cook:

<!-- more -->

clone the git and correctly setup necessary ruby environment. [reference](http://octopress.org/docs/setup/)

``` bash
rake install
```

configure Rakefile with Rsync settings & comment the twitter settings (I don't need twitter) [reference](http://octopress.org/docs/configuring/)

``` ruby
# Be sure your public key is listed in your server's ~/.ssh/authorized_keys file
ssh_user       = "lqy@eri2.com"
ssh_port       = "22"
document_root  = "/srv/eri2.com"
rsync_delete   = true
rsync_args     = ""  # Any extra arguments to pass to rsync
deploy_default = "rsync"
```

if you haven't yet known how to set up public key as required above, please read [this article](http://www.eng.cam.ac.uk/help/jpmg/ssh/authorized_keys_howto.html)

configure _config.yml with site settings like title, author, etc

``` ruby
url: http://eri2.com
title: Evan Liu
subtitle: Ever in Abisko.
author: Evan Liu
```

modify source/_includes/custom/navigation.html for customizing the navigation bar, for exmaple

```
<ul class="main-navigation">
  <li><a href="{{ root_url }}/">Home</a></li>
  <li><a href="{{ root_url }}/blog">Blog</a></li>
  <li><a href="{{ root_url }}/blog/categories/misc">Misc</a></li>
  <li><a href="{{ root_url }}/blog/archives">Archives</a></li>
</ul>
```

modify sass/custom/_styles.scss for customizing the style, for example

``` css
@media only screen and (min-width: 1080px) {
	body > header {
		overflow:hidden;
		background-image:url('/images/abisko.jpg');
		background-repeat: repeat-x;
	}
}
```

add landing page ([reference](http://octopress.org/docs/theme/template/))

``` bash
mv source/index.html source/blog/index.html
rake new_page[index.markdown]
```

and modifying Rakefile: g_index_dir = 'source/blog'

``` ruby
blog_index_dir  = 'source/blog'    # directory for your blog's index page (if you put your index in source/blog/index.html, set this to 'source/blog')
```

start local watching (browse http://localhost:4000 )

``` bash
rake preview
```

start blogging

``` bash
rake new_post["This Is A Post"]
```

pre-publish: create eri2-nginx in source/ directory

```
server {
	server_name  eri2.com;
	access_log  /var/log/nginx/eri2.com.access.log;
	error_log  /var/log/nginx/eri2.com.error.log;

	location / {
		gzip on;
		root /srv/eri2.com;
		index index.html;
	}
}
```

for how to enable nginx config, read [this thread](http://stackoverflow.com/questions/4891344/nginx-how-do-i-add-new-site-server-name-in-nginx)

publish when satisfied

``` bash
rake generate
rake deploy
```

## APPENDIX
* [Markdown cheatsheet]({{root_url}}/page/markdown-cheatsheet.html) (this site)
* [Adding Math Equation support](http://www.idryman.org/blog/2012/03/10/writing-math-equations-on-octopress/)
* [Adding categories list to side bar](http://paz.am/blog/blog/2012/06/25/octopress-category-list-plugin/)
* [octopress graphviz](https://github.com/kui/octopress-graphviz)
