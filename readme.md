# centos-freeradius-modev
centos based freerdius for module devleopment
It was a quick and easy way for me to get a good know environment that we use in production.

This images is useful to develop radius modules in a known environment.
I have not intended to use this in production.

This way I can iterate quickly in developming radius modules with out beaking our production setup.

When you want to see how your module is affecting the running radius server


$ docker -D run -P -d  -it b83917b34cad
docker -D run -P -d --name "radius" b83917b34cad
$ raddebug



https://wiki.freeradius.org/guide/Basic-configuration-HOWTO


echo "User-Name = test" | /usr/local/bin/radclient localhost:32769 auth s3cr3t
