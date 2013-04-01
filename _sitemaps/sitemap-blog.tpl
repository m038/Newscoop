<?xml version="1.0" encoding="utf-8"?>
<urlset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd" xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">  
    <url>
        <loc>http://blogs.zentralplus.ch</loc>
        <lastmod>{{ $smarty.now|camp_date_format:"%Y-%m-%d" }}</lastmod>
        <changefreq>daily</changefreq>
        <priority>1.0</priority>
    </url>
{{ set_publication identifier="4" }}     
{{ set_current_issue }}
{{ list_sections }}
    <url>
        <loc>http://{{ $gimme->publication->site }}{{ uri options="section" }}</loc>
        <changefreq>daily</changefreq>
        <priority>0.4</priority>
    </url>
{{ /list_sections }} 
{{ list_articles ignore_publication="true" ignore_issue="true" ignore_section="true" order="bypublishdate desc" constraints="type is blog" }}
    {{ if $gimme->article->section->defined && $gimme->article->section->identifier > 0 }}
    <url>
        <loc>http://{{ $gimme->publication->site }}{{ uri options="article" }}</loc>
        <lastmod>{{ $gimme->article->publish_date|camp_date_format:"%Y-%m-%d" }}</lastmod>
        <changefreq>daily</changefreq>
        <priority>0.8</priority>
    </url>
    {{ /if }}
{{ /list_articles }}
</urlset>    
