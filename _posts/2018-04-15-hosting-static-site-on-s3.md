---
layout: post
title:  "Hosting a static website on S3"
categories: tech
tag: aws
---
1. Set up an AWS account and create a S3 bucket. The S3 bucket will be configured later to host a public website.
2. Suppose the website files are inside `/www` folder which is inside `/docs`, i.e., the site files are inside `/docs/www`. Go to `/docs` folder.
3. Install a gem package [s3_website](https://github.com/laurilehmijoki/s3_website) (If you have a gemfile, you can add it to the gemfile and then run `bundle install`)
    ```ruby
    gem install s3_website
    ```
4. Create `s3_website` config file. This will create a `s3_website.yml` file in `/docs` folder.
    ```ruby
    s3_website cfg create
    ```
5. Create `.env` file in `/docs` folder with S3 credentials. We will use these environment variables to configure `s3_website.yml` file.
    ```ruby
    S3_ID= aws access key
    S3_SECRET= aws secret key
    ```
6. Edit `s3_website.yml` file
    ```ruby
    s3_id: <%= ENV['S3_ID'] %>
    s3_secret: <%= ENV['S3_SECRET'] %>
    s3_bucket: bucketname

    site: www
    ```
    Add other necessary configurations: aws region, index file, error file, etc.
7. Apply `s3_website` configuration and set up the S3 bucket for web hosting. This step will configure the bucket to be public and to have appropriate permissions to host a website.
    ```ruby
    s3_website cfg apply
    ```
8. Push website files to S3
    ```ruby
    s3_website push
    ```
